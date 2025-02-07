
import 'package:flutter/material.dart';
import 'food_card.dart';

class ListFoods extends StatefulWidget {
   ListFoods({super.key, required this.items, required this.itemCount,this.color = Colors.white70 }){
    if(itemCount != items.length){
      Exception("The itemCount must be equal to the length of the items. otherwise, you will receive an error");
    }
  }

  final Color color;
  final List<FoodCard> items;
  final int itemCount;

  @override
  State<ListFoods> createState() => _ListFoodsState();
}

class _ListFoodsState extends State<ListFoods> {
  final ScrollController _scrollController = ScrollController();
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;

      int newIndex = (offset / 220).floor(); // پیدا کردن ایندکس کارت وسط
      if (newIndex != activeIndex && newIndex < widget.itemCount) {
        setState(() {
          activeIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // رنگ سایه
            spreadRadius: 10, // میزان پخش شدن سایه
            blurRadius: 20, // میزان تاری سایه
            offset: Offset(0, 10),
          )
        ]
      ),
      height: 450, // ارتفاع ثابت برای لیست
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          bool isActive = activeIndex == index;
         return Padding(
            padding: const EdgeInsets.symmetric( horizontal: 55),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              transform: Matrix4.identity()..scale(isActive ? 1.1 : 1.0), // بزرگ‌تر شدن کارت فعال
              child: Opacity(
                opacity: isActive ? 1.0 : 0.6, // کم‌رنگ شدن بقیه کارت‌ها
                child: Center(child: widget.items[index])
              ),
            ),
          );
        },
      ),
    );
  }
}
