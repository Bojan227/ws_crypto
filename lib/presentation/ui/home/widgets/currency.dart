import 'package:crypto_app/core/injector/injector.dart';
import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Currency extends StatelessWidget {
  const Currency({
    super.key,
    required this.cryptoName,
    required this.id,
  });

  final String cryptoName;
  final String id;

  @override
  Widget build(BuildContext context) {
    final PriceBloc priceBloc = getIt<PriceBloc>();

    return BlocProvider.value(
      value: priceBloc
        ..add(
          GetPrice(cryptoName: id),
        ),
      child: Builder(
        builder: (context) {
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
              child: BlocBuilder<PriceBloc, PriceState>(
                builder: (_, state) {
                  if (state.status == Status.initial) {
                    return const FlutterLogo();
                  }

                  if (state.status == Status.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.status == Status.loaded) {
                    return Column(
                      children: [
                        Text(cryptoName),
                        const SizedBox(
                          height: 12,
                        ),
                        Text("${state.price.price}")
                      ],
                    );
                  }

                  return const Text('failed to get price');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
