import 'package:flutter/material.dart';
import 'package:handyprovider/constants.dart';

class CustomService extends StatelessWidget {
  const CustomService({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kTextColorSecondary.withOpacity(0.2),
            ),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(icon),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: kTextColorSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
