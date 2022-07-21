import 'package:flutter/material.dart';
import 'package:handyprovider/constants.dart';

import '../../helper/global_config.dart';
import '../admin/manage_services/components/bottom_bar.dart';
import 'components/body.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/service_detail";

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  bool isAdmin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (box!.containsKey("admin_login")) {
      setState(() {
        isAdmin = true;
      });
    } else {
      setState(() {
        isAdmin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
      bottomNavigationBar: Visibility(
        visible: isAdmin == true ? true : false,
        child: const BottomBar(),
      ),
    );
  }
}
