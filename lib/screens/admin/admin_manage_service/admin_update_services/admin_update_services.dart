import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'components/body.dart';

class AdminUpdateServicesScreen extends StatefulWidget {
  static String routeName = "/admin_update_services";
  const AdminUpdateServicesScreen(
      {Key? key,
      required this.serviceName,
      required this.sub1,
      required this.sub2,
      required this.sub3,
      required this.sub4,
      required this.sub5,
      required this.id,
      required this.cat_status,
      required this.image})
      : super(key: key);
  final String serviceName, sub1, sub2, sub3, sub4, sub5, id, image, cat_status;

  @override
  State<AdminUpdateServicesScreen> createState() =>
      _AdminUpdateServicesScreenState();
}

class _AdminUpdateServicesScreenState extends State<AdminUpdateServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Admin Update Service",
          style: headingStyle,
        ),
      ),
      body: Body(
          serviceName: widget.serviceName,
          sub1: widget.sub1,
          sub2: widget.sub2,
          sub3: widget.sub3,
          sub4: widget.sub4,
          sub5: widget.sub5,
          id: widget.id,
          cat_status: widget.cat_status,
          image: widget.image),
    );
  }
}
