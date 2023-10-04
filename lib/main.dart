import 'package:crypto_app/core/config/app_config.dart';
import 'package:crypto_app/core/injector/injector.dart';
import 'package:crypto_app/core/theme/theme.dart';
import 'package:crypto_app/presentation/blocs/assets/assets_bloc.dart';
import 'package:crypto_app/presentation/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppConfig appConfig = AppConfig(
      webSocketUrl: "wss://ws.coincap.io", apiUrl: "https://api.coincap.io/v2");

  await setupInjector(appConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AssetsBloc assetsBloc = getIt<AssetsBloc>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          extensions: <ThemeExtension<dynamic>>[AppColorsExtension.light]),
      home: BlocProvider(
        create: (context) => assetsBloc..add(const GetAssets()),
        child: const HomeScreen(),
      ),
    );
  }
}
