import 'package:coin_cap/data/datasources/crypto_asset_remote_data_source.dart';
import 'package:coin_cap/data/repositories/crypto_asset_repository_impl.dart';
import 'package:coin_cap/domain/repositories/crypto_asset_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show ReadContext, RepositoryProvider;

import '../main.dart';

final repositoryProviders = [
  RepositoryProvider<CryptoAssetRemoteDataSource>(
    create: (_) => CryptoAssetRemoteDataSourceImpl(dio: dio),
  ),
  RepositoryProvider<CryptoAssetRepository>(
    create:
        (context) => CryptoAssetRepositoryImpl(
          remoteDataSource: context.read<CryptoAssetRemoteDataSource>(),
        ),
  ),
];
