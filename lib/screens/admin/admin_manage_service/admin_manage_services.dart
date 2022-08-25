import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'components/body.dart';

class AdminManageServicesScreen extends StatelessWidget {
  static String routeName = "/admin_services_manage";
  const AdminManageServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        title: const Text(
          "All Services",
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: const Body(),
    );
  }
}
