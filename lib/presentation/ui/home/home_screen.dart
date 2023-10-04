import 'package:crypto_app/core/injector/injector.dart';
import 'package:crypto_app/core/theme/theme.dart';
import 'package:crypto_app/domain/repositories/crypto_repository.dart';
import 'package:crypto_app/domain/usecases/close_connection_usecase.dart';
import 'package:crypto_app/domain/usecases/get_price_usecase.dart';
import 'package:crypto_app/presentation/blocs/assets/assets_bloc.dart';
import 'package:crypto_app/presentation/blocs/price/cubit/price_tracker_cubit.dart';
import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:crypto_app/presentation/ui/home/widgets/asset_item.dart';
import 'package:crypto_app/presentation/ui/home/widgets/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assetsState = context.watch<AssetsBloc>().state;

    final CryptoRepository cryptoRepository = getIt<CryptoRepository>();

    final GetPriceUseCase getPriceUseCase =
        GetPriceUseCase(cryptoRepository: cryptoRepository);
    final CloseConnectionUseCase closeConnectionUseCase =
        CloseConnectionUseCase(cryptoRepository: cryptoRepository);

    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const Text('Crypto'),
      ),
      body: assetsState.when(
        initial: () => const FlutterLogo(),
        loading: () => const CircularProgressIndicator(),
        loaded: (assets) => SingleChildScrollView(
          child: Column(
            children: [
              for (var asset in assets)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) {
                        return Currency(cryptoName: asset.name, id: asset.id);
                      },
                    ));
                  },
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => PriceBloc(
                            getPriceUseCase: getPriceUseCase,
                            closeConnectionUseCase: closeConnectionUseCase)
                          ..add(
                            GetPrice(cryptoName: asset.id),
                          ),
                      ),
                      BlocProvider(
                        create: (context) => PriceTrackerCubit(),
                      ),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: AssetItem(asset: asset),
                    ),
                  ),
                ),
            ],
          ),
        ),
        failed: () => Text(
          "Failed to fetch",
          style: const TextStyle()
              .copyWith(color: colors.onSecondary, fontSize: 24),
        ),
      ),
    );
  }
}
