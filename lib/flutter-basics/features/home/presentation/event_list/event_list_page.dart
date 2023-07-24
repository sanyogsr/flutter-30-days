import 'package:flutter/material.dart';
import 'package:thirty_days/flutter-basics/features/home/presentation/event_list/search_box.dart';
import 'package:thirty_days/flutter-basics/features/home/presentation/event_list/search_category.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sanyog",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),

        // centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(child: FlutterLogo()),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: const [
            SearchBox(),
            const SizedBox(
              height: 20,
            ),
            SearchCategory(activeCategory: 'all')
          ],
        ),
      ),
    );
  }
}
