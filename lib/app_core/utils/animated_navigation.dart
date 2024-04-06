import 'package:flutter/cupertino.dart';

class AnimatedNavigation {
  static push({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.push(context, CupertinoPageRoute(builder: (_) => page));
  }

  static pushAndRemoveUntil({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: offsetAnimation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }
}
