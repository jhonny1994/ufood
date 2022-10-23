import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();
  const factory RemoteResponse.noConnection(String message) = _NoConnection<T>;
  const factory RemoteResponse.notModified() = _NotModified<T>;
  const factory RemoteResponse.hasData(T data) = _HasData<T>;
}
