import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_state_management_provider/add_contact_page.dart';
import 'package:flutter_application_flutter_state_management_provider/common_tool/initial_size.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_app_bar.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_fab.dart';
import 'package:flutter_application_flutter_state_management_provider/contact_provider.dart';
import 'package:flutter_application_flutter_state_management_provider/my_list_view_contact.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List<Map<String,String>> contactsList = [
  //   { 
  //     'name' : 'Anton',
  //     'number': '012345678901',
  //   },
  //   { 
  //     'name' : 'Budi',
  //     'number': '012345678902',
  //   },
  // ];

  @override
  void initState() {
    InitialSize(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final contactProvider = Provider.of<ContactProvider>(context,listen: false);

    return Scaffold(
      appBar: myAppBar(
        title: const Text('Contacts'),
        
      ),
      body: Align(
        alignment: Alignment.topLeft, 
        child: Consumer<ContactProvider>(
          builder: ((context, value, child) {
            return MyListViewContact(
              contactList: contactProvider.contactList, 
            );
          }),
        ),
      ),
      floatingActionButton: MyFAB(
        onTap: () async{
          final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddContactPage(),)
          );
          if(result is Map<String,String>){
            contactProvider.add(result);
            // setState(() {});
          }
        },
        icon: const Icon(Icons.add, size: 25, color: Colors.white,),
      ),
    );
  }
}

