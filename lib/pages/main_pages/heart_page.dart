import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../services/https_client_service.dart';
import '../../svg_icons.dart';
import '../../widgets/not_found_widget.dart';

class HeartPage extends StatefulWidget {
  const HeartPage({super.key});

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ClientService.getFavorites(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue));
          } else if(snapshot.hasData) {
            List<ProductModel> allProducts = List<ProductModel>.from(json.decode(snapshot.data ?? '[]').map((e) => ProductModel.fromJson(e)));
            List<Map<String, dynamic>> allProductsMockApi = List<Map<String, dynamic>>.from(json.decode(snapshot.data ?? '[]'));
            return RefreshIndicator(
              onRefresh: () async => setState((){}),
              child: allProducts.isNotEmpty ? ListView.separated(
                itemCount: allProducts.length,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  ProductModel productModel = allProducts[index];
                  return Container(
                    height: 335,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF4F4F4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Name: ${productModel.name}"
                                "\nCalories: ${productModel.calories}"
                                "\nServing size g: ${productModel.serving_size_g}"
                                "\nFat total g: ${productModel.fat_total_g}"
                                "\nFat saturated g: ${productModel.fat_saturated_g}"
                                "\nProtein g: ${productModel.protein_g}"
                                "\nSodium mg: ${productModel.sodium_mg}"
                                "\nPotassium mg: ${productModel.potassium_mg}"
                                "\nCholesterol mg: ${productModel.cholesterol_mg}"
                                "\nCarbohydrates total g: ${productModel.carbohydrates_total_g}"
                                "\nFiber g: ${productModel.fiber_g}"
                                "\nSugar g: ${productModel.sugar_g}"
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () async {
                              bool result = await ClientService.delete(allProductsMockApi[index]['id']);
                              if(!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      result
                                          ? "Muvofaqiyatli bajarildi"
                                          : "Xatolik yuz berdi",
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    dismissDirection: DismissDirection.horizontal,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.black,
                                  )
                              );
                              setState((){});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ) : notFound(
                  iconPath: SvgIcons.homeNotFound,
                  text1: "No Foods Found",
                  text2: "You don’t save any food. Go ahead, search and save your favorite food"
              ),
            );
          } else {
            return const Center(child: Text("Xatolik yuz berdi"));
          }
        },
      ),
    );
  }
}
