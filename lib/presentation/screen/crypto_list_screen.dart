import 'dart:math';

import 'package:coin_cap/presentation/bloc/crypto_asset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoAssetScreen extends StatefulWidget {
  const CryptoAssetScreen({super.key});

  @override
  State<CryptoAssetScreen> createState() => _CryptoAssetScreenState();
}

class _CryptoAssetScreenState extends State<CryptoAssetScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<CryptoAssetBloc>().add(const CryptoAssetEvent.loadInitial());
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      context.read<CryptoAssetBloc>().add(const CryptoAssetEvent.loadMore());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CryptoAssetBloc, CryptoAssetState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (assets, hasReachedEnd) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<CryptoAssetBloc>().add(
                    const CryptoAssetEvent.refresh(),
                  );
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: hasReachedEnd ? assets.length : assets.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= assets.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final asset = assets[index];
                    final color = _generateColorFromIndex(index);

                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 400 + index * 30),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        leading: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        title: Text(
                          asset.symbol,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        trailing: Text(
                          '\$${asset.priceUsd.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (message) => Center(child: Text('Ошибка: $message')),
          );
        },
      ),
    );
  }

  Color _generateColorFromIndex(int index) {
    final random = Random(index);
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
