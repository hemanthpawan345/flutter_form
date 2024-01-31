import 'package:flutter/material.dart';

import '../../data/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(user.name),
          Image.file(user.image!),
          Text(
            "Latitute ${user.location!.latitude}  longitute ${user.location!.longitude}",
          ),
        ],
      ),
    );
  }
}
