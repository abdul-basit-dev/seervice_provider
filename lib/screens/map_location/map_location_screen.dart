import 'package:flutter/material.dart';
import 'package:handyprovider/constants.dart';
import 'package:handyprovider/size_config.dart';

import 'components/body.dart';

class MapScreen extends StatelessWidget {
  static String routeName = "/map";

  const MapScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBGColor,
        title: const Text(
          "Location",
          style: TextStyle(color: kTextColor),
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
