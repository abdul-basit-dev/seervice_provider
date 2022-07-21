import 'package:flutter/material.dart';
import 'package:handyprovider/screens/offers_detail/offers_detail_screen.dart';

import '../../../constants.dart';

class NewOffers extends StatefulWidget {
  const NewOffers({Key? key}) : super(key: key);

  @override
  State<NewOffers> createState() => _NewOffersState();
}

class _NewOffersState extends State<NewOffers> {
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
                                Text(
                                  "Adress, House, phase, Rawalpindi",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kTextColorSecondary,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8),
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
                                Navigator.pushNamed(
                                    context, OffersDetails.routeName);
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
      },
    );
  }
}
