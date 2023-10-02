import 'package:crypto_app/core/config/app_config.dart';
import 'package:crypto_app/data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_app/data/repositories/crypto_repository_impl.dart';
import 'package:crypto_app/domain/repositories/crypto_repository.dart';
import 'package:crypto_app/domain/usecases/close_connection_usecase.dart';
import 'package:crypto_app/domain/usecases/get_price_usecase.dart';
import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future setupInjector(AppConfig appConfig) async {
  final CryptoRemoteDataSource cryptoRemoteDataSource =
      CryptoRemoteDataSourceImpl(wsUrl: appConfig.webSocketUrl);
  final CryptoRepository cryptoRepository =
      CryptoRepositoryImpl(cryptoRemoteDataSource: cryptoRemoteDataSource);
  final GetPriceUseCase getPriceUseCase =
      GetPriceUseCase(cryptoRepository: cryptoRepository);

  final CloseConnectionUseCase closeConnectionUseCase =
      CloseConnectionUseCase(cryptoRepository: cryptoRepository);

  final PriceBloc priceBloc = PriceBloc(
      getPriceUseCase: getPriceUseCase,
      closeConnectionUseCase: closeConnectionUseCase);
  getIt.registerSingleton<PriceBloc>(priceBloc);
}
