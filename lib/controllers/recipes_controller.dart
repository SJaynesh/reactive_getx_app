import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reactive_getx_counter_app/models/recipes_model.dart';

class RecipesController extends GetxController {
  RxList<RecipesModel> recipesList = <RecipesModel>[].obs;
  RxList<RecipesModel> addToCartList = <RecipesModel>[].obs;

  RecipesController() {
    loadRecipesJsonData();
  }

  Future<void> loadRecipesJsonData() async {
    String assetJsonPath = "assets/json/recip.json";

    String recipesData = await rootBundle.loadString(assetJsonPath);

    List allRecipesData = jsonDecode(recipesData);

    recipesList.value = allRecipesData
        .map(
          (e) => RecipesModel.fromJson(json: e),
        )
        .toList();
  }

  void addToCartRecipes({required RecipesModel item}) {
    addToCartList.add(item);

    log("Cart List Length : ${addToCartList.length}");

    Get.back();
  }
}
