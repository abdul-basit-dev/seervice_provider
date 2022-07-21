import 'package:flutter/material.dart';
import 'package:handyprovider/components/default_button.dart';
import 'package:handyprovider/screens/add_new_service/components/add_service_images/add_service_images.dart';
import 'package:handyprovider/size_config.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Initial Selected Value
  String dropdownvalue = '';
  // List of items in our dropdown menu
  var items = [
    '',
    'Plumber',
    'Make up Artist',
    'Electrician',
    'Sweepars',
    'Handyman',
    'Mechanics',
    'Car Washing',
    'Carpebter',
    'Interior Designer',
    'Maids',
    'Others',
  ];
  final _formKey = GlobalKey<FormState>();
  String serviceTitle = "empty";
  String serviceDescription = "empty";
  String extraNote = "empty";
  String? adress;

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
                          title: const Text("Choose Your Speciality"),
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
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    const Text(
                      "Service Title",
                      style: TextStyle(
                        color: kTextColorSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    buildFormField(serviceTitle, 1),
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
                    buildFormField(serviceDescription, 4),
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
                    buildFormField(extraNote, 2),
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
                  Navigator.pushNamed(context, AddServiceImages.routeName);
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildFormField(String value, int lines) {
    return TextFormField(
      maxLines: lines,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => value = newValue!,
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
          hintText: "Your Adress",
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.add_location,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          )),
    );
  }
}
