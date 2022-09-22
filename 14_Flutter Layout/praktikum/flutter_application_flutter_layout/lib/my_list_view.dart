import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({
    Key? key,
    required this.mapOfData
  }) : super(key: key);

   final Map<String, String> mapOfData;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        //ListItem(contactName: "Leanne Graham", contactNumber: "1-770-736-8031 x56442",),
        for(int i = 0; i < widget.mapOfData.length; i++)
          ListItem(
            contactName: widget.mapOfData.keys.elementAt(i), 
            contactNumber: widget.mapOfData.values.elementAt(i),
          )
      ],
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.contactName, required this.contactNumber});

  final String contactName;
  final String contactNumber;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 16),
            height: 50,
            width: 50,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green,),
            child: Text(firstChar(widget.contactName), style: const TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              //color: Colors.cyan,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.contactName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    widget.contactNumber, 
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal ),
                  ),
                ]
              ),
            ),
          )
        ],
      )
    );
  }

  String firstChar(String input){
    if(input.isNotEmpty) {
      return input[0];
    }
    return '';
  }
}