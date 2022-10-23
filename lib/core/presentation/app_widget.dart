import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/core/application/first_launch_notifier.dart';
import 'package:ufood/core/presentation/routes/app_router.gr.dart';
import 'package:ufood/shared/global_providers.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(sembastProvider).init();
  final prefs = await SharedPreferences.getInstance();
  final bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
  if (isFirstLaunch == null) {
    await prefs.setBool('isFirstLaunch', true);
  }
  await ref
      .watch(launchStateNotifierProvider.notifier)
      .checkAndUpdateLaunchStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      initializationProvider,
      (previous, next) {},
    );
    ref.listen<LaunchState>(
      launchStateNotifierProvider,
      (previous, state) {
        state.maybeWhen(
          isFirstLaunch: () => appRouter.pushAndPopUntil(
            const OnboardingRoute(),
            predicate: (route) => false,
          ),
          isNotFirstLaunch: () => appRouter.pushAndPopUntil(
            const BaseRoute(),
            predicate: (route) => false,
          ),
          orElse: () {},
        );
      },
    );
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
            ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'UFood',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
