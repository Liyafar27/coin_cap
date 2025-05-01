import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:coin_cap/domain/entities/crypto_asset.dart';
import 'package:coin_cap/domain/repositories/crypto_asset_repository.dart';

part 'crypto_asset_bloc.freezed.dart';

@freezed
class CryptoAssetEvent with _$CryptoAssetEvent {
  const factory CryptoAssetEvent.loadInitial() = LoadInitialAssets;
  const factory CryptoAssetEvent.loadMore() = LoadMoreAssets;
  const factory CryptoAssetEvent.refresh() = RefreshAssets;
  const factory CryptoAssetEvent.reset() = ResetAssets;
}

@freezed
class CryptoAssetState with _$CryptoAssetState {
  const factory CryptoAssetState.initial() = _Initial;
  const factory CryptoAssetState.loading() = _Loading;
  const factory CryptoAssetState.loaded({
    required List<CryptoAsset> assets,
    required bool hasReachedEnd,
  }) = _Loaded;
  const factory CryptoAssetState.error(String message) = _Error;
}

class CryptoAssetBloc extends Bloc<CryptoAssetEvent, CryptoAssetState> {
  final CryptoAssetRepository repository;
  static const _pageSize = 15;

  int _offset = 0;
  bool _isFetching = false;

  CryptoAssetBloc({required this.repository}) : super(const _Initial()) {
    on<LoadInitialAssets>(_onLoadInitial);
    on<LoadMoreAssets>(_onLoadMore);
    on<RefreshAssets>(_onRefresh);
    on<ResetAssets>(_onReset);
  }

  Future<void> _onLoadInitial(
      LoadInitialAssets event, Emitter<CryptoAssetState> emit) async {
    emit(const CryptoAssetState.loading());
    _offset = 0;
    try {
      final assets = await repository.getAssets(limit: _pageSize, offset: _offset);
      emit(CryptoAssetState.loaded(
        assets: assets,
        hasReachedEnd: assets.length < _pageSize,
      ));
      _offset += assets.length;
    } catch (e) {
      emit(CryptoAssetState.error(e.toString()));
    }
  }

  Future<void> _onLoadMore(
      LoadMoreAssets event, Emitter<CryptoAssetState> emit) async {
    if (_isFetching || state is! _Loaded) return;
    _isFetching = true;
    try {
      final currentState = state as _Loaded;
      final newAssets = await repository.getAssets(limit: _pageSize, offset: _offset);
      final updatedAssets = List.of(currentState.assets)..addAll(newAssets);
      emit(currentState.copyWith(
        assets: updatedAssets,
        hasReachedEnd: newAssets.length < _pageSize,
      ));
      _offset += newAssets.length;
    } catch (e) {
      emit(CryptoAssetState.error(e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _onRefresh(
      RefreshAssets event, Emitter<CryptoAssetState> emit) async {
    _offset = 0;
    try {
      final assets = await repository.getAssets(limit: _pageSize, offset: _offset);
      emit(CryptoAssetState.loaded(
        assets: assets,
        hasReachedEnd: assets.length < _pageSize,
      ));
      _offset += assets.length;
    } catch (e) {
      emit(CryptoAssetState.error(e.toString()));
    }
  }

  Future<void> _onReset(
      ResetAssets event, Emitter<CryptoAssetState> emit) async {
    emit(const CryptoAssetState.initial());
    _offset = 0;
  }
}
