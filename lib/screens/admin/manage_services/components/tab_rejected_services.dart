import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../helper/global_config.dart';
import '../../../view_services_details/view_services_details.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RehjectedServices extends StatefulWidget {
  const RehjectedServices({Key? key}) : super(key: key);

  @override
  State<RehjectedServices> createState() => _RehjectedServicesState();
}

class _RehjectedServicesState extends State<RehjectedServices> {
  final ScrollController _controller = ScrollController();
  final List<String> _listImages = [
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
    "assets/images/cleaner_2.png",
  ];
  final String url = baseUrl + "provider/getallservices.php";

  late List data;

  var isLoading = false;
  bool isAdmin = true;

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  Future getAllData() async {
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json"
    }, body: {
      "service_status": 'reject',
    });
    //print(response.body);
    setState(() {
      List convertDataToJson = json.decode(response.body)['result'];
      data = convertDataToJson;
      isLoading = true;
      print(data);
    });

    // throw Exception('Failed to load data');
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isLoading == true) {
          return ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, ServiceDetailScreen.routeName);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailScreen(
                            //first one will be available in next sceen
                            //second one we have here in this screen
                            title: data[index]['service_title'],
                            id: data[index]['id'],
                            speciality: data[index]['service_speciality'],
                            description: data[index]['service_description'],
                            note: data[index]['service_extra_note'],
                            adress: data[index]['adress'],
                            rate: data[index]['rate'],
                            status: data[index]['service_status'],
                            spName: data[index]['service_provider_name'],
                            spId: data[index]['service_provider_id'],
                            serviceImages: data[index]['service_images'],
                            serviceImages1: data[index]['images1'],
                            serviceImages2: data[index]['images2'],
                          ),
                        )).then((value) => setState(() => {getAllData()}));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image(
                              width: 96,
                              height: 96,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                _listImages[index],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(height: 4),
                              Text(
                                data[index]['service_title'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data[index]['service_speciality'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kTextColorSecondary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data[index]['rate'],
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          child: const Text(
                            "Rejected",
                            style:
                                TextStyle(fontSize: 12, color: kSecondaryColor),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
