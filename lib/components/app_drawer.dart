import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/admin_functionality/admin_screens/admin_screen.dart';
import 'package:kati_masterclass_app/screens/my_orders_screen.dart';
import 'package:kati_masterclass_app/services/auth_service.dart';

import 'styled_text.dart';

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key});

  void logOut() {
    final authService = AuthService();
    authService.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      child: Column(
        children: <Widget>[
          AppBar(
            title: const StyledHeading("Menu"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
           ListTile(
            leading: const Icon(
              Icons.shop,
              color: Colors.white,
            ),
            title: StyledText("My orders"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  MyBookingsScreen())
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.admin_panel_settings,
              color: Colors.white,
            ),
            title: const StyledText("Admin Panel"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AdminScreen()));
            },
          ),
          const Spacer(),
          ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: const StyledText("Log out"),
              onTap: () {
                logOut();
                Navigator.pop(context);
                const SizedBox(
                  height: 50,
                );
              })
        ],
      ),
    );
  }
}
