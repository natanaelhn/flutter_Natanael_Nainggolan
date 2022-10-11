// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_application_introduction_rest_api/api_response.dart';
import 'package:flutter_application_introduction_rest_api/list_users_object.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  String resultString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name'
              ),
              controller: nameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Job'
              ),
              controller: jobController,
            ),
            Row(
              children: [

                //GET
                Expanded(child: ElevatedButton(
                  onPressed: () async{
                    final ListUsersObject? listUsersObject = await APIResponse.fetchGetListUsers();
                    String temp = '${listUsersObject.toString()}\n' + 
                                  'page: ${listUsersObject!.page}\n' +
                                  'per_total: ${listUsersObject.perPage}\n' +
                                  'total: ${listUsersObject.total}\n' +
                                  'total_pages: ${listUsersObject.totalPages}\n';
                                  
                    for(Map i in listUsersObject.data){
                      temp += '$i\n';
                    }

                    resultString = temp;
                    setState(() {});
                  },
                  child: const Text('GET'),
                )),
                const SizedBox(width: 5,),


                //POST
                Expanded(child: ElevatedButton(
                  onPressed: () async{
                    resultString = await APIResponse.fetchPostCreate(
                      name: nameController.text, 
                      job: jobController.text
                    );
                    setState(() {});
                  },
                  child: const Text('POST'),
                )),
                const SizedBox(width: 5,),


                //PUT
                Expanded(child: ElevatedButton(
                  onPressed: () async{
                    resultString = await APIResponse.fetchPutCreate(
                      name: nameController.text, 
                      job: jobController.text
                    );
                    setState(() {});
                  },
                  child: const Text('PUT'),
                )),
                const SizedBox(width: 5,),


                //DELETE
                Expanded(child: ElevatedButton(
                  onPressed: () async{
                    resultString = await APIResponse.fetchDeleteCreate(
                      name: nameController.text, 
                      job: jobController.text
                    );
                    setState(() {});
                  },
                  child: const Text('DELETE'),
                )),
                const SizedBox(width: 5,),
              ],
            ),

            const SizedBox(height: 5,),
            const SizedBox(
              width: double.infinity,
              child: Text('Result:', textAlign: TextAlign.start, )
            ),
            const SizedBox(height: 5,),

            //RESULT STRING
            Text(resultString),
          ],
        ),
      ),
    );
  }
}