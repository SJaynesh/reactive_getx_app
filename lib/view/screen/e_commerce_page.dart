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
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Transform.translate(
                    offset: const Offset(0, -2),
                    child: Obx(
                      () => Text(
                        "${controller.addToCartList.length}",
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.grey.withOpacity(0.4),
      ),
      backgroundColor: Colors.white60,
      body: (controller.recipesList.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                var item = controller.recipesList[index];
                return GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: "ADD TO CART",
                      content: Column(
                        children: [
                          Text(item.name),
                          ElevatedButton(
                            onPressed: () {
                              controller.addToCartRecipes(item: item);
                            },
                            child: const Text("Add to cart"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(item.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "⭐ ${item.rating}",
                            style: const TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: controller.recipesList.length,
            )
          : const Center(
              child: Text("No Data"),
            ),
    );
  }
}
