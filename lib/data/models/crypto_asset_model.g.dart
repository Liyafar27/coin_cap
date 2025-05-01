// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoAssetModelImpl _$$CryptoAssetModelImplFromJson(
  Map<String, dynamic> json,
) => _$CryptoAssetModelImpl(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  priceUsd: json['priceUsd'] as String,
);

Map<String, dynamic> _$$CryptoAssetModelImplToJson(
  _$CryptoAssetModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'priceUsd': instance.priceUsd,
};
