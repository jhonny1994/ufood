import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/routes/app_router.gr.dart';
import 'package:ufood/core/presentation/widgets/states_widget.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/shared/global_providers.dart';

class RecipeTile extends ConsumerStatefulWidget {
  final Recipe recipe;
  const RecipeTile({super.key, required this.recipe});

  @override
  ConsumerState<RecipeTile> createState() => _RecipeTileState();
}

class _RecipeTileState extends ConsumerState<RecipeTile> {
  late bool isLiked;
  @override
  void initState() {
    super.initState();
    isLiked = widget.recipe.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () async {
            await AutoRouter.of(context).push(
              RecipeDetailsRoute(recipe: widget.recipe),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 0.1,
                  blurRadius: 2.5,
                  offset: const Offset(2, 2),
                ),
                const BoxShadow(
                  color: secondaryColor,
                  spreadRadius: 0.1,
                  blurRadius: 2.5,
                  offset: Offset(-2, -2),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              color: secondaryColor,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: widget.recipe.image,
                    placeholder: (context, url) => Center(
                      child: SvgPicture.asset('assets/svg/Spinner.svg'),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const Spacer(),
                Text(
                  widget.recipe.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatesWidget(
                      icon: Icons.timer,
                      text: widget.recipe.readyInMinutes.toString(),
                    ),
                    StatesWidget(
                      icon: Icons.monitor_heart,
                      text: widget.recipe.healthScore.toString(),
                    ),
                    StatesWidget(
                      icon: Icons.favorite,
                      text: widget.recipe.aggregateLikes.toString(),
                    ),
                  ],
                ),
              ],
            ),
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
                      size: 20,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                      color: secondaryColor,
                      size: 20,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
