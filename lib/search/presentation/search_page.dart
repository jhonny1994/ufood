import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/widgets/head_text.dart';
import 'package:ufood/core/presentation/widgets/search_tile.dart';
import 'package:ufood/core/presentation/widgets/top_bar.dart';
import 'package:ufood/shared/global_providers.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  Future<void> clearPage() async {
    ref.read(searchStateNotifierProvider.notifier).clearResults();
    _controller.clear();
  }

  Future<void> getSearchResults() async {
    await ref.read(searchStateNotifierProvider.notifier).getSearchResult(
          searchTerm: _controller.text.trim(),
          number: 20,
        );
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchStateNotifierProvider);
    return Scaffold(
      appBar: topBar(icon: Icons.clear, onButtonTapped: clearPage),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (value) async => getSearchResults(),
              controller: _controller,
              cursorColor: textColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: textColor,
                  ),
                  onPressed: () => getSearchResults(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: searchResults.when(
                loadFailure: () {
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
                loadSuccess: (result) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadText(
                            text:
                                'Search results for ${_controller.text.trim()}',
                            subText:
                                'Search ${result.number} of ${result.totalResults}',
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: clearPage,
                            child: const Text('Clear'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: GridView.builder(
                          itemCount: result.results.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return SearchTile(result: result.results[index]);
                          },
                        ),
                      ),
                    ],
                  );
                },
                initial: () {
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
