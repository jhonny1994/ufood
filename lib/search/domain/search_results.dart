// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

class SearchResults {
  SearchResults({
    required this.results,
    required this.baseUri,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  final List<Result> results;
  final String baseUri;
  final int offset;
  final int number;
  final int totalResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        baseUri: json["baseUri"],
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "baseUri": baseUri,
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.image,
  });

  final int id;
  final String title;
  final int readyInMinutes;
  final String image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        image: json["image"] != null
            ? 'https://spoonacular.com/recipeImages/${json["image"]}'
            : 'https://www.everestkitchenpa.com/assets/images/menuShortCuts/momoShortCut.jpg',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "image": image,
      };
}
