import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../add_new_service/add_new_service_screen.dart';
import '../add_services/add_services_sccreen.dart';
import 'components/body.dart';

class AdminManageScreen extends StatelessWidget {
  static String routeName = "/admin_manage_services";
  const AdminManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "Manage Services",
            style: TextStyle(color: kTextColor),
          ),
          bottom: const TabBar(
              labelColor: kPrimaryLightColor,
              unselectedLabelColor: kTextColorSecondary,
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(text: 'New'),
                Tab(text: 'Approved'),
                Tab(text: 'Rejected'),
              ]),
        ),
        body: const Body(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AdminAddServicesScreen.routeName);
            },
            child: const Icon(Icons.add),
            backgroundColor: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
