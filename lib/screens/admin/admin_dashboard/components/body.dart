import 'package:flutter/material.dart';

import 'package:handyprovider/screens/admin/add_services/add_services_sccreen.dart';
import 'package:handyprovider/screens/admin/admin_manage_service/admin_manage_services.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/manage_service_providers.dart';
import 'package:handyprovider/screens/admin/manage_users/manage_users.dart';

import '../../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/splash_2.png",
                width: 250,
                height: 250,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, AdminAddServicesScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: const Text(
                      'Add New Service',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                          fontSize: 15),
                    ),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: kTextColorSecondary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.add_circle_outline,
                        color: kTextColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kTextColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, AdminManageServicesScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: const Text(
                      'View All Service',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                          fontSize: 15),
                    ),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: kTextColorSecondary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.list_alt,
                        color: kTextColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kTextColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, ManageServiceProviderScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: const Text(
                      'Manage Service Providers',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                          fontSize: 15),
                    ),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: kTextColorSecondary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.verified_user_rounded,
                        color: kTextColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kTextColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AdminViewAllUsers.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: const Text(
                      'Manage Users',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                          fontSize: 15),
                    ),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: kTextColorSecondary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.person_outlined,
                        color: kTextColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kTextColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
