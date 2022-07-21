import 'package:flutter/material.dart';
import 'package:handyprovider/components/default_button.dart';
import 'package:handyprovider/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kFormColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Reject",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: const BorderSide(color: Colors.red),
                  ),
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  primary: Colors.white,
                  onPrimary: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DefaultButton(
                press: () {},
                text: "Approve",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
