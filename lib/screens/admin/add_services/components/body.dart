import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handyprovider/helper/global_config.dart';
import 'package:handyprovider/screens/admin/admin_dashboard/admin_dashboard.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../helper/keyboard.dart';
import '../../../../size_config.dart';

import 'package:handyprovider/components/default_button.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  bool agree = false;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String? fileName;
  String? serviceName;
  String imageUrl = '';
  String serviceSubCategories1 = 'empty';
  String serviceSubCategories2 = 'empty';
  String serviceSubCategories3 = 'empty';
  String serviceSubCategories4 = 'empty';
  String serviceSubCategories5 = 'empty';
  String servicepriceMin = '0';
  String servicepriceMax = '1000';

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
      fileName = _selectedImage!.path.split('/').last;
      print(fileName);
      uploadImageToFirebase(_selectedImage!, fileName!);
    });
    // if (mounted) Navigator.of(context).pop();
  }

  final Reference _storageReference =
      FirebaseStorage.instance.ref().child("contact_images");

  void uploadImageToFirebase(File file, String fileName) async {
    // Create the file metadata
    //final metadata = SettableMetadata(contentType: "image/jpeg");

    file.absolute.existsSync();
    //upload
    _storageReference.child(fileName).putFile(file).then((firebaseFile) async {
      var downloadUrl = await firebaseFile.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
        print("downloadUrl");
        print(downloadUrl);
      });
    });
  }

  String webUrl = baseUrl + "admin_add_service.php";
  bool? error, sending, success;
  String? msg;
  ////////////
  var snackBar = const SnackBar(
    content: Text('Yay! A SnackBar!'),
  );
  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: getProportionateScreenHeight(4)),
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        text: const TextSpan(
                            text: 'Service Name',
                            style: TextStyle(color: kTextColor, fontSize: 18),
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18))
                            ]),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceNameFormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Service Sub Categories",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: kTextColor.withOpacity(0.5), fontSize: 18),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceSub1FormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceSub2FormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceSub3FormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceSub4FormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceSub5FormField(),
                    SizedBox(height: getProportionateScreenHeight(24)),
                    SizedBox(height: getProportionateScreenHeight(24)),
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        text: const TextSpan(
                            text: 'Service Price',
                            style: TextStyle(color: kTextColor, fontSize: 18),
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18))
                            ]),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(children: [
                      Expanded(child: buildServicePriceMinFormField()),
                      SizedBox(width: getProportionateScreenHeight(20)),
                      Expanded(child: buildServicePriceMaxFormField()),
                    ]),
                    SizedBox(height: getProportionateScreenHeight(12)),
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        text: const TextSpan(
                            text: 'Service Image',
                            style: TextStyle(color: kTextColor, fontSize: 18),
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18))
                            ]),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(12)),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Please choose a relevant service image (*png)",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style:
                            TextStyle(color: kTextColorSecondary, fontSize: 14),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(24)),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: _selectedImage == null
                            ? Image.asset(
                                "assets/images/cleaner_2.png",
                                fit: BoxFit.fill,
                                width: 120,
                                height: 120,
                              )
                            : Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
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
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(48)),
                DefaultButton(
                    text: "Save",
                    press: () {
                      submitService();
                    }),
              ]),
        ),
      ),
    );
  }

  //submit Category
  submitService() async {
    if (imageUrl != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        sending = true;
      });
      KeyboardUtil.hideKeyboard(context);

      sendData();
    } else {
      print("Eror");
      snackBar = const SnackBar(
        content: Text('OOps!!.Eror'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  ///SEND DATA
  ///
  ///

  Future<void> sendData() async {
    if (imageUrl == null) {
      snackBar = const SnackBar(
        content: Text('Must Choose an image'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      sending = false;
      error = true;
    } else if (imageUrl.isNotEmpty && serviceName!.isNotEmpty) {
      print('image' + imageUrl);
      var res = await http.post(Uri.parse(webUrl), body: {
        "cat_title": serviceName,
        "sub1": serviceSubCategories1,
        "sub2": serviceSubCategories2,
        "sub3": serviceSubCategories3,
        "sub4": serviceSubCategories4,
        "sub5": serviceSubCategories5,
        "min_price": servicepriceMin,
        "max_price": servicepriceMax,
        "cat_status": 'true',
        "cat_image": imageUrl,
      }); //sending post request with header data

      if (res.statusCode == 200) {
        print('full response:');
        print('sent image:');
        print(imageUrl);
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
            showConfirmationScreen(context);
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
      print('image URL:' + imageUrl.toString());

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  TextFormField buildServiceNameFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => serviceName = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Service Name",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServicePriceMinFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => servicepriceMin = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Min",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServicePriceMaxFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => servicepriceMax = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Max",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServiceSub1FormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => serviceSubCategories1 = newValue!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Sub Category",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServiceSub2FormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => serviceSubCategories2 = newValue!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Sub Category",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServiceSub3FormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => serviceSubCategories3 = newValue!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Sub Category",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServiceSub4FormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => serviceSubCategories4 = newValue!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Sub Category",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildServiceSub5FormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => serviceSubCategories5 = newValue!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Sub Category",
        fillColor: kFormColor,
        filled: true,
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
                  "New Category Added",
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
                      Navigator.pushNamedAndRemoveUntil((context),
                          AdminDashBoard.routeName, (route) => false);
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
