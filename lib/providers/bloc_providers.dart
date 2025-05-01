import 'package:coin_cap/domain/repositories/crypto_asset_repository.dart';
import 'package:coin_cap/presentation/bloc/crypto_asset_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final blocProvider = [
  BlocProvider<CryptoAssetBloc>(
    create:
        (context) =>
            CryptoAssetBloc(repository: context.read<CryptoAssetRepository>())
              ..add(const CryptoAssetEvent.loadInitial()),
  ),
];
