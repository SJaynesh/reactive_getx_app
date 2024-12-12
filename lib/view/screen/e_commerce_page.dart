import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_getx_counter_app/controllers/recipes_controller.dart';

class ECommercePage extends StatelessWidget {
  const ECommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesController controller = Get.find<RecipesController>();

    log("Data : ${controller.recipesList?.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        centerTitle: true,
        backgroundColor: Colors.grey.withOpacity(0.4),
      ),
      backgroundColor: Colors.white60,
      body: (controller.recipesList != null)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Card(
                child: Container(),
              ),
              itemCount: controller.recipesList?.length,
            )
          : const Center(
              child: Text("No Data"),
            ),
    );
  }
}
