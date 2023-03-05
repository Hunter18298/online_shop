import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onlineshop/main_home.dart';
import 'package:onlineshop/screens/login_screen.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({Key? key}) : super(key: key);
  static const routeName = '/myapp';
  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/72874-user-profile-v2.json',
          controller: _controller,
          height: 400,
          animate: true,
          onLoaded: (composition) async {
            await Future.delayed(Duration(seconds: 2));
            Navigator.pushReplacementNamed(
              context,
              HomePage.routeName,
            );
          },
        ),
      ),
    );
  }
}
