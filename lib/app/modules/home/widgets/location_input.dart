import 'package:flutter/material.dart';
import 'package:form/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(),
      builder: (ctrl) {
        Widget content = const Icon(Icons.location_on_outlined);
        if (ctrl.isLoading) {
          content = const CircularProgressIndicator();
        }
        if (ctrl.location != null) {
          content = const Text('Location is fetched');
        }
        return GestureDetector(
          onTap: () {
            ctrl.getLocation();
          },
          child: Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            child: content,
          ),
        );
      },
    );
  }
}
