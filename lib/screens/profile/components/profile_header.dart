import 'package:flutter/material.dart';

import 'package:handyprovider/constants.dart';
import 'package:handyprovider/screens/profile/components/edit_profile/edit_profile_screen.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool verified = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 48.0,
                backgroundImage: AssetImage("assets/images/user.png"),
                // backgroundImage: NetworkImage(data[index]['avatar_url']),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Abdul Basit",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: kTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.verified,
                      size: 20,
                      color: verified ? kPrimaryColor : kTextColorSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "abc123@gmail.com",
              style: secondaryTextStyle12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 24, 80, 0),
              child: SizedBox(
                width: 124,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EditProfileScreen.routeName);
                  },
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
