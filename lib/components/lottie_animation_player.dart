import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPlayer extends StatefulWidget {
  final String filePath;
  final double? height;
  final double? width;
  final Function() onComplete;
  const LottieAnimationPlayer({
    super.key,
    required this.filePath,
    required this.onComplete,
    this.height,
    this.width,
  });

  @override
  State<LottieAnimationPlayer> createState() => _LottieAnimationPlayerState();
}

class _LottieAnimationPlayerState extends State<LottieAnimationPlayer>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.filePath,
      height: widget.height ?? double.maxFinite,
      width: widget.width ?? double.maxFinite,
      controller: animationController,
      animate: true,
      onLoaded: (composition) {
        animationController
          ..duration = composition.duration
          ..forward().whenComplete(widget.onComplete);
      },
    );
  }
}
