import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days/screen_days/Day1-provider/horizontal_list.dart';
import 'package:thirty_days/screen_days/Day1-provider/list_provider.dart';

class Vertical extends StatefulWidget {
  Vertical({Key? key}) : super(key: key);

  @override
  _VerticalState createState() => _VerticalState();
}

class _VerticalState extends State<Vertical> {
  List<int> numbers = [1, 2, 3, 4];
  void increase() {
    int last = numbers.last;
    setState(() {
      numbers.add(last + 1);
    });
  }

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
                  CupertinoButton(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                          width: 170,
                          height: 50,
                          color: Colors.blueAccent,
                          child: Center(child: Text('Horizontal List'))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Horizontal()));
                      })
                ],
              ),
            ));
  }
}
