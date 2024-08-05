import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 0.1,
                )),
            child: ClipOval(
              child: Image.asset('images/default_profile.png'),
            ),
          ),
          Text('uid'),
          Text('toggle button to change qr code screen'),
        ],
      ),
    );
  }
}
