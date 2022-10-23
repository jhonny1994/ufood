// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../../favorites/presentation/favorites_page.dart' as _i6;
import '../../../recipes/domain/recipe.dart' as _i11;
import '../../../recipes/presentation/recipes_page.dart' as _i5;
import '../../../search/presentation/search_page.dart' as _i7;
import '../../../splash/presentation/onboarding_page.dart' as _i2;
import '../base_page.dart' as _i4;
import '../error_page.dart' as _i3;
import '../loading_page.dart' as _i1;
import '../recipe_details_page.dart' as _i8;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ErrorPage(),
      );
    },
    BaseRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.BasePage(),
      );
    },
    RecipesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RecipesPage(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavoritesPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SearchPage(),
      );
    },
    RecipeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailsRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.RecipeDetailsPage(
          args.recipe,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          LoadingRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-page',
        ),
        _i9.RouteConfig(
          ErrorRoute.name,
          path: '/error-page',
        ),
        _i9.RouteConfig(
          BaseRoute.name,
          path: '/base-page',
        ),
        _i9.RouteConfig(
          RecipesRoute.name,
          path: '/recipes-page',
        ),
        _i9.RouteConfig(
          FavoritesRoute.name,
          path: '/favorites-page',
        ),
        _i9.RouteConfig(
          SearchRoute.name,
          path: '/search-page',
        ),
        _i9.RouteConfig(
          RecipeDetailsRoute.name,
          path: '/recipe-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoadingPage]
class LoadingRoute extends _i9.PageRouteInfo<void> {
  const LoadingRoute()
      : super(
          LoadingRoute.name,
          path: '/',
        );

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.ErrorPage]
class ErrorRoute extends _i9.PageRouteInfo<void> {
  const ErrorRoute()
      : super(
          ErrorRoute.name,
          path: '/error-page',
        );

  static const String name = 'ErrorRoute';
}

/// generated route for
/// [_i4.BasePage]
class BaseRoute extends _i9.PageRouteInfo<void> {
  const BaseRoute()
      : super(
          BaseRoute.name,
          path: '/base-page',
        );

  static const String name = 'BaseRoute';
}

/// generated route for
/// [_i5.RecipesPage]
class RecipesRoute extends _i9.PageRouteInfo<void> {
  const RecipesRoute()
      : super(
          RecipesRoute.name,
          path: '/recipes-page',
        );

  static const String name = 'RecipesRoute';
}

/// generated route for
/// [_i6.FavoritesPage]
class FavoritesRoute extends _i9.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: '/favorites-page',
        );

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search-page',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i8.RecipeDetailsPage]
class RecipeDetailsRoute extends _i9.PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    required _i11.Recipe recipe,
    _i10.Key? key,
  }) : super(
          RecipeDetailsRoute.name,
          path: '/recipe-details-page',
          args: RecipeDetailsRouteArgs(
            recipe: recipe,
            key: key,
          ),
        );

  static const String name = 'RecipeDetailsRoute';
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({
    required this.recipe,
    this.key,
  });

  final _i11.Recipe recipe;

  final _i10.Key? key;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{recipe: $recipe, key: $key}';
  }
}
