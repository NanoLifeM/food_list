import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_list/food_list.dart';

void foodCardController(FoodCardController controller) {
  print(
    "${controller.foodName} , ${controller.price} , ${controller.currency.currency} ",
  );
}

void main() {
  test('adds one to input values', () {
    List<FoodCard> listFood = [
      FoodCard(
        ///The length of the food name is greater than 60 characters
        foodName: "Cheese Burger",
        foodImage: ImageFoods.burger,
        price: "44.15",
        currency: CurrencyFood.dollar,
        listen: (controller) => foodCardController,
        backgroundColor: Colors.blueAccent,
        fontFamily: "Tahoma",
        btnAddColor: Colors.black,
        currencyColor: Colors.red,
        priceColor: Colors.green,
        titleColor: Colors.amberAccent,
      ),

      /// defult card values color,fontFamily,txtDirection
      FoodCard(
        foodName: "Double Cheese\nBurger",
        foodImage: ImageFoods.doubleDouble,
        price: "56.89",
        currency: CurrencyFood.dollar,
        listen: (controller) => foodCardController,
        titleColor: Colors.white,
        priceColor: Colors.white,
        currencyColor: Colors.white70,
        btnAddColor: Colors.white,
        backgroundColor: const Color(0xFF5E8A4D),
        fontFamily: "Tahoma",
        txtNameDirection: TextDirection.ltr,
        txtNamePositionedRightToLeft: false,
      ),
      FoodCard(
        foodName: "نودل",
        foodImage: ImageFoods.noodle,
        price: "54.12",
        currency: CurrencyFood.dollar,
        listen: (controller) => foodCardController,
        txtNameDirection: TextDirection.rtl,
        txtNamePositionedRightToLeft: true,
      ),
      FoodCard(
        foodName: "Chicken Sandwich",
        foodImage: ImageFoods.chickenSandwich,
        price: "56.51",
        currency: CurrencyFood.dollar,
        listen: (controller) => foodCardController,
      ),
      FoodCard(
        foodName: "Chicken Sandwich",
        foodImage: ImageFoods.pizza,
        price: "85.65",
        currency: CurrencyFood.dollar,
        listen: (controller) => foodCardController,
      ),
    ];

    /// The itemCount must be equal to the length of the items. otherwise, you will receive an error
    ListFoods(itemCount: 5, items: listFood, color: Colors.white70);
  });
}

