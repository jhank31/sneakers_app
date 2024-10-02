import 'package:e_commers_app/core/configs/routes/app_routes.dart';
import 'package:e_commers_app/core/theme/app_theme.dart';
import 'package:e_commers_app/firebase_options.dart';
import 'package:e_commers_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashCubit()..appStarted(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'E-coomerce',
        theme: AppTheme.appTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
