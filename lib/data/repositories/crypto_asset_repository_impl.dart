
import 'package:coin_cap/data/datasources/crypto_asset_remote_data_source.dart';
import 'package:coin_cap/data/models/crypto_asset_model.dart';
import 'package:coin_cap/domain/entities/crypto_asset.dart';
import 'package:coin_cap/domain/repositories/crypto_asset_repository.dart';

class CryptoAssetRepositoryImpl implements CryptoAssetRepository {
  final CryptoAssetRemoteDataSource remoteDataSource;

  CryptoAssetRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CryptoAsset>> getAssets({required int limit, required int offset}) async {
    final models = await remoteDataSource.getAssets(limit: limit, offset: offset);
    return models.map((m) => m.toEntity()).toList();
  }
}
