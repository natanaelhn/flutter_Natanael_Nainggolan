import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_app_bar.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_fab.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_text_form_field.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: const Text('Add Contact')),
      body: Form(
        key: keyForm,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            MyTextFormField(
              controller: nameController,
              hintText: 'Input the name',
              labelText: 'Name',
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Name can\'t be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            MyTextFormField(
              controller: numberController,
              hintText: 'Input the number',
              labelText: 'Number',
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Number can\'t be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
      floatingActionButton: MyFAB(
        onTap: () {
          if(!keyForm.currentState!.validate()){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Some of the input is empty')),
            );
          }
          else{
            Map<String, String> result = {
              'name' : nameController.text,
              'number' : numberController.text,
            };
            Navigator.pop(context, result);
          }
        },
        icon: const Icon(Icons.done, color: Colors.white,),
      ),
    );
  }
}