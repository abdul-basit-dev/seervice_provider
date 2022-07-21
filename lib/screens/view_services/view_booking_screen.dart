import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import '../../enum.dart';
import 'components/body.dart';

class ViewServicesScreen extends StatelessWidget {
  const ViewServicesScreen({Key? key}) : super(key: key);
  static String routeName = "/view_services";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "My Services",
            style: TextStyle(color: kTextColor),
          ),
          bottom: const TabBar(
              labelColor: kPrimaryLightColor,
              unselectedLabelColor: kTextColorSecondary,
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(text: 'Approved'),
                Tab(text: 'Pending'),
              ]),
        ),
        body: const Body(),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.services),
      ),
    );
  }
}
