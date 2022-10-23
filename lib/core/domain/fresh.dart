import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh.freezed.dart';

@freezed
class Fresh<T> with _$Fresh<T> {
  const factory Fresh({
    required T recipes,
    required bool isFresh,
  }) = _Fresh<T>;
  const Fresh._();
  factory Fresh.yes(
    T recipes,
  ) =>
      Fresh(
        recipes: recipes,
        isFresh: true,
      );
  factory Fresh.no(
    T recipes,
  ) =>
      Fresh(
        recipes: recipes,
        isFresh: false,
      );
}
