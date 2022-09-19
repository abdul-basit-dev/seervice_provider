import 'package:flutter/material.dart';
import 'package:handyprovider/screens/view_bookings/components/tab_completed_bookings.dart';

import 'tab_active_bookings.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        ActiveBookings(id: widget.id),
        CompletedBookings(id: widget.id),
      ],
    );
  }
}
