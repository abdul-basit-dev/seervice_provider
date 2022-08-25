import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class AddNewServiceScreen extends StatelessWidget {
  static String routeName = "/add_service";
  const AddNewServiceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        title: const Text(
          "Add Service",
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: const Body(),
      // bottomNavigationBar:
      //     const CustomBottomNavBar(selectedMenu: MenuState.services),
    );
  }
}
