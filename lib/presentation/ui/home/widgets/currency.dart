import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Currency extends StatelessWidget {
  const Currency({super.key, required this.cryptoName});

  final String cryptoName;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PriceBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(cryptoName),
        leading: IconButton(
            onPressed: () {
              context.read<PriceBloc>().add(const CloseConnection());
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: state.when(
          initial: () => const FlutterLogo(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (price) => Column(
            children: [
              Text(cryptoName),
              const SizedBox(
                height: 12,
              ),
              Text(price.price)
            ],
          ),
          error: () => const Text('failed to get price'),
        ),
      ),
    );
  }
}
