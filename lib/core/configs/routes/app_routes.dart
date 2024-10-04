import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/presentation/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => SinginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => ResetPasswordPage(),
    ),
    GoRoute(
      path: '/password-reset-email',
      builder: (context, state) => const PasswordResetEmailPage(),
    ),
    GoRoute(
      path: '/gender-and-age-selection',
      builder: (context, state) {
        UserCreationReq userCreationReq = state.extra as UserCreationReq;
        return GenderAndAgeSelectionPage(
          userCreationReq: userCreationReq,
        );
      },
    ),
  ],
);
