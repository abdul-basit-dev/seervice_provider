import 'package:flutter/material.dart';

class AdminAddServicesScreen extends StatelessWidget {
  static String routeName = "/admin_add_services";
  const AdminAddServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Services'),
      ),
    );
  }
}
