import 'package:flutter/material.dart';
import 'package:flutter_application_unit_testing/model/food_object.dart';

class TableOfFood extends StatelessWidget {
  const TableOfFood({
    Key? key,
    required this.listFood,
  }) : super(key: key);

  final List<FoodObject> listFood;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        for(FoodObject i in listFood)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('id = ${i.id}'),
              Text('name = ${i.name}'),
              const SizedBox(height: 10,),
            ],
          )
      ],
    );
  }
}