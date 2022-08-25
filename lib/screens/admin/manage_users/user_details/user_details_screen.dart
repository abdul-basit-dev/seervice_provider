import 'package:flutter/material.dart';

import '../../../../constants.dart';

import 'components/body.dart';

class UserDetailsScreen extends StatefulWidget {
  static String routeName = "/user_details";
  const UserDetailsScreen({
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
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Details",
          style: headingStyle,
        ),
      ),
      body: Body(
        name: widget.name,
        id: widget.id,
        email: widget.email,

        contact: widget.contact,
        adress: widget.adress,
        gender: widget.gender,
        status: widget.status,
        image: widget.image,
        // img: widget.img,
      ),
      // bottomNavigationBar: Visibility(
      //   visible: widget.status == 'pending' ? true : false,
      //   child: BottomBar(
      //     id: widget.id,
      //     status: widget.status,
      //   ),
      // ),
    );
  }
}
