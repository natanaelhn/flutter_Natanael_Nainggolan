import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/screen/data_user_page/data_user_page_provider.dart';
import 'package:provider/provider.dart';

class DataUserPage extends StatefulWidget {
  const DataUserPage({super.key});

  @override
  State<DataUserPage> createState() => _DataUserPageState();
}

class _DataUserPageState extends State<DataUserPage> {

  @override
  Widget build(BuildContext context) {

    DataUserPageProvider dataUserPageProvider = Provider.of<DataUserPageProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data User Page'),
      ),
      body: ListView.builder(
        itemCount: dataUserPageProvider.listOfUserObject.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username : ${dataUserPageProvider.listOfUserObject[index].username}'),
              Text('Email : ${dataUserPageProvider.listOfUserObject[index].email}'),
              const Text('Message :'),
              Text(dataUserPageProvider.listOfUserObject[index].message),
              const SizedBox(height: 16,),
              const Divider(),
            ],
          ),
        )
      ),
    );
  }
}