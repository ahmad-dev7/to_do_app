import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:to_do/Services/network/quote_services.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/components/background_container.dart';
import 'package:to_do/components/lottie_animation_player.dart';
import 'package:to_do/components/web_controller.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/name_page.dart';

class AnimatedSplashScreen extends StatelessWidget {
  const AnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return WebController(
      child: Scaffold(
        backgroundColor: const Color(0xFFE6E6E6),
        body: BackgroundContainer(
          height: double.maxFinite,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleShadow(
                  color: Colors.black,
                  offset: const Offset(4, 4),
                  sigma: 5,
                  child: LottieAnimationPlayer(
                    height: MediaQuery.of(context).size.height * 0.4,
                    filePath: 'images/splash_animation.json',
                    onComplete: navigateUser,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
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
}
