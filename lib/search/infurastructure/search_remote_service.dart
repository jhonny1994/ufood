import 'package:dartz/dartz.dart';
import 'package:ufood/api_key.dart';
import 'package:ufood/core/application/recipe_service.dart';
import 'package:ufood/recipes/domain/app_failure.dart';
import 'package:ufood/search/domain/search_results.dart';

class SearchRemoteService extends RecipeService {
  SearchRemoteService(super.dio);

  Future<Either<AppFailure, SearchResults>> getSearchResults(
    String searchTerm,
    int number,
  ) async {
    return super.getSearchResult(
      apiKey: spoonacularApiKey,
      url: spoonacularApiUrl,
      searchTerm: searchTerm,
      number: number,
    );
  }
}
