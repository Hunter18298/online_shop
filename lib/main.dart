import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshop/bloc/app_bloc_bloc.dart';

import 'package:onlineshop/cart_bloc/cart_bloc.dart';
import 'package:onlineshop/dialogs/show_auth_error.dart';
import 'package:onlineshop/loading/loading_screen.dart';
import 'package:onlineshop/main_home.dart';
import 'package:onlineshop/screens/details_screen.dart';
import 'package:onlineshop/screens/home_screen.dart';
import 'package:onlineshop/screens/login_screen.dart';
import 'package:onlineshop/screens/order_screen.dart';
import 'package:onlineshop/screens/profile_screen.dart';
import 'package:onlineshop/screens/register_screen.dart';
import 'package:onlineshop/shopping_observer.dart';
import 'package:onlineshop/shopping_repository.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = const SimpleBlocObserver();
  runApp(MyApp(
    shoppingRepository: ShoppingRepository(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.shoppingRepository});
  final ShoppingRepository shoppingRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBlocBloc>(
          create: (context) => AppBlocBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(shoppingRepository)..add(CartStarted()),
        ),
      ],
      child: MaterialApp(
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
        home: BlocConsumer<AppBlocBloc, AppBlocState>(
          ///lera ba pey state akan screen akan dagordret
          builder: (context, appState) {
            if (appState is AppBlocStateLoggedOut) {
              return LoginScreen();
            } else if (appState is AppBlocStateLoggedIn) {
              return const HomePage();
            } else if (appState is AppBlocStateIsInRegistrationView) {
              return RegisterScreen();
            } else if (appState is AppBlocEventGoToLogin) {
              return LoginScreen();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }

            final authError = appState.authError;
            if (authError != null) {
              showAuthError(
                authError: authError,
                context: context,
              );
            }
          },
        ),
        //routes lo arastakrdni screen akani naw application aka bakar det
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          DetailsScreen.routeName: (context) => DetailsScreen(),
        },
      ),
    );
  }
}
