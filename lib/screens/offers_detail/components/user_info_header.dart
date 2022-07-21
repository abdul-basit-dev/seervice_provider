import 'package:flutter/material.dart';
import 'package:handyprovider/constants.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: kTextColorSecondary.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(height: 8),
              Text(
                "Customer Name",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                "0343054546465",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                "example@gmail.com",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                "Adress, house number, street, City, PK",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
