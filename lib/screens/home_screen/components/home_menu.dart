import 'package:flutter/material.dart';
import 'package:handyprovider/constants.dart';
import 'package:handyprovider/screens/add_new_service/add_new_service_screen.dart';
import 'package:handyprovider/screens/view_offers/view_offers_screen.dart';

import '../../../helper/global_config.dart';
import '../../view_services/view_booking_screen.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  List<Map<String, String>> menuData = [
    {"text": "Add Service"},
    {"text": "View Services"},
    {"text": "New Offers"},
    {"text": "Profile "},
  ];
  static const snackBar = SnackBar(
    content: Text('Profile Not Verified Yet'),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  color: kSecondaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      box!.get('status') != 'pending'
                          ? Navigator.pushNamed(
                              context, AddNewServiceScreen.routeName)
                          : ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/add_service.png",
                              width: 96,
                              height: 96,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(menuData[0]['text']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: kSecondaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ViewServicesScreen.routeName);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/view_service.png",
                              width: double.infinity,
                              height: 96,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(menuData[1]['text']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  color: kSecondaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ViewOffersScreen.routeName);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/offers.png",
                              width: double.infinity,
                              height: 96,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(menuData[2]['text']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: kSecondaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/user.png",
                              width: double.infinity,
                              height: 96,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(menuData[3]['text']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
