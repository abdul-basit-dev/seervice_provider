import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'components/body.dart';

class AddServiceImages extends StatelessWidget {
  static String routeName = "/add_service_images";
  const AddServiceImages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        title: const Text(
          "Add Images",
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: const Body(),
    );
  }
}
