
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'food_card.dart';

class ListFoodsHorizontal extends StatefulWidget {
   ListFoodsHorizontal({super.key, required this.items, required this.itemCount,this.color = Colors.white70 }){
    if(itemCount != items.length){
      throw Exception("The itemCount must be equal to the length of the items. otherwise, you will receive an error");
    }
  }

  final Color color;
  final List<FoodCard> items;
  final int itemCount;

  @override
  State<ListFoodsHorizontal> createState() => _ListFoodsHorizontalState();
}

class _ListFoodsHorizontalState extends State<ListFoodsHorizontal> {
  final ScrollController _scrollController = ScrollController();
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  void _onVisibilityChanged(int index, double visibleFraction) {
    if (visibleFraction > 0.5 && index != activeIndex) {
      setState(() {
        activeIndex = index;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ]
        ),
        height: 400,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.itemCount,
          itemBuilder: (context, index) {
            bool isActive = index == activeIndex;

            return VisibilityDetector(
              key: Key(index.toString()),
              onVisibilityChanged: (visibilityInfo) {
                _onVisibilityChanged(index, visibilityInfo.visibleFraction);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 55),
                transform: Matrix4.identity()
                  ..translate(isActive ? 0.0 : 0.0, isActive ? -10.0 : 0.0),
                child: Opacity(
                  opacity: isActive ? 1.0 : 0.4,
                  child: Center(child: widget.items[index]),
                ),
              ),
            );
          },
        ),
      );
  }
}
