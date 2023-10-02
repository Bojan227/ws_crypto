import 'package:crypto_app/core/injector/injector.dart';
import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:crypto_app/presentation/ui/home/widgets/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final cryptos = ['bitcoin', 'tron'];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PriceBloc priceBloc = getIt<PriceBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cryptos
            .map(
              (crypto) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                        value: priceBloc
                          ..add(
                            GetPrice(cryptoName: crypto),
                          ),
                        child: Currency(cryptoName: crypto),
                      );
                    },
                  ));
                },
                child: Text(
                  crypto.toUpperCase(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
