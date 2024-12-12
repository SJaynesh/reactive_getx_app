import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_getx_counter_app/controllers/counter_controller.dart';

import '../../controllers/recipes_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController controller = Get.put(CounterController());
    RecipesController recipesController = Get.put(RecipesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton.outlined(
            onPressed: () {
              Get.toNamed('/ecommerce');
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CounterController>(
              builder: (_) => Text(
                controller.count.value.toString(),
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Obx(
              () => Text(
                "Count : ${controller.count.value}",
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
