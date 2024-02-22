import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/name_page.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void navigateUser() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            userInfo.isEmpty ? const GetUserName() : const HomePage(),
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      body: Center(
        child: SimpleShadow(
          color: Colors.black,
          offset: const Offset(4, 4),
          sigma: 5,
          child: Lottie.asset(
            'images/splash_animation.json',
            height: MediaQuery.of(context).size.height * 0.4,
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().whenComplete(navigateUser);
            },
          ),
        ),
      ),
    );
  }
}
