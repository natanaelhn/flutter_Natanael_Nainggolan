import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/model/data.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 5,
            color: Colors.black54
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        )
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.draw, size: 37,),
              const SizedBox(width: 8,),
              Text(
                Data.beautifulDesignText, 
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
              )
            ],
          ),
          const SizedBox(height: 8,),
          Text(Data.beautifulDetailText),
        ],
      ),
    );
  }
}