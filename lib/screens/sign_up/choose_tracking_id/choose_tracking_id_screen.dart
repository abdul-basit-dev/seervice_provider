import 'package:flutter/material.dart';
import 'components/body.dart';

class ChooseTrackingID extends StatelessWidget {
  static String routeName = "/sign_in_tracking_id";
  const ChooseTrackingID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(300),
      //   child: Container(
      //     color: kPrimaryColor,
      //   ),
      // ),
      body: Body(),
    );
  }
}
