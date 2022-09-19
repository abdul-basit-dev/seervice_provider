import 'package:flutter/material.dart';
import 'package:handyprovider/helper/global_config.dart';
import 'package:handyprovider/screens/view_bookings/view_bookings_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.name,
    required this.id,
    required this.email,
    required this.contact,
    required this.adress,
    required this.gender,
    required this.status,
    required this.image,
  }) : super(key: key);
  final String name, id, email, contact, adress, gender, status, image;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(24)),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 48.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(48.0),
                              child: Image.network(
                                baseUrlUser + widget.image,
                                fit: BoxFit.fill,
                                width: 150,
                                height: 150,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: Text(
                      widget.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                        Icons.person,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: Text(
                      widget.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                        Icons.email_rounded,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: Colors.grey.withOpacity(0.5),
                      title: const Text(
                        "widget.cnic",
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
                          Icons.card_membership_rounded,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: Text(
                      widget.contact,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                        Icons.phone_android_rounded,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Visibility(
                  visible: widget.gender == 'gender' ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: Colors.grey.withOpacity(0.5),
                      title: Text(
                        widget.gender,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
                          Icons.male_rounded,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: Text(
                      widget.adress,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                        Icons.location_on,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllBookingsScreen(
                              userid: widget.id,
                            ),
                          ));
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: Colors.grey.withOpacity(0.5),
                      title: const Text(
                        'History',
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
                          Icons.info_outline_rounded,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
