import 'package:aprendiendoflutter/config/router/app_router_notifier.dart';
import 'package:aprendiendoflutter/presentation/screens/login/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:aprendiendoflutter/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/mycourses',
        name: MyCoursesScreen.name,
        builder: (context, state) => const MyCoursesScreen(),
      ),
      GoRoute(
        path: '/cart',
        name: CartScreen.name,
        builder: (context, state) => const CartScreen(),
      ),
      // GoRoute(
      //   path: '/detail',
      //   name: CourseDetailPage.name,
      //   builder: (context, state) => const CourseDetailPage(curso),
      // ),
      GoRoute(
        path: '/panelcourse',
        name: PanelCoursePage.name,
        builder: (context, state) => const PanelCoursePage(),
      ),
      GoRoute(
        path: '/paneldetailcourse',
        name: PanelDetailCoursePage.name,
        builder: (context, state) => const PanelDetailCoursePage(),
      ),
      GoRoute(
        path: '/create-course',
        name: CreateCourseScreen.name,
        builder: (context, state) => const CreateCourseScreen(),
      ),
      GoRoute(
        path: '/notification',
        name: NotificationScreen.name,
        builder: (context, state) => const NotificationScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' &&
          authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') {
          return null;
        }

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/home';
        }
      }

      return null;
    },
  );
});
