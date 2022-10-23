import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ufood/core/application/first_launch_notifier.dart';
import 'package:ufood/core/infurastructure/sembast_database.dart';
import 'package:ufood/favorites/application/favorites_state_notifier.dart';
import 'package:ufood/favorites/infurastructre/favorites_repository.dart';
import 'package:ufood/recipes/application/recipe_list_state_notifier.dart';
import 'package:ufood/recipes/application/recipe_state_notifier.dart';
import 'package:ufood/recipes/infurastructure/recipe_local_service.dart';
import 'package:ufood/recipes/infurastructure/recipe_remote_service.dart';
import 'package:ufood/recipes/infurastructure/recipe_repository.dart';
import 'package:ufood/search/application/search_state_notifier.dart';
import 'package:ufood/search/infurastructure/search_remote_service.dart';

final dioProvider = Provider((ref) => Dio());
final sembastProvider = Provider((ref) => SembastDatabase());

final launchStateNotifierProvider =
    StateNotifierProvider<FirstLaunch, LaunchState>((ref) => FirstLaunch());

final recipeListStateNotifierProvider =
    StateNotifierProvider.autoDispose<RecipeListStateNotifier, RecipeListState>(
  (ref) => RecipeListStateNotifier(
    ref.watch(recipeRepositoryProvider),
  ),
);

final recipeStateNotifierProvider =
    StateNotifierProvider.autoDispose<RecipeStateNotifier, RecipeState>(
  (ref) => RecipeStateNotifier(
    ref.watch(recipeRepositoryProvider),
  ),
);

final recipeRepositoryProvider = Provider(
  (ref) => RecipesRepository(
    ref.watch(recipeLocalServiceProvider),
    ref.watch(recipeRemoteServiceProvider),
  ),
);

final recipeLocalServiceProvider = Provider(
  (ref) => RecipeLocalService(
    ref.watch(sembastProvider),
  ),
);
final recipeRemoteServiceProvider = Provider(
  (ref) => RecipeRemoteService(
    ref.watch(dioProvider),
  ),
);

final favoritesStateNotifierProvider =
    StateNotifierProvider.autoDispose<FavoritesStateNotifier, FavoritesState>(
  (ref) => FavoritesStateNotifier(
    ref.watch(favoritesRepositoryProvider),
  ),
);

final favoritesRepositoryProvider = Provider(
  (ref) => FavoritesRepository(
    ref.watch(sembastProvider),
    ref.watch(recipeLocalServiceProvider),
  ),
);

final searchStateNotifierProvider =
    StateNotifierProvider.autoDispose<SearchStateNotifier, SearchState>(
  (ref) => SearchStateNotifier(
    ref.watch(searchRemoteServiceProvider),
  ),
);

final searchRemoteServiceProvider = Provider(
  (ref) => SearchRemoteService(
    ref.watch(dioProvider),
  ),
);
