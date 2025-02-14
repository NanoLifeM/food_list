import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'food_card.dart';

class ListFoodsVertical extends StatefulWidget {
  ListFoodsVertical(
      {super.key,
      required this.items,
      required this.itemCount,
      this.color = Colors.white70}) {
    if (itemCount != items.length) {
      throw Exception(
          "The itemCount must be equal to the length of the items. Otherwise, you will receive an error");
    }
  }

  final Color color;
  final List<FoodCard> items;
  final int itemCount;

  @override
  State<ListFoodsVertical> createState() => _ListFoodsVerticalState();
}

class _ListFoodsVerticalState extends State<ListFoodsVertical> {
  final ScrollController _scrollController = ScrollController();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void _onVisibilityChanged(int index, double visibleFraction) {

    if (visibleFraction > 0.5 && index != activeIndex) {
      setState(() {
        activeIndex = index ~/ 2;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
            childAspectRatio: 0.5,
          ),
          itemCount: widget.itemCount,
          itemBuilder: (context, index) {
            int columnIndex = index ~/ 2;
            bool isActive = columnIndex == activeIndex;
            bool isLastSingleItem = (widget.itemCount % 2 != 0) && (index == widget.itemCount - 1) && (columnIndex == activeIndex);

            return VisibilityDetector(
              key: Key(index.toString()),
              onVisibilityChanged: (visibilityInfo) {
                _onVisibilityChanged(index, visibilityInfo.visibleFraction);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform: Matrix4.identity()..translate(0.0, (isActive || isLastSingleItem) ? -10.0 : 0.0),
                child: Opacity(
                  opacity: (isActive || isLastSingleItem) ? 1.0 : 0.4,
                  child: Center(child: widget.items[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
