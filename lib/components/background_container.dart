import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height - 245,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: const DecorationImage(
          image: AssetImage('images/silver-cloth-abstract-background.jpg'),
          fit: BoxFit.fill,
          opacity: .21,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: child,
    );
  }
}
