import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/widgets/recipe_panel.dart';
import 'package:ufood/core/presentation/widgets/states_widget.dart';
import 'package:ufood/core/presentation/widgets/top_bar.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/shared/global_providers.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  final Recipe recipe;

  const RecipeDetailsPage(
    this.recipe, {
    super.key,
  });

  @override
  ConsumerState<RecipeDetailsPage> createState() => _RecipePageState();
}

class _RecipePageState extends ConsumerState<RecipeDetailsPage> {
  late bool isLiked;
  @override
  void initState() {
    super.initState();
    isLiked = widget.recipe.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              widget.recipe.title,
              style: const TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.recipe.image,
                    placeholder: (context, url) => Center(
                      child: SvgPicture.asset('assets/svg/Spinner.svg'),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      await ref
                          .read(favoritesRepositoryProvider)
                          .toggleFavoriteState(widget.recipe);
                      ref
                          .watch(favoritesStateNotifierProvider.notifier)
                          .getFavoriteRecipes();
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: secondaryColor,
                              size: 30,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: secondaryColor,
                              size: 30,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatesWidget(
                  icon: Icons.timer,
                  text: 'Ready in: ${widget.recipe.readyInMinutes} mins',
                ),
                StatesWidget(
                  icon: Icons.monitor_heart,
                  text: 'Health score: ${widget.recipe.healthScore}',
                ),
                StatesWidget(
                  icon: Icons.favorite,
                  text: widget.recipe.aggregateLikes.toString(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecipePanel(
                      text: 'Summary',
                      widget: Html(
                        data: widget.recipe.summary
                            .replaceAll(RegExp('%</b>[.].*'), '%</b>.')
                            .replaceAll('spoonacular ', ' '),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RecipePanel(
                      text: 'Ingredients',
                      widget: Column(
                        children: widget.recipe.extendedIngredients.map((e) {
                          return ListTile(
                            dense: true,
                            leading: e.image != null
                                ? CachedNetworkImage(
                                    width: 40,
                                    height: 40,
                                    imageUrl:
                                        'https://spoonacular.com/cdn/ingredients_100x100/${e.image}',
                                    placeholder: (context, url) => Center(
                                      child: SvgPicture.asset(
                                        'assets/svg/Spinner.svg',
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )
                                : Image.network(
                                    'https://www.everestkitchenpa.com/assets/images/menuShortCuts/momoShortCut.jpg',
                                  ),
                            title: Text(e.original),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RecipePanel(
                      text: 'Instructions',
                      widget: Column(
                        children: widget.recipe.analyzedInstructions.first.steps
                            .map((e) {
                          return ListTile(
                            subtitle: Text(e.step),
                            title: Text('step: ${e.number}'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
