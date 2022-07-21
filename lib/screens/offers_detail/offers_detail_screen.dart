import 'package:flutter/material.dart';
import 'package:handyprovider/components/default_button.dart';
import 'package:handyprovider/size_config.dart';

import '../../components/secondry_btn.dart';
import '../../constants.dart';
import '../home_screen/homescreen.dart';
import 'components/body.dart';

class OffersDetails extends StatelessWidget {
  const OffersDetails({Key? key}) : super(key: key);

  static String routeName = "/offer_detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "Offer Details",
            style: TextStyle(color: kTextColor),
          ),
        ),
        body: const Body(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SecondaryButton(
                  press: () {
                    Navigator.pushNamedAndRemoveUntil(
                        (context), HomeScreen.routeName, (route) => false);
                  },
                  text: "Cancel",
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(8)),
              Expanded(
                child: DefaultButton(
                  press: () {
                    showConfirmationScreen(context);
                  },
                  text: "Accept",
                ),
              ),
            ],
          ),
        ));
  }

  void showConfirmationScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: ((context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 24),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Image.asset(
                  "assets/images/paymentsuccess.png",
                  width: 200,
                  height: 200,
                ),
              ),
              const Expanded(
                child: Text(
                  "Congratulations",
                  style: TextStyle(
                      color: kPrimaryLightColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  "Your have accepted the offer\nGo to Offer Section to see details",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          (context), HomeScreen.routeName, (route) => false);
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.5 / 2),
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradientColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Text(
                            "Back to home",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
