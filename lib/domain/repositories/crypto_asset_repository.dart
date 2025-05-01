import 'package:coin_cap/domain/entities/crypto_asset.dart';

abstract class CryptoAssetRepository {
  Future<List<CryptoAsset>> getAssets({
    required int limit,
    required int offset,
  });
}
