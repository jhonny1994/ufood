// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

class Recipe {
  Recipe({
    required this.aggregateLikes,
    required this.healthScore,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.image,
    required this.summary,
    required this.instructions,
    required this.analyzedInstructions,
    required this.isLiked,
  });

  final int aggregateLikes;
  final int healthScore;
  final List<ExtendedIngredient> extendedIngredients;
  final int id;
  final String title;
  final int readyInMinutes;
  final String image;
  final String summary;
  final String instructions;
  final List<AnalyzedInstruction> analyzedInstructions;
  late final bool isLiked;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        aggregateLikes: json["aggregateLikes"],
        isLiked: json["isLiked"] ?? false,
        healthScore: json["healthScore"],
        extendedIngredients: List<ExtendedIngredient>.from(
          json["extendedIngredients"]
              .map((x) => ExtendedIngredient.fromJson(x)),
        ),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        image: json["image"] ??
            'https://www.everestkitchenpa.com/assets/images/menuShortCuts/momoShortCut.jpg',
        summary: json["summary"],
        instructions: json["instructions"],
        analyzedInstructions: List<AnalyzedInstruction>.from(
          json["analyzedInstructions"]
              .map((x) => AnalyzedInstruction.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "aggregateLikes": aggregateLikes,
        "isLiked": isLiked,
        "healthScore": healthScore,
        "extendedIngredients":
            List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "image": image,
        "summary": summary,
        "instructions": instructions,
        "analyzedInstructions":
            List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
      };
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });

  final String name;
  final List<Step> steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: json["name"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

class Step {
  Step({
    required this.number,
    required this.step,
  });

  final int number;
  final String step;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
      };
}

class ExtendedIngredient {
  ExtendedIngredient({
    required this.image,
    required this.name,
    required this.original,
  });

  final String? image;
  final String name;
  final String original;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        image: json["image"],
        name: json["name"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "original": original,
      };
}
