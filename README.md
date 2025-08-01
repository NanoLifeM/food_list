
# List Foods Package

[![pub version](https://img.shields.io/pub/v/food_list)](https://pub.dev/packages/food_list) [![Platform](https://img.shields.io/badge/platform-flutter-blue)](https://flutter.dev)

A Flutter package to display a beautiful, customizable list of food cards with images, titles, prices, and interaction callbacks.

## ✨ Features

- **Horizontal & Vertical Lists**: Easily switch between horizontal and vertical scrolling layouts.
- **Customizable Food Card**: Display food image, name, price, and currency.
- **Interaction Callback**: Handle taps with a controller callback.
- **Lightweight & Dependency-Free**: Pure Dart/Flutter implementation.

## 🖼 Screenshots
<div align="center">
  <table>
    <tr>
      <td><img src="assets/screens/img1.jpg" alt="Screen 1" width="200"/></td>
      <td><img src="assets/screens/img2.jpg" alt="Screen 2" width="200"/></td>
    </tr>
    <tr>
      <td><img src="assets/screens/img3.jpg" alt="Screen 3" width="200"/></td>
      <td><img src="assets/screens/img4.jpg" alt="Screen 4" width="200"/></td>
    </tr>
    <tr>
      <td><img src="assets/screens/img5.jpg" alt="Screen 5" width="200"/></td>
      <td><img src="assets/screens/img6.jpg" alt="Screen 6" width="200"/></td>
    </tr>
    <tr>
      <td colspan="2"><img src="assets/screens/img7.jpg" alt="Screen 7" width="200"/></td>
    </tr>
  </table>
</div>

## 🚀 Installation

Add the latest version of `food_list` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  food_list: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 💻 Usage

Import the package and use one of two main widgets:

```dart
import 'package:flutter/material.dart';
import 'package:food_list/food_list.dart';

class MyFoodDemo extends StatelessWidget {
  const MyFoodDemo({Key? key}) : super(key: key);

  void _onFoodSelected(FoodCardController controller) {
    debugPrint(
      'Selected: ${controller.foodName} - ${controller.price} ${controller.currency.currency}',
    );
    // Access image via controller.foodImage.image
  }

  @override
  Widget build(BuildContext context) {
    final items = <FoodCard>[
      FoodCard(
        foodName: 'Burger',
        foodImage: ImageFoods.burger,
        price: '10',
        currency: CurrencyFood.dollar,
        listen: _onFoodSelected,
      ),
      // Add more FoodCard items...
    ];

    return Column(
      children: [
        // Horizontal list
        ListFoodsHorizontal(
          itemCount: items.length,
          items: items,
          color: Colors.white70,
        ),

        const SizedBox(height: 24),

        // Vertical list
        ListFoodsVertical(
          itemCount: items.length,
          items: items,
          color: Colors.white70,
        ),
      ],
    );
  }
}
```

### Widget Parameters

| Widget                | Parameter   | Type             | Description                |
| --------------------- | ----------- | ---------------- | -------------------------- |
| `ListFoodsHorizontal` | `itemCount` | `int`            | Number of items            |
|                       | `items`     | `List<FoodCard>` | List of `FoodCard` models  |
|                       | `color`     | `Color`          | Background color for cards |
| `ListFoodsVertical`   | `itemCount` | `int`            | Number of items            |
|                       | `items`     | `List<FoodCard>` | List of `FoodCard` models  |
|                       | `color`     | `Color`          | Background color for cards |

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Made with ❤️ by [NanoLifeM](https://github.com/NanoLifeM)*

```
```

