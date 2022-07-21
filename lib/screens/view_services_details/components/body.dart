import 'package:flutter/material.dart';

import '../../../components/header_image.dart';
import '../../../constants.dart';
import '../../../helper/global_config.dart';
import '../../../size_config.dart';
import 'about_section.dart';
import 'reviews_container.dart';
import 'service_info.dart';
import 'show_work_images.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isAdmin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (box!.containsKey("admin_login")) {
      setState(() {
        isAdmin = true;
      });
    } else {
      setState(() {
        isAdmin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            const ServiceImageHeader(),
            Positioned(
              top: 44,
              left: 24,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: kFormColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(36)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kTextColorSecondary,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          const ServiceInfo(),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          const Divider(
            color: kFormColor,
            height: 2,
            thickness: 2,
          ),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          const AboutSection(),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                isAdmin == true ? "Work ID" : "Work Images",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 12,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const WorkImagesGridView(),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          const Divider(
            color: kFormColor,
            height: 8,
            thickness: 8,
          ),
          SizedBox(
            height: getProportionateScreenHeight(24),
          ),
          Visibility(
              visible: isAdmin == true ? false : true,
              child: const ReviewsContainer()),
        ],
      ),
    );
  }
}
