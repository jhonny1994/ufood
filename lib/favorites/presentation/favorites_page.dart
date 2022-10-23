import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/widgets/head_text.dart';
import 'package:ufood/core/presentation/widgets/recipes_listview.dart';
import 'package:ufood/core/presentation/widgets/top_bar.dart';
import 'package:ufood/shared/global_providers.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesHomePageState();
}

class _FavoritesHomePageState extends ConsumerState<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .watch(favoritesStateNotifierProvider.notifier)
          .getFavoriteRecipes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(favoritesStateNotifierProvider);

    return Scaffold(
      appBar: topBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadText(
              text: 'Your Favorites',
              subText: 'List of all your Favorite recipes.',
            ),
            const SizedBox(height: 20),
            state.when(
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
              loadSuccess: (favorites) {
                return favorites.isNotEmpty
                    ? RecipesListView(favorites)
                    : const Expanded(
                        child: Center(
                          child: Text(
                            'There were no favorites found\nplease add some recipes to your favorites first.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
