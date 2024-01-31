import 'package:flutter/material.dart';
import 'package:form/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(),
      builder: (ctrl) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          width: double.infinity,
          height: 300,
          alignment: Alignment.center,
          child: ctrl.image == null
              ? GestureDetector(
                  onTap: () => ctrl.captureImage(),
                  child: const Icon(Icons.camera),
                )
              : GestureDetector(
                  onTap: () => ctrl.captureImage(),
                  child: Image.file(
                    ctrl.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
        );
      },
    );
  }
}
