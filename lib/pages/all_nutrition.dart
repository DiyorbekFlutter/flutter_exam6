import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam6/models/product_model.dart';
import 'package:flutter_exam6/services/https_client_service.dart';

import '../svg_icons.dart';
import '../widgets/not_found_widget.dart';

class AllNutrition extends StatefulWidget {
  final String text;
  const AllNutrition({required this.text, super.key});

  @override
  State<AllNutrition> createState() => _AllNutritionState();
}

class _AllNutritionState extends State<AllNutrition> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 85),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF4F4F4),
                hintText: 'Junk Food',
                prefixIcon: const Icon(CupertinoIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: ClientService.get({"query": controller.text.trim()}),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue));
          } else if(snapshot.hasData) {
            List<ProductModel> allProducts = List<ProductModel>.from(json.decode(snapshot.data ?? '[]').map((e) => ProductModel.fromJson(e)));
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
                              bool result = await ClientService.post(productModel.toJson);
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
                            },
                            icon: const Icon(Icons.favorite_border),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ) : notFound(
                  iconPath: SvgIcons.homeNotFound,
                  text1: "No Results Found",
                  text2: "Try searching for a different keywork or tweek your search a little"
              ),
            );
          } else {
            return const Center(child: Text("Xatolik yuz berdi"));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
