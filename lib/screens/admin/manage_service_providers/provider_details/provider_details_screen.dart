import 'package:flutter/material.dart';

import '../../../../constants.dart';

import '../components/bottom_bar.dart';
import 'components/body.dart';

class ProviderDetailsScreen extends StatefulWidget {
  static String routeName = "/provider_details";
  const ProviderDetailsScreen({
    Key? key,
    required this.name,
    required this.id,
    required this.email,
    required this.cnic,
    required this.contact,
    required this.adress,
    required this.gender,
    required this.status,
    required this.image,
    required this.img,
    required this.p_token,
  }) : super(key: key);
  final String name,
      id,
      email,
      cnic,
      contact,
      adress,
      gender,
      status,
      image,
      img,
      p_token;
  @override
  State<ProviderDetailsScreen> createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<ProviderDetailsScreen> {
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
        cnic: widget.cnic,
        contact: widget.contact,
        adress: widget.adress,
        gender: widget.gender,
        status: widget.status,
        image: widget.image,
        img: widget.img,
      ),
      bottomNavigationBar: Visibility(
        visible: widget.status == 'pending' ? true : false,
        child: BottomBar(
          id: widget.id,
          status: widget.status,
          p_token: widget.p_token,
        ),
      ),
    );
  }
}
