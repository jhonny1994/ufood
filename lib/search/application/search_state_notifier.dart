import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ufood/search/domain/search_results.dart';
import 'package:ufood/search/infurastructure/search_remote_service.dart';

part 'search_state_notifier.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loadFailure() = _LoadFailure;

  const factory SearchState.initial() = _Initial;
  const factory SearchState.loadInProgress() = _LoadInProgress;

  const factory SearchState.loadSuccess(SearchResults result) = _LoadSuccess;

  const SearchState._();
}

class SearchStateNotifier extends StateNotifier<SearchState> {
  final SearchRemoteService _searchRepository;
  SearchStateNotifier(
    this._searchRepository,
  ) : super(
          const SearchState.initial(),
        );
  Future<void> getSearchResult({
    required String searchTerm,
    required int number,
  }) async {
    state = const SearchState.loadInProgress();
    final searchOrFailure = await _searchRepository.getSearchResults(
      searchTerm,
      number,
    );
    state = searchOrFailure.fold(
      (l) => const SearchState.loadFailure(),
      (r) => SearchState.loadSuccess(r),
    );
  }

  SearchState clearResults() {
    return state = const SearchState.initial();
  }
}
