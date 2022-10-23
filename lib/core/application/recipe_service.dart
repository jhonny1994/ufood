import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufood/core/infurastructure/remote_response.dart';
import 'package:ufood/recipes/domain/app_failure.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/search/domain/search_results.dart';

class RecipeService {
  final Dio _dio;

  RecipeService(this._dio);

  Future<Recipe> getRemoteRecipeDetails({
    required String apiKey,
    required String url,
    required int id,
  }) async {
    final Response response = await _dio.get(
      'https://$url/recipes/$id/information',
      options: Options(
        headers: {
          'X-RapidAPI-Host': url,
          'X-RapidAPI-Key': apiKey,
        },
      ),
    );
    if (response.data != null) {
      final result = Recipe.fromJson(response.data as Map<String, dynamic>);
      return result;
    } else {
      throw Exception('Could not parse response.');
    }
  }

  Future<Either<AppFailure, SearchResults>> getSearchResult({
    required String apiKey,
    required String url,
    required String searchTerm,
    required int number,
  }) async {
    try {
      final response = await Dio().get(
        'https://$url/recipes/search',
        queryParameters: {
          'query': searchTerm,
          'number': number,
        },
        options: Options(
          headers: {
            'X-RapidAPI-Host': url,
            'X-RapidAPI-Key': apiKey,
          },
        ),
      );
      if (response.data != null) {
        final searchResult = SearchResults.fromJson(response.data);
        return right(searchResult);
      } else {
        throw Exception('Could not parse response.');
      }
    } on DioError catch (e) {
      return left(AppFailure.message(e.message));
    }
  }

  Future<RemoteResponse<List<Recipe>>> getRecipes({
    required String apiKey,
    required String url,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedDate = prefs.getString('date');
    final todaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    if (savedDate == todaysDate) {
      return const RemoteResponse.notModified();
    } else {
      try {
        final response = await _dio.get(
          'https://$url/recipes/random',
          queryParameters: {
            'number': 20,
          },
          options: Options(
            headers: {
              'X-RapidAPI-Host': url,
              'X-RapidAPI-Key': apiKey,
            },
          ),
        );

        if (response.data != null) {
          final results =
              List<Map<String, dynamic>>.from(response.data['recipes'])
                  .map((e) => Recipe.fromJson(e))
                  .toList(growable: false);

          return RemoteResponse.hasData(results);
        } else {
          throw Exception('Could not parse response.');
        }
      } on DioError catch (e) {
        return RemoteResponse.noConnection(e.message);
      }
    }
  }
}
