import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'components/body.dart';

class AdminAddServicesScreen extends StatelessWidget {
  static String routeName = "/admin_add_services";
  const AdminAddServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Admin Add Service",
          style: headingStyle,
        ),
      ),
      body: const Body(),
    );
  }
}
