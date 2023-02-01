import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_home.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Shopping',
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFF86E5FF),
          textTheme: GoogleFonts.montserratTextTheme(
            const TextTheme(
              headline6: TextStyle(fontSize: 22.5),
              headline5: TextStyle(color: Colors.black),
              subtitle1: TextStyle(color: Colors.black),
            ),
          ),
          colorScheme:
              const ColorScheme.light().copyWith(primary: Colors.white)),
      home: const HomePage(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        OrderScreen.routeName: (context) => const OrderScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),

        // DetailsScreen.routeName: (context) => DetailsScreen(),
      },
    );
  }
}
