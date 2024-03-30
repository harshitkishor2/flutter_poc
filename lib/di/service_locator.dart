import 'package:dio/dio.dart';
import 'package:flutter_poc/helpers/request_interceptors.dart';
import 'package:flutter_poc/services/services.dart';
import 'package:flutter_poc/view_models/blocs.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
  //start

/* ==================================== Features ====================================== */

  //! blocs
  di.registerFactory(
    () => AuthenticationBloc(),
  );

  di.registerFactory(
    () => AppSettingsBloc(),
  );

  //! Services
  di.registerLazySingleton<TestRepo>(() => TestImpl(dio: di()));

/* =================================== External ======================================= */

// DioClient
  di.registerLazySingleton<Dio>(() => DioClient().provideDio());
  // di.registerLazySingleton<MediaService>(() => MediaServiceImpl());

  //End
}
