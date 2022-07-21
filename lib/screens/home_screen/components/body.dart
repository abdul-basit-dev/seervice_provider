import 'package:flutter/material.dart';
import 'package:handyprovider/screens/home_screen/components/home_menu.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HomeMenu(),
        ],
      ),
    );
  }
}
