import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshop/bloc/app_bloc_bloc.dart';
import 'package:onlineshop/extentions/if_debugging.dart';

class RegisterScreen extends HookWidget {
  static const routeName = '/register';
  RegisterScreen({super.key});
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final imageController = TextEditingController();
    final emailController =
        useTextEditingController(text: 'paywand@gmail.com'.ifDebugging);
    final passwordController =
        useTextEditingController(text: 'paywand&*'.ifDebugging);
    final phoneNoController =
        useTextEditingController(text: "07508174952".ifDebugging);
    return Scaffold(
      body: Form(
        key: _key,
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              width: screenWidth,
              child: Center(
                child: Text(
                  'Register',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Enter Your Email',
                contentPadding: EdgeInsets.all(8),
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
              validator: (value) {
                if (value == null) {
                  return 'Please Enter Your Email';
                }
                return '';
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter Your Password',
                contentPadding: EdgeInsets.all(8),
              ),
              obscureText: true,
              obscuringCharacter: '◎',
              keyboardType: TextInputType.visiblePassword,
              keyboardAppearance: Brightness.dark,
              validator: (value) {
                if (value == null) {
                  return 'Please Enter Your Password';
                }
                return '';
              },
            ),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: 'put your image link',
                contentPadding: EdgeInsets.all(8),
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
              validator: (value) {
                if (value == null) {
                  return 'Please Enter Your link';
                }
                return '';
              },
            ),
            TextFormField(
              controller: phoneNoController,
              decoration: const InputDecoration(
                labelText: 'put your phone number',
                contentPadding: EdgeInsets.all(8),
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
              validator: (value) {
                if (value == null) {
                  return 'Please Enter Your phone number';
                }
                return '';
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;
                final image = imageController.text;
                final phone = phoneNoController.text;
                context.read<AppBlocBloc>().add(
                      AppBlocEventRegister(
                        image: image,
                        email: email,
                        password: password,
                        phone: phone,
                      ),
                    );
              },
              child: Text(
                'Register',
                style: GoogleFonts.montserrat(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () async {
                context.read<AppBlocBloc>().add(
                      const AppBlocEventGoToLogin(),
                    );
              },
              child: Text(
                "Already have an account!? Login here.",
                style: GoogleFonts.montserrat(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
