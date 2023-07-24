// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:thirty_days/flutter-basics/features/home/presentation/event_list/event_category_item.dart';
import 'package:thirty_days/flutter-basics/features/home/presentation/event_list/model/mock.dart';

class SearchCategory extends StatelessWidget {
  final String activeCategory;
  const SearchCategory({
    Key? key,
    required this.activeCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return EventCategoryItem(
              isActive: categories[index] == activeCategory,
              text: categories[index],
              isLast: index == categories.length -1,
              isFirst: index ==0,
            );
          }),
    );
  }
}
