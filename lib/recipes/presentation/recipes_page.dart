import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/widgets/head_text.dart';
import 'package:ufood/core/presentation/widgets/recipes_listview.dart';
import 'package:ufood/core/presentation/widgets/top_bar.dart';
import 'package:ufood/shared/global_providers.dart';

class RecipesPage extends ConsumerStatefulWidget {
  const RecipesPage({super.key});

  @override
  ConsumerState<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends ConsumerState<RecipesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.watch(recipeListStateNotifierProvider.notifier).getRecipes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeListStateNotifierProvider);
    return Scaffold(
      appBar: topBar(
        onButtonTapped: () async {},
        icon: Icons.refresh,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find your new \nfavorite recipe.',
              style: TextStyle(
                fontSize: 48,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Divider(thickness: 2),
            const SizedBox(height: 5),
            const HeadText(
              text: "Today's rccomondations",
              subText: 'New recipes every day.',
            ),
            const SizedBox(height: 5),
            const Divider(thickness: 2),
            const SizedBox(height: 5),
            state.when(
              loadFailure: (failure) {
                return const Center(
                  child: Text(
                    'An error has occured, please try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                );
              },
              loadSuccess: (recipes) => RecipesListView(recipes.recipes),
              loadInProgress: () {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoadingAnimationWidget.threeRotatingDots(
                        color: primaryColor,
                        size: 50,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Loading',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
