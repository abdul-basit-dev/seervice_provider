import 'package:flutter/material.dart';
import 'package:handyprovider/components/default_button.dart';
import 'package:handyprovider/screens/location_permission/location_permission_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'dart:async';
import 'dart:io';

class TrackingForm extends StatefulWidget {
  const TrackingForm({Key? key}) : super(key: key);

  @override
  State<TrackingForm> createState() => _TrackingFormState();
}

class _TrackingFormState extends State<TrackingForm> {
  bool agree = false;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  static const snackBar = SnackBar(
    content: Text('Provide Required Informaition!'),
  );
  //Camera Method
  Future openCamera() async {
    var imageFrmCamera = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = File(imageFrmCamera!.path);
    });
    //if (mounted) Navigator.of(context).pop();
  }

  //Gallery method
  Future openGallery() async {
    var pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedFile!.path);
    });
    // if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(24)),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Tracking ID",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: kTextColor, fontSize: 18),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(12)),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Please choose a tracking id issued by NADRA, or any other document that validates you.",
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(color: kTextColorSecondary, fontSize: 14),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: _selectedImage == null
                        ? Image.asset(
                            "assets/images/cleaner_2.png",
                            fit: BoxFit.fill,
                            width: 150,
                            height: 150,
                          )
                        : Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        label: const Text("Gallery"),
                        onPressed: () {
                          openGallery();
                        },
                        icon: const Icon(
                          Icons.image_outlined,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenHeight(20)),
                    Expanded(
                      child: ElevatedButton.icon(
                        label: const Text("Camera"),
                        onPressed: () {
                          openCamera();
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: agree,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          agree = value!;
                        });
                      },
                    ),
                    const Text(
                      "I agree to Terms & Conditions",
                      style:
                          TextStyle(fontSize: 12, color: kTextColorSecondary),
                    ),
                  ],
                ),
              ],
            ),
            DefaultButton(
              press: () {
                if (agree == true && _selectedImage != null) {
                  Navigator.pushNamed(
                      context, LocationPermissionScreen.routeName);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              text: "Create Account",
            )
          ]),
    );
  }
}
