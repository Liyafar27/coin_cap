// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CryptoAssetModel _$CryptoAssetModelFromJson(Map<String, dynamic> json) {
  return _CryptoAssetModel.fromJson(json);
}

/// @nodoc
mixin _$CryptoAssetModel {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceUsd')
  String get priceUsd => throw _privateConstructorUsedError;

  /// Serializes this CryptoAssetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CryptoAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CryptoAssetModelCopyWith<CryptoAssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoAssetModelCopyWith<$Res> {
  factory $CryptoAssetModelCopyWith(
    CryptoAssetModel value,
    $Res Function(CryptoAssetModel) then,
  ) = _$CryptoAssetModelCopyWithImpl<$Res, CryptoAssetModel>;
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    @JsonKey(name: 'priceUsd') String priceUsd,
  });
}

/// @nodoc
class _$CryptoAssetModelCopyWithImpl<$Res, $Val extends CryptoAssetModel>
    implements $CryptoAssetModelCopyWith<$Res> {
  _$CryptoAssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CryptoAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? priceUsd = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            priceUsd:
                null == priceUsd
                    ? _value.priceUsd
                    : priceUsd // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CryptoAssetModelImplCopyWith<$Res>
    implements $CryptoAssetModelCopyWith<$Res> {
  factory _$$CryptoAssetModelImplCopyWith(
    _$CryptoAssetModelImpl value,
    $Res Function(_$CryptoAssetModelImpl) then,
  ) = __$$CryptoAssetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    @JsonKey(name: 'priceUsd') String priceUsd,
  });
}

/// @nodoc
class __$$CryptoAssetModelImplCopyWithImpl<$Res>
    extends _$CryptoAssetModelCopyWithImpl<$Res, _$CryptoAssetModelImpl>
    implements _$$CryptoAssetModelImplCopyWith<$Res> {
  __$$CryptoAssetModelImplCopyWithImpl(
    _$CryptoAssetModelImpl _value,
    $Res Function(_$CryptoAssetModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CryptoAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? priceUsd = null,
  }) {
    return _then(
      _$CryptoAssetModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        priceUsd:
            null == priceUsd
                ? _value.priceUsd
                : priceUsd // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoAssetModelImpl implements _CryptoAssetModel {
  const _$CryptoAssetModelImpl({
    required this.id,
    required this.symbol,
    required this.name,
    @JsonKey(name: 'priceUsd') required this.priceUsd,
  });

  factory _$CryptoAssetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoAssetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  @JsonKey(name: 'priceUsd')
  final String priceUsd;

  @override
  String toString() {
    return 'CryptoAssetModel(id: $id, symbol: $symbol, name: $name, priceUsd: $priceUsd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoAssetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, name, priceUsd);

  /// Create a copy of CryptoAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoAssetModelImplCopyWith<_$CryptoAssetModelImpl> get copyWith =>
      __$$CryptoAssetModelImplCopyWithImpl<_$CryptoAssetModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoAssetModelImplToJson(this);
  }
}

abstract class _CryptoAssetModel implements CryptoAssetModel {
  const factory _CryptoAssetModel({
    required final String id,
    required final String symbol,
    required final String name,
    @JsonKey(name: 'priceUsd') required final String priceUsd,
  }) = _$CryptoAssetModelImpl;

  factory _CryptoAssetModel.fromJson(Map<String, dynamic> json) =
      _$CryptoAssetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  @JsonKey(name: 'priceUsd')
  String get priceUsd;

  /// Create a copy of CryptoAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoAssetModelImplCopyWith<_$CryptoAssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
