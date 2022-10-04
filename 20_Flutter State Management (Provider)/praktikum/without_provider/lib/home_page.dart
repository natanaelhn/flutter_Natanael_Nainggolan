import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_state_management_provider/add_contact_page.dart';
import 'package:flutter_application_flutter_state_management_provider/common_tool/initial_size.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_app_bar.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String,String>> contactsList = [
    { 
      'name' : 'Anton',
      'number': '012345678901',
    },
    { 
      'name' : 'Budi',
      'number': '012345678902',
    },
  ];

  @override
  void initState() {
    InitialSize(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: myAppBar(
        title: const Text('Contacts'),
        
      ),
      body: Align(
        alignment: Alignment.topLeft, 
        child: (contactsList.isEmpty)? Container(
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
          itemCount: contactsList.length,
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
                                Text(contactsList[index]['name']!, style: const TextStyle(color: Colors.white),),
                                Text(contactsList[index]['number']!, style: const TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
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
        ),
      ),
      floatingActionButton: MyFAB(
        onTap: () async{
          final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddContactPage(),)
          );
          if(result is Map<String,String>){
            contactsList.add(result);
            contactsList.sort(((a, b) => a['name']!.toUpperCase().compareTo(b['name']!.toUpperCase())));
            setState(() {});
          }
        },
        icon: const Icon(Icons.add, size: 25, color: Colors.white,),
      ),
    );
  }
}

