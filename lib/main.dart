import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days/flutter-basics/features/home/presentation/event_list/event_list_page.dart';
import 'package:thirty_days/screen_days/Day1-provider/list_provider.dart';
// import 'package:thirty_days/screen_days/Day1-provider/vertical_list.dart';
// import 'package:thirty_days/screen_days/Day3-Rest_api/todo_list.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ListProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true

        ).copyWith(textTheme: poppins),
        home: EventListPage(),
      ),
    );
  }
}
