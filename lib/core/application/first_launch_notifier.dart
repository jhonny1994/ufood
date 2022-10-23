import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'first_launch_notifier.freezed.dart';

class FirstLaunch extends StateNotifier<LaunchState> {
  FirstLaunch() : super(const LaunchState.initial());

  Future<void> checkAndUpdateLaunchStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (isFirstLaunch != null) {
      if (isFirstLaunch) {
        state = const LaunchState.isFirstLaunch();
      } else {
        state = const LaunchState.isNotFirstLaunch();
      }
    } else {
      state = const LaunchState.initial();
    }
  }
}

@freezed
class LaunchState with _$LaunchState {
  const factory LaunchState.isFirstLaunch() = _IsFirstLaunch;
  const factory LaunchState.initial() = _Initial;
  const factory LaunchState.isNotFirstLaunch() = _IsNotFirstLaunch;
}
