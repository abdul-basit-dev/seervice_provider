import 'package:flutter/material.dart';
import 'package:handyprovider/screens/admin/search_screen/search_screen.dart';

import '../../../constants.dart';
import 'components/body.dart';

class AdminManageServicesScreen extends StatefulWidget {
  static String routeName = "/admin_services_manage";
  const AdminManageServicesScreen({
    Key? key,
    required this.serviceName,
  }) : super(key: key);
  final String serviceName;

  @override
  State<AdminManageServicesScreen> createState() =>
      _AdminManageServicesScreenState();
}

class _AdminManageServicesScreenState extends State<AdminManageServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        title: const Text(
          "All Services",
          style: TextStyle(color: kTextColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: Body(serviceName: widget.serviceName),
    );
  }
}
