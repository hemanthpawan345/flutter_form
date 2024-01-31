import 'package:flutter/material.dart';
import 'package:form/app/modules/home/controller/home_controller.dart';
import 'package:form/app/modules/home/widgets/image_input.dart';
import 'package:form/app/modules/home/widgets/location_input.dart';
import 'package:form/app/modules/profile/view.dart';
import 'package:get/get.dart';

import '../../data/models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: ctrl.formKey,
              child: TextFormField(
                controller: ctrl.textController,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                ),
              ),
            ),
            const ImageInput(),
            const LocationInput(),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => ProfileScreen(
                    user: User(
                      name: ctrl.textController.text,
                      image: ctrl.image,
                      location: ctrl.location,
                    ),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
