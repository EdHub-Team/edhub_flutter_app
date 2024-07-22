import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/router/data/router.dart';
import 'package:edhub_flutter_app/core/router/data/utils/path/route_path.dart';
import 'package:edhub_flutter_app/features/auth/presentation/pages/login_page.dart';
import 'package:edhub_flutter_app/features/auth/presentation/pages/signup_page.dart';
import 'package:edhub_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:edhub_flutter_app/features/learn/presentation/pages/learn_page.dart';
import 'package:edhub_flutter_app/features/learn/presentation/pages/summary_page.dart';
import 'package:edhub_flutter_app/features/master/presentation/pages/generate_quiz_page.dart';
import 'package:edhub_flutter_app/features/master/presentation/pages/master_page.dart';
import 'package:edhub_flutter_app/features/master/presentation/pages/quiz_page.dart';
import 'package:edhub_flutter_app/features/splash/presentation/pages/splash_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        //AUTH
        AutoRoute(
          path: RoutePath.loginPage,
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: RoutePath.signUpPage,
          page: SignUpRoute.page,
        ),

        //HOME
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          guards: const [
            SplashGuard(),
            AuthGuard(),
          ],
        ),

        //LEARN
        AutoRoute(
          path: RoutePath.learnPage,
          page: LearnRoute.page,
        ),
        AutoRoute(
          path: RoutePath.summaryPage,
          page: SummaryRoute.page,
        ),

        //MASTER
        AutoRoute(
          path: RoutePath.masterPage,
          page: MasterRoute.page,
        ),
        AutoRoute(
          path: RoutePath.generateQuizPage,
          page: GenerateQuizRoute.page,
        ),
        AutoRoute(
          path: RoutePath.quizPage,
          page: QuizRoute.page,
        ),

        //SHARED
        AutoRoute(
          path: RoutePath.splashPage,
          page: SplashRoute.page,
        ),
      ];
}
