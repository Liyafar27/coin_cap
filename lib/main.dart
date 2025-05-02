import 'package:coin_cap/data/repositories/crypto_asset_repository_impl.dart';
import 'package:coin_cap/presentation/screen/crypto_list_screen.dart';
import 'package:coin_cap/providers/bloc_providers.dart';
import 'package:coin_cap/providers/repositories_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasources/crypto_asset_remote_data_source.dart';

final dio = Dio();

final remoteDataSource = CryptoAssetRemoteDataSourceImpl(dio: dio);

final repository = CryptoAssetRepositoryImpl(
  remoteDataSource: remoteDataSource,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Assets',
      theme: ThemeData(
        fontFamily: 'SFProText',
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MultiRepositoryProvider(
        providers: repositoryProviders,
        child: MultiBlocProvider(
          providers: blocProvider,
          child: const CryptoAssetScreen(),
        ),
      ),
    );
  }
}
