import 'package:e_commers_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commers_app/common/helpers/size_screen/size_screen.dart';
import 'package:e_commers_app/presentation/home/bloc/loading_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/new_products/new_product_display_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/top_sellings/top_selling_product_display_cubit.dart';
import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/home/bloc/user_info/user_info_display_cubit.dart';
import 'package:e_commers_app/presentation/home/widgets/widgets.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final LoadingCubit loadingCubit = LoadingCubit();
  HomePage({super.key});

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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
              child: BlocProvider(
                create: (context) => loadingCubit,
                child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                          create: (_) => CategoriesDisplayCubit(loadingCubit)
                            ..displayCategories()),
                      BlocProvider(
                          create: (_) => UserInfoDisplayCubit(loadingCubit)
                            ..displayUserInfo()),
                      BlocProvider(
                          create: (_) =>
                              TopSellingProductDisplayCubit(loadingCubit)
                                ..displayProducts()),
                      BlocProvider(
                          create: (_) => NewProductDisplayCubit(loadingCubit)
                            ..displayProducts()),
                    ],
                    child: BlocBuilder<LoadingCubit, int>(
                      builder: (context, state) {
                        if (state > 0) {
                          return SizedBox(
                            height: context.screenHeight(hisVar: 0.9),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return const Column(
                            children: [
                              Header(),
                              SizedBox(height: 16),
                              SearchField(),
                              SizedBox(height: 16),
                              Categories(),
                              SizedBox(height: 16),
                              Center(child: TopSellings()),
                              SizedBox(height: 16),
                              NewIn(),
                              SizedBox(height: 16),
                            ],
                          );
                        }
                      },
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
