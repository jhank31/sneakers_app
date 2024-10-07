import 'package:e_commers_app/domain/auth/usecases_auth.dart';
import 'package:e_commers_app/presentation/home/widgets/widgets.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await sl<LogoutUsecase>().call()) {
            // ignore: use_build_context_synchronously
            context.go('/signin');
          }
        },
        child: const Icon(Icons.logout),
      ),
      //? este widget es para cambiar el color de la barra de estado y usar el color de la app
      body: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: Column(
              children: [
                Header(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
