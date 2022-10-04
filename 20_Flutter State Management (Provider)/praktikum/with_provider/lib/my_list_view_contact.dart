import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_state_management_provider/contact_provider.dart';
import 'package:provider/provider.dart';

class MyListViewContact extends StatelessWidget {
  const MyListViewContact({super.key, required this.contactList,});

  final List<Map<String,String>> contactList;

  @override
  Widget build(BuildContext context) {

    final contactProvider = Provider.of<ContactProvider>(context,listen: false);

    return (contactList.isEmpty)? Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.help, size: 17,),
            SizedBox(width: 7,),
            Text('Contact list is empty'),
          ],
        ),
      ),

    ) : ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: contactList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 5),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.amber,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 49, 49, 49),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_circle, color: Colors.white, size: 40,),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contactList[index]['name']!, style: const TextStyle(color: Colors.white),),
                            Text(contactList[index]['number']!, style: const TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        contactProvider.remove(index);
                      },
                      icon: const Icon(Icons.delete, 
                      color: Colors.white,)
                    )
                  ],
                ),
                // const SizedBox(height: 11,),
                // Container(color: Colors.amber, height: 5,)
              ],
            ),
          ),
        );
      },
    );
  }
}