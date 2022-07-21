import 'package:flutter/material.dart';
import 'package:handyprovider/screens/sign_up/choose_tracking_id/components/tracking_id_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: const TrackingForm(),
    );
  }
}
