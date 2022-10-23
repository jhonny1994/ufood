import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/widgets/recipe_tile.dart';
import 'package:ufood/recipes/domain/recipe.dart';

class RecipesListView extends ConsumerStatefulWidget {
  final List<Recipe> recipes;

  const RecipesListView(this.recipes, {super.key});

  @override
  ConsumerState<RecipesListView> createState() => _RecipesListViewState();
}

class _RecipesListViewState extends ConsumerState<RecipesListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
        ),
        child: GridView.builder(
          itemCount: widget.recipes.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (BuildContext context, int index) {
            return RecipeTile(
              recipe: widget.recipes[index],
            );
          },
        ),
      ),
    );
  }
}
