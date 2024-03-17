import 'dart:async';

import 'package:bitcoin/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';

import 'repositories/crypto_coins/crypto_coins.dart';

void main() async {
  runZonedGuarded(
    () => appInZone(),
    (e, st) => GetIt.I<Talker>().handle(e, st)
  );
  // runApp(const App());
}

void appInZone() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();
  final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_HOST']!
  ));
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false
      )
    ),
  );
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false
    )
  );

  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  talker.info(app.options.projectId);

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: dio)
  );

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runApp(const App());
}
