import 'package:flutter/material.dart';
import 'package:handyprovider/screens/admin/admin_manage_service/admin_update_services/admin_update_services.dart';

import '../../../../components/custom_service.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../helper/global_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.serviceName,
  }) : super(key: key);
  final String serviceName;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> servicesData = [
    {"text": "Cleaning", "icon": "assets/icons/cleaning.png"},
    {"text": "Carpenter", "icon": "assets/icons/carpenter.png"},
    {"text": "Laundry", "icon": "assets/icons/laundry.png"},
    {"text": "Painting", "icon": "assets/icons/painting.png"},
    {"text": "Electrician", "icon": "assets/icons/electrician.png"},
    {"text": "Plumbing", "icon": "assets/icons/plumbing.png"},
    {"text": "Parlour", "icon": "assets/icons/salon.png"},
    {"text": "Car Wash", "icon": "assets/icons/car_wash.png"},
    {"text": "Shifting", "icon": "assets/icons/shifting.png"},
    {"text": "Appliances", "icon": "assets/icons/appliances.png"},
    {"text": "Repairing", "icon": "assets/icons/repairing.png"},
  ];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.serviceName != '') {
      getSearchCategories();
    } else {
      getAllCategories();
    }
    print(widget.serviceName);
  }

  final String url = baseUrl + "admin_get_all_cat.php";
  final String searchurl = baseUrl + "admin_get_search_service.php";

  late List data;

  var isLoading = false;
  Future getAllCategories() async {
    print('\nAll Cat\n');
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json"
    }, body: {
      "cat_status": 'true',
    });

    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body)['result'];
      data = convertDataToJson;
      isLoading = true;
      print(data);
    });
  }

  Future getSearchCategories() async {
    print('\nAll Cat\n');
    var response = await http.post(Uri.parse(searchurl), headers: {
      "Accept": "application/json"
    }, body: {
      "cat_status": 'true',
      "cat_title": widget.serviceName,
    });

    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body)['result'];
      data = convertDataToJson;
      isLoading = true;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 8),
      child: Builder(builder: (context) {
        if (isLoading == true) {
          return GridView.builder(
              controller: _controller,
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminUpdateServicesScreen(
                              serviceName: data[index]['cat_title'] ?? '',
                              sub1: data[index]['sub1'] ?? '',
                              sub2: data[index]['sub2'] ?? '',
                              sub3: data[index]['sub3'] ?? '',
                              sub4: data[index]['sub4'] ?? '',
                              sub5: data[index]['sub5'] ?? '',
                              id: data[index]['id'] ?? '',
                              image: data[index]['cat_image'] ?? '',
                              cat_status: data[index]['cat_status'] ?? '',
                              servicepriceMin: data[index]['min_price'] ?? '',
                              servicepriceMax: data[index]['max_price'] ?? '',
                            ),
                          ));
                    },
                    child: CustomService(
                      icon: data[index]['cat_image'],
                      text: data[index]['cat_title'],
                    ),
                  ),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
