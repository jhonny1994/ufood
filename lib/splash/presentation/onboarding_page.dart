import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/shared/global_providers.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.125,
                    child: Image.asset('assets/png/Ufood.png'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.375,
                  child: SvgPicture.asset(
                    'assets/svg/Male-chef-cooking-in-kitchen.svg',
                  ),
                ),
                const Text(
                  "It's cooking \ntime!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 60,
                    color: textColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: const Size(150, 60),
                  ),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();

                    await prefs.setBool('isFirstLaunch', false);

                    await ref
                        .read(launchStateNotifierProvider.notifier)
                        .checkAndUpdateLaunchStatus();
                  },
                  child: const Text(
                    'Get started',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
      value: 0,
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }
}
