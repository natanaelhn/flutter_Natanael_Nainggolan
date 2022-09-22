import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_layout/data.dart';
import 'package:flutter_application_flutter_layout/my_grid_item.dart';
import 'package:flutter_application_flutter_layout/my_list_view.dart';

class Body1 extends StatelessWidget {
  const Body1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: MyListView(mapOfData: Data.data1)
    );
  }
}

class Body2 extends StatelessWidget {
  const Body2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          for(IconData i in Data.data2)
            MyGridItem(icons: i)
        ],
      )
    );
  }
}
