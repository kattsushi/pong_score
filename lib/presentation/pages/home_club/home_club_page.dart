import 'package:flutter/material.dart';

class HomeClub extends StatelessWidget {
  const HomeClub({
    Key key,
    // @required this.translate,
  }) : super(key: key);

  // final String Function(String key) translate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(6, (index) {
        return Card(
          color: Color(0xFF3366FE),
          elevation: 16,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
