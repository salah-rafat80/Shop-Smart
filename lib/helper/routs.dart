import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../View/Screens/login_screen.dart';
import '../View/Screens/main_screen.dart';
import '../View/Screens/details_screen.dart';
import '../Model/product_model.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeOutCubic))
              .animate(animation);
          return FadeTransition(opacity: animation, child: SlideTransition(position: offsetAnimation, child: child));
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: MainScreen.id,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeOutCubic))
              .animate(animation);
          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: '/details/:productId',
      pageBuilder: (context, state) {
        final productId = state.pathParameters['productId']!;
        final product = Product.products.firstWhere(
          (p) => p.id == productId,
          orElse: () => Product.products.first,
        );

        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailsScreen(product: product),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(1.0, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOutCubic))
             .animate(animation);

            final fadeAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
            ));

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),
    // GoRoute(
    //   path: CartScreen.id, // '/cart'
    //   pageBuilder: (context, state) => CustomTransitionPage(
    //     key: state.pageKey,
    //     child: const CartScreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       final offset = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
    //           .chain(CurveTween(curve: Curves.easeOutCubic))
    //           .animate(animation);
    //       return SlideTransition(position: offset, child: FadeTransition(opacity: animation, child: child));
    //     },
    //     transitionDuration: const Duration(milliseconds: 300),
    //   ),
    // ),
  ],
);
