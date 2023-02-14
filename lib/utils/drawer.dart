import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshop/bloc/app_bloc_bloc.dart';
import 'package:onlineshop/dialogs/logout_dialog.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          TextButton(
            onPressed: () async {
              final showLogoutDialog = await showLogOutDialog(context);
              if (showLogoutDialog) {
                context.read<AppBlocBloc>().add(
                      const AppBlocEventLogOut(),
                    );
              }
            },
            child: Text(
              'Log out',
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
