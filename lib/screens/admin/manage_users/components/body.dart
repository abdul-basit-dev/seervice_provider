import 'package:flutter/material.dart';

import 'view_all_users.dart';

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
        ViewAllUsers(),
      ],
    );
  }
}
