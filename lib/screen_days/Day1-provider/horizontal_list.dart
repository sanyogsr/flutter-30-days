// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days/screen_days/Day1-provider/list_provider.dart';

class Horizontal extends StatefulWidget {
  Horizontal({
    Key? key,
  }) : super(key: key);

  @override
  _HorizontalState createState() => _HorizontalState();
}

class _HorizontalState extends State<Horizontal> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
        builder: (context, nummberProviderModel, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  nummberProviderModel.add();
                },
                child: Icon(
                  Icons.add,
                  size: 22,
                ),
              ),
              appBar: AppBar(
                title: Text('Provider Practice'),
              ),
              body: Column(
                children: [
                  Text(
                    nummberProviderModel.numbers.last.toString(),
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        itemCount: nummberProviderModel.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(
                            nummberProviderModel.numbers[index].toString(),
                            style: TextStyle(fontSize: 22),
                          );
                        }),
                  ),
                ],
              ),
            ));
  }
}
