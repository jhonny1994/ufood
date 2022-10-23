import 'package:auto_route/annotations.dart';

import 'package:ufood/core/presentation/base_page.dart';
import 'package:ufood/core/presentation/error_page.dart';
import 'package:ufood/core/presentation/loading_page.dart';
import 'package:ufood/core/presentation/recipe_details_page.dart';
import 'package:ufood/favorites/presentation/favorites_page.dart';
import 'package:ufood/recipes/presentation/recipes_page.dart';
import 'package:ufood/search/presentation/search_page.dart';
import 'package:ufood/splash/presentation/onboarding_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: LoadingPage, initial: true),
    MaterialRoute(page: OnboardingPage),
    MaterialRoute(page: ErrorPage),
    MaterialRoute(page: BasePage),
    MaterialRoute(page: RecipesPage),
    MaterialRoute(page: FavoritesPage),
    MaterialRoute(page: SearchPage),
    MaterialRoute(page: RecipeDetailsPage),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
