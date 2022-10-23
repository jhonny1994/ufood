import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/routes/app_router.gr.dart';
import 'package:ufood/core/presentation/widgets/states_widget.dart';
import 'package:ufood/search/domain/search_results.dart';
import 'package:ufood/shared/global_providers.dart';

class SearchTile extends ConsumerStatefulWidget {
  final Result result;

  const SearchTile({
    super.key,
    required this.result,
  });

  @override
  ConsumerState<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends ConsumerState<SearchTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final recipe = await ref
            .watch(recipeStateNotifierProvider.notifier)
            .getRecipeDetails(widget.result.id);
        await AutoRouter.of(context).push(
          RecipeDetailsRoute(recipe: recipe),
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
                imageUrl: widget.result.image,
                height: 106,
                placeholder: (context, url) =>
                    Center(child: SvgPicture.asset('assets/svg/Spinner.svg')),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const Spacer(),
            Text(
              widget.result.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatesWidget(
                  icon: Icons.timer,
                  text: '${widget.result.readyInMinutes.toString()} mins',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
