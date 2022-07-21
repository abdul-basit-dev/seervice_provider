import 'package:flutter/material.dart';
import 'package:handyprovider/screens/offers_detail/offers_detail_screen.dart';

import '../../../../constants.dart';
import '../../../view_services_details/view_services_details.dart';

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

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ListView.builder(
          controller: _controller,
          shrinkWrap: true,
          itemCount: _listImages.length,
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
                  Navigator.pushNamed(context, ServiceDetailScreen.routeName);
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
                          children: const <Widget>[
                            SizedBox(height: 4),
                            Text(
                              "House Cleaning",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Person Name",
                              style: TextStyle(
                                fontSize: 14,
                                color: kTextColorSecondary,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "RS:2500",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8),
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
      },
    );
  }
}
