
import "package:flutter/material.dart";

import "object/currency_food.dart";
import "object/food_card_controller.dart";
import "object/image_foods.dart";



class FoodCard extends StatelessWidget {
  FoodCard({
    super.key,
    required this.foodName,
    required this.foodImage,
    required this.price,
    required this.currency,
    required this.listen,
    this.backgroundColor = const Color(0xFF5E8A4D),
    this.btnAddColor = Colors.white,
    this.currencyColor = Colors.white70,
    this.priceColor = Colors.white,
    this.titleColor = Colors.white,
    this.fontFamily = "Tahoma",
    this.txtNameDirection = TextDirection.ltr,
    this.txtNamePositionedRightToLeft = false,
  }) {
    if(foodName.length > 60) throw Exception("The length of the food name is greater than 60 characters.");

  }

  final String foodName;
  final ImageFoods foodImage;
  final String price;
  final CurrencyFood currency;
  final Color backgroundColor;
  final Color btnAddColor;
  final Color currencyColor;
  final Color priceColor;
  final Color titleColor;
  final String fontFamily ;
  final TextDirection txtNameDirection;
  final bool txtNamePositionedRightToLeft ;
  final void Function(FoodCardController controller) listen;

  void _onPressedAdd(){

    listen(FoodCardController(
        foodName: foodName,
        foodImage: foodImage,
        price: price,
        currency: currency
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 350,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black87, 
            spreadRadius: 10, 
            blurRadius: 20, 
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            left: txtNamePositionedRightToLeft ? 0 : 15,
            right: txtNamePositionedRightToLeft ? 15 : 0,
            child: Text(
                foodName,
                textDirection: txtNameDirection,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 16,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),

          Positioned(
            top: 100,
            left: -25,
            child: Transform.scale(
              scale: 1.2,
              child: foodImage.image
            ),
          ),

          Positioned(
            bottom: 55,
            left: 20,
            child: Text(
              currency.currency,
              style: TextStyle(
                color: currencyColor,
                fontSize: 16,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            child: Text(
              price,
              style: TextStyle(
                color: priceColor,
                fontSize: 18,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Positioned(
            bottom: 5,
            right: 1,
            child: ElevatedButton(
              onPressed: () {
              _onPressedAdd();
              },
              style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: btnAddColor),
              child: Icon(Icons.add, color: backgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
