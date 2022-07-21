import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../../components/default_button.dart';
import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../../../../home_screen/homescreen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: getProportionateScreenHeight(16)),
          const Text(
            "Choose Service images",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(4)),
          const Text(
            "You can add upto 5",
            style: TextStyle(
              color: kTextColorSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(24)),
          ElevatedButton.icon(
            label: const Text(
              "Choose Images",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            icon: const Icon(Icons.add_photo_alternate_outlined),
            style: ElevatedButton.styleFrom(
                primary: kPrimaryColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 24)),
            onPressed: () {
              selectImages();
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: imageFileList!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: kFormColor,
                      child: imageFileList == null
                          ? const Icon(Icons.add)
                          : Image.file(
                              File(imageFileList![index].path),
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                    );
                  }),
            ),
          ),
          DefaultButton(
            press: () {
              //  Navigator.pushNamed(context, AddServiceImages.routeName);
              showConfirmationScreen(context);
            },
            text: "Submit",
          ),
          SizedBox(height: getProportionateScreenHeight(48)),
        ],
      ),
    );
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
                  "Your Service Has been sent to Admin for Review.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
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
