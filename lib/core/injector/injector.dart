import 'package:crypto_app/core/config/app_config.dart';
import 'package:crypto_app/core/websocket/websocket_connection.dart';
import 'package:crypto_app/data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_app/data/repositories/crypto_repository_impl.dart';
import 'package:crypto_app/domain/repositories/crypto_repository.dart';
import 'package:crypto_app/domain/usecases/close_connection_usecase.dart';
import 'package:crypto_app/domain/usecases/get_assets_usecase.dart';
import 'package:crypto_app/domain/usecases/get_price_usecase.dart';
import 'package:crypto_app/presentation/blocs/assets/assets_bloc.dart';
import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future setupInjector(AppConfig appConfig) async {
  final dio = Dio();
  dio.options.baseUrl = appConfig.apiUrl;

  final WebSocketConnection webSocketConnection =
      WebSocketConnection(wsUrl: appConfig.webSocketUrl);

  final CryptoRemoteDataSource cryptoRemoteDataSource =
      CryptoRemoteDataSourceImpl(
          webSocketConnection: webSocketConnection, dio: dio);

  final CryptoRepository cryptoRepository =
      CryptoRepositoryImpl(cryptoRemoteDataSource: cryptoRemoteDataSource);

  getIt.registerSingleton(cryptoRepository);

  final GetPriceUseCase getPriceUseCase =
      GetPriceUseCase(cryptoRepository: cryptoRepository);

  final GetAssetsUseCase getAssetsUseCase =
      GetAssetsUseCase(cryptoRepository: cryptoRepository);

  final CloseConnectionUseCase closeConnectionUseCase =
      CloseConnectionUseCase(cryptoRepository: cryptoRepository);

  final PriceBloc priceBloc = PriceBloc(
      getPriceUseCase: getPriceUseCase,
      closeConnectionUseCase: closeConnectionUseCase);

  getIt.registerSingleton<PriceBloc>(priceBloc);

  final AssetsBloc assetsBloc = AssetsBloc(
    getAssetsUseCase: getAssetsUseCase,
  );

  getIt.registerSingleton<AssetsBloc>(assetsBloc);
}
