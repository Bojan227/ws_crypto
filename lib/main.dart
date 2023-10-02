import 'package:crypto_app/core/config/app_config.dart';
import 'package:crypto_app/core/injector/injector.dart';
import 'package:crypto_app/presentation/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppConfig appConfig = AppConfig(webSocketUrl: "wss://ws.coincap.io");

  await setupInjector(appConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
