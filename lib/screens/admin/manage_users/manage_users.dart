import 'package:flutter/material.dart';

import '../../../constants.dart';

import 'components/body.dart';

class AdminViewAllUsers extends StatelessWidget {
  static String routeName = "/admin_view_all_users";
  const AdminViewAllUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "Manage Users",
            style: TextStyle(color: kTextColor),
          ),
          bottom: const TabBar(
              labelColor: kPrimaryLightColor,
              unselectedLabelColor: kTextColorSecondary,
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(text: 'All Users'),
                // Tab(text: 'Approved'),
                // Tab(text: 'Rejected'),
              ]),
        ),
        body: const Body(),
      ),
    );
  }
}
