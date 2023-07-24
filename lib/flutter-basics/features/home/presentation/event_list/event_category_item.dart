// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EventCategoryItem extends StatelessWidget {
  final bool isActive;
  final String text;
  final bool isFirst;
  final bool isLast;

  const EventCategoryItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      margin: isLast
          ? EdgeInsets.only(right: 16)
          : EdgeInsets.only(left: isFirst ? 16 : 8),
      decoration: BoxDecoration(
          color: isActive ? Colors.blue.shade200 : Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
