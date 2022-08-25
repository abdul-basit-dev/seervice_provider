import 'package:flutter/material.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/components/tab_approved_service_providers.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/components/tab_new_service_providers.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/components/tab_rejected_service_providers.dart';

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
        TabNewServiceProviders(),
        TabApprovedServiceProviders(),
        TabRejectedServiceProviders(),
      ],
    );
  }
}
