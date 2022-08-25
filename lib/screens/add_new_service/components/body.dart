import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handyprovider/components/default_button.dart';
import 'package:handyprovider/screens/add_new_service/components/add_service_images/add_service_images.dart';
import 'package:handyprovider/screens/map_location/map_location_screen.dart';
import 'package:handyprovider/size_config.dart';

import '../../../constants.dart';
import '../../../helper/global_config.dart';
import '../../../helper/keyboard.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Initial Selected Value
  String dropdownvalue = '';
  String dropdownvalueSub = 'Select';

  // List of items in our dropdown menu
  var items = [''];
  var itemsSubCat = ['Select'];
  final _formKey = GlobalKey<FormState>();
  String? serviceTitle;
  String? serviceDescription;
  String? extraNote;
  String? serviceRate;
  String? adress = box!.get("adress");
  final String url = baseUrl + "admin_get_all_cat_title.php";
  final String subCatUrl = baseUrl + 'admin_get_sub_cat.php';

  late List data;
  late List dataSubCat;

  var isLoading = false;
  bool isLoadingSUb = false;

  @override
  void initState() {
    super.initState();
    print('id:..');
    print(box!.get('id'));
    getAllCategories();
    //getSubCategories('Parlor');
  }

  Future getAllCategories() async {
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    //print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body)['result'];
      data = convertDataToJson;
      isLoading = true;
      for (var i = 0; i < data.length; i++) {
        items.add(data[i]['cat_title']);
      }
      print(data);
      print(items);
    });

    // throw Exception('Failed to load data');
  }

  Future getSubCategories(String title) async {
    var response = await http.post(Uri.parse(subCatUrl), headers: {
      "Accept": "application/json"
    }, body: {
      "cat_title": title,
    });
    //print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body)['result'];
      dataSubCat = convertDataToJson;

      isLoadingSUb = true;

      for (var i = 0; i < dataSubCat.length; i++) {
        if (dataSubCat[i]['sub5'] != null) {
          itemsSubCat.add(dataSubCat[i]['sub1']);
          itemsSubCat.add(dataSubCat[i]['sub2']);
          itemsSubCat.add(dataSubCat[i]['sub3']);
          itemsSubCat.add(dataSubCat[i]['sub4']);
          itemsSubCat.add(dataSubCat[i]['sub5']);
        } else if (dataSubCat[i]['sub4'] != null) {
          itemsSubCat.add(dataSubCat[i]['sub1']);
          itemsSubCat.add(dataSubCat[i]['sub2']);
          itemsSubCat.add(dataSubCat[i]['sub3']);
          itemsSubCat.add(dataSubCat[i]['sub4']);
        } else if (dataSubCat[i]['sub3'] != null) {
          itemsSubCat.add(dataSubCat[i]['sub1']);
          itemsSubCat.add(dataSubCat[i]['sub2']);
          itemsSubCat.add(dataSubCat[i]['sub3']);
        } else if (dataSubCat[i]['sub2'] != null) {
          itemsSubCat.add(dataSubCat[i]['sub1']);
          itemsSubCat.add(dataSubCat[i]['sub2']);
        } else if (dataSubCat[i]['sub1'] != null) {
          itemsSubCat.add(dataSubCat[i]['sub1']);
        } else {
          print('No SUb Cat');
        }
        print(itemsSubCat);
      }
      if (response.body == null) {
        print('No SUb Cat');
        isLoadingSUb = false;
      }
      isLoadingSUb = false;
      print(dataSubCat);
      print(itemsSubCat);
    });

    // throw Exception('Failed to load data');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: getProportionateScreenHeight(16)),
                    const Text(
                      "Set Up Your Service",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kTextColorSecondary.withOpacity(0.5)),
                        child: ListTile(
                          title: const Text("Choose Speciality"),
                          trailing: DropdownButton(
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                print(dropdownvalue);

                                getSubCategories(dropdownvalue);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    ////
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kTextColorSecondary.withOpacity(0.5)),
                        child: ListTile(
                          title: const Text("Choose Sub Category"),
                          trailing: DropdownButton(
                            // Initial Value
                            value: dropdownvalueSub,

                            // Down Arrow Icon
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined),

                            // Array list of items
                            items: itemsSubCat.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalueSub = newValue!;
                                print(dropdownvalueSub);
                                // itemsSubCat.clear();
                                // getSubCategories(dropdownvalue);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Service Title",
                      style: TextStyle(
                        color: kTextColorSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildTitleFormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    const Text(
                      "Service Description",
                      style: TextStyle(
                        color: kTextColorSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildDescriptionFormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    const Text(
                      "Extra Note (If any)",
                      style: TextStyle(
                        color: kTextColorSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildServiceNoteFormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    const Text(
                      "Set Your Hourly Rate (PKR)",
                      style: TextStyle(
                        color: kTextColorSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildRateFormField(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    const Text(
                      "Adress",
                      style: TextStyle(
                        color: kTextColorSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildAdressFormField(),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(48)),
              DefaultButton(
                press: () {
                  // Navigator.pushNamed(context, AddServiceImages.routeName);
                  _sendToNextScreen(context);
                  KeyboardUtil.hideKeyboard(context);
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTitleFormField() {
    return TextFormField(
      maxLines: 1,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => serviceTitle = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in this";
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
        fillColor: kTextColorSecondary.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  TextFormField buildRateFormField() {
    return TextFormField(
      maxLines: 1,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => serviceRate = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in this";
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
        fillColor: kTextColorSecondary.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      maxLines: 4,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => serviceDescription = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in this";
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
        fillColor: kTextColorSecondary.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  TextFormField buildServiceNoteFormField() {
    return TextFormField(
      maxLines: 2,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => extraNote = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in this";
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
        fillColor: kTextColorSecondary.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  TextFormField buildAdressFormField() {
    return TextFormField(
      maxLines: 1,
      initialValue: adress,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => adress = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in this";
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
          fillColor: kTextColorSecondary.withOpacity(0.3),
          filled: true,
          hintText: box!.get("adress"),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.add_location,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MapScreen.routeName);
            },
          )),
    );
  }

  _sendToNextScreen(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // if all are valid then go to success screen
      KeyboardUtil.hideKeyboard(context);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddServiceImages(
              //first one will be available in next sceen
              //second one we have here in this screen
              title: serviceTitle!,
              speciality: dropdownvalue,
              sub_cat: dropdownvalueSub,
              description: serviceDescription!,
              note: extraNote!,
              adress: adress!,
              rate: serviceRate!,
            ),
          ));
    }
  }
}
