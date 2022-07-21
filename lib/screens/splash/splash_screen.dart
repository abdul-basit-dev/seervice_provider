import 'package:flutter/material.dart';

import 'package:handyprovider/screens/splash/components/body.dart';
import 'package:handyprovider/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      // backgroundColor: kPrimaryBGColor,
      body: Body(),
    );
  }
}
