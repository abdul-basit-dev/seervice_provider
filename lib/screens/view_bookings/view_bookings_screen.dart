import 'package:flutter/material.dart';

import '../../constants.dart';

import 'components/body.dart';

class ViewAllBookingsScreen extends StatefulWidget {
  const ViewAllBookingsScreen({Key? key, required this.userid})
      : super(key: key);
  final String userid;
  static String routeName = "/all_bookings";

  @override
  State<ViewAllBookingsScreen> createState() => _ViewAllBookingsScreenState();
}

class _ViewAllBookingsScreenState extends State<ViewAllBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "Bookings",
            style: TextStyle(color: kTextColor),
          ),
          bottom: const TabBar(
              labelColor: kPrimaryLightColor,
              unselectedLabelColor: kTextColorSecondary,
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
              ]),
        ),
        body: Body(id: widget.userid),
      ),
    );
  }
}
