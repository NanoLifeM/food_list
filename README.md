<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart

class ExecuteCodeForUse extends StatelessWidget {
  const ExecuteCodeForUse({super.key});

  void foodCardController(FoodCardController controller) {
    print(
      "${controller.foodName} , ${controller.price} , ${controller.currency.currency} ",
    );
  }

  @override
  Widget build(BuildContext context) {
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
    return Center(
      child: ListFoods(itemCount: 5, items: listFood, color: Colors.white70),
    );
  }
}


```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
