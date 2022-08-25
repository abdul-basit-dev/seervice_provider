import 'package:flutter/material.dart';
import 'package:handyprovider/helper/global_config.dart';

import '../../../../constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../view_services_details/view_services_details.dart';
import '../provider_details/provider_details_screen.dart';

class TabRejectedServiceProviders extends StatefulWidget {
  const TabRejectedServiceProviders({Key? key}) : super(key: key);

  @override
  State<TabRejectedServiceProviders> createState() =>
      _TabRejectedServiceProvidersState();
}

class _TabRejectedServiceProvidersState
    extends State<TabRejectedServiceProviders> {
  final ScrollController _controller = ScrollController();

  final String url = baseUrl + "admin_get_all_sp.php";

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
      "status": 'reject',
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Builder(
        builder: (context) {
          if (isLoading == true) {
            return ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  margin: const EdgeInsets.only(
                      left: 24, right: 24, top: 16, bottom: 8),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Column(
                        children: [
                          Row(
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
                                    image: NetworkImage(
                                      data[index]['profile_img'],
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
                                      data[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      data[index]['email'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: kTextColorSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data[index]['contact'],
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data[index]['adress'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: kTextColorSecondary,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  child: const Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontSize: 12, color: kSecondaryColor),
                                  ),
                                  onPressed: () {
                                    //SEND TO NEXT SCREEN
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProviderDetailsScreen(
                                                //first one will be available in next sceen
                                                //second one we have here in this screen
                                                name: data[index]['name'],
                                                id: data[index]['id'],
                                                email: data[index]['email'],
                                                cnic: data[index]['cnic'],
                                                contact: data[index]['contact'],
                                                adress: data[index]['adress'],
                                                gender: data[index]['gender'],
                                                status: data[index]['status'],
                                                image: data[index]['image'],
                                                img: data[index]['profile_img'],
                                                p_token: data[index]['p_token'],
                                              ),
                                            ))
                                        .then((value) =>
                                            setState(() => {getAllData()}));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
