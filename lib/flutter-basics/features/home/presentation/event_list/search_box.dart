import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0x0F000000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                // textAlignVertical: TextAlignVertical.center,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                    hintText: "Search by event",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.black26),
                    prefixIconConstraints:
                        BoxConstraints.tight(Size.fromRadius(18))),
              ),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.send))
      ],
    );
  }
}
