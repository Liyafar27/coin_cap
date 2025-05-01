import 'package:coin_cap/domain/entities/crypto_asset.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_asset_model.freezed.dart';
part 'crypto_asset_model.g.dart';

@freezed
class CryptoAssetModel with _$CryptoAssetModel {
  const factory CryptoAssetModel({
    required String id,
    required String symbol,
    required String name,
    @JsonKey(name: 'priceUsd') required String priceUsd,
  }) = _CryptoAssetModel;

  factory CryptoAssetModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoAssetModelFromJson(json);
}

extension CryptoAssetModelX on CryptoAssetModel {
  CryptoAsset toEntity() {
    return CryptoAsset(
      id: id,
      symbol: symbol,
      name: name,
      priceUsd: double.tryParse(priceUsd) ?? 0.0,
    );
  }
}
