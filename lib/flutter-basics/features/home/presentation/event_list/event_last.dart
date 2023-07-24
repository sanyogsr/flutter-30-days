import 'package:flutter/material.dart';
import 'package:thirty_days/flutter-basics/features/home/presentation/event_list/model/mock.dart';

class EventLast extends StatelessWidget {
  const EventLast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: categories.length,
      itemBuilder: (context, index) {},
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.black,
          height: 0,
        );
      },
    );
  }
}
