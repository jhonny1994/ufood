import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const AppFailure._();
  const factory AppFailure.api(int errorCode) = _Api;
  const factory AppFailure.message(String errorMessage) = _Message;
}
