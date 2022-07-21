import 'package:flutter/material.dart';

import 'tab_approved_services.dart';
import 'tab_pending_services.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        ApprovedServices(),
        PendingServices(),
      ],
    );
  }
}
