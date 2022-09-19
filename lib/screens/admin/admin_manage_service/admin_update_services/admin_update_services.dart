import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handyprovider/components/delete_dialog.dart';
import 'package:handyprovider/screens/admin/admin_dashboard/admin_dashboard.dart';

import '../../../../constants.dart';
import '../../../../helper/global_config.dart';
import 'components/body.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

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
      required this.servicepriceMin,
      required this.servicepriceMax,
      required this.image})
      : super(key: key);
  final String serviceName,
      sub1,
      sub2,
      sub3,
      sub4,
      sub5,
      id,
      image,
      servicepriceMin,
      servicepriceMax,
      cat_status;

  @override
  State<AdminUpdateServicesScreen> createState() =>
      _AdminUpdateServicesScreenState();
}

class _AdminUpdateServicesScreenState extends State<AdminUpdateServicesScreen> {
  String webUrl = baseUrl + "admin_update_services.php";
  bool? error, sending, success;
  String? msg;
  ////////////
  var snackBar = const SnackBar(
    content: Text(' A SnackBar!'),
  );
  @override
  void initState() {
    super.initState();
    error = false;
    sending = false;
    success = false;
    msg = "";
  }

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
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    // Navigator.of(context).pop();

                    return CustomDeleteDialog(
                      press: () {
                        sendData();
                      },
                      close: () {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          )
        ],
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
          servicepriceMin: widget.servicepriceMin,
          servicepriceMax: widget.servicepriceMax,
          image: widget.image),
    );
  }

  Future<void> sendData() async {
    if (widget.id.isNotEmpty) {
      var res = await http.post(Uri.parse(webUrl), body: {
        "id": widget.id,
        "cat_title": widget.serviceName,
        "sub1": widget.sub1,
        "sub2": widget.sub2,
        "sub3": widget.sub3,
        "sub4": widget.sub4,
        "sub5": widget.sub5,
        "cat_status": 'false',
        "cat_image": widget.image
      }); //sending post request with header data

      if (res.statusCode == 200) {
        print(res.body); //print raw response on console
        var data = json.decode(res.body); //decoding json to array
        if (data["success"] == 0) {
          setState(() {
            //refresh the UI when error is recieved from server
            print('error is recieved from server');
            sending = false;
            error = true;
            msg = data["msg"];
            print(msg); //error message from server
            snackBar = SnackBar(
              content: Text(data["msg"]),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        } else {
          //after write success, make fields empty

          setState(() {
            msg = data["msg"];
            print(msg);
            msg = "success sendign data...";
            print(msg);
            sending = false;
            success = true; //mark success and refresh UI with setState
            Navigator.of(context).pushNamedAndRemoveUntil(
                AdminDashBoard.routeName, (route) => false);
          });
        }
      } else {
        //there is error
        setState(() {
          error = true;
          msg = "Error during sendign data.";
          print(msg);
          print(res.body);
          sending = false;
          //mark error and refresh UI with setState
          snackBar = const SnackBar(
            content: Text('OOps!!.Eror'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    } else {
      sending = false;
      error = true;

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
