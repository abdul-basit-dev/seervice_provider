import 'package:flutter/material.dart';

import '../../../constants.dart';

import 'components/body.dart';

class ManageServiceProviderScreen extends StatefulWidget {
  static String routeName = "/admin_manage_service_providers";
  const ManageServiceProviderScreen({Key? key}) : super(key: key);

  @override
  State<ManageServiceProviderScreen> createState() =>
      _ManageServiceProviderScreenState();
}

class _ManageServiceProviderScreenState
    extends State<ManageServiceProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "Manage Service Providers",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: kTextColor, fontSize: 16),
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
      ),
    );
  }
}
