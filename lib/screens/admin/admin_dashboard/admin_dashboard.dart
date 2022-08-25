import 'package:flutter/material.dart';
import 'package:handyprovider/constants.dart';

import '../../../components/custom_logout_dialog.dart';
import '../../../helper/global_config.dart';
import '../../sign_in/sign_in_screen.dart';
import 'components/body.dart';

class AdminDashBoard extends StatelessWidget {
  static String routeName = "/admin_dashboard";
  const AdminDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    // Navigator.of(context).pop();

                    return CustomLogoutDialog(
                      press: () {
                        box!.delete("admin_login");
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SignInScreen.routeName, (route) => false);
                        //  Navigator.of(context).pop();
                      },
                      close: () {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
          ),
        ],
        title: Text(
          "Admin Dashboard",
          style: headingStyle,
        ),
      ),
      body: const Body(),
    );
  }
}
