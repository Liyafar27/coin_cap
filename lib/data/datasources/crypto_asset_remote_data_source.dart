import 'package:coin_cap/data/models/crypto_asset_model.dart';
import 'package:dio/dio.dart';

abstract class CryptoAssetRemoteDataSource {
  Future<List<CryptoAssetModel>> getAssets({required int limit, required int offset});
}

class CryptoAssetRemoteDataSourceImpl implements CryptoAssetRemoteDataSource {
  final Dio dio;

  CryptoAssetRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CryptoAssetModel>> getAssets({required int limit, required int offset}) async {
    final response = await dio.get(
      'https://rest.coincap.io/v3/assets',
      queryParameters: {
        'limit': limit,
        'offset': offset,
        'apiKey': 'c422bf86b0eab87dbd7a054cc30429f241659d610e18a56b8c08d6f3a7494ac2',
      },
    );

    final List<dynamic> data = response.data['data'];
    return data.map((json) => CryptoAssetModel.fromJson(json)).toList();
  }
}
