import 'package:flutter/material.dart';

import 'tab_active_offers.dart';
import 'tab_completed_offers.dart';
import 'tab_new_offers.dart';

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
        NewOffers(),
        ActiveBookings(),
        CompletedBookings(),
      ],
    );
  }
}
