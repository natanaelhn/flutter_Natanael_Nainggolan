import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/data/contacts.dart';
import 'package:flutter_application_form_input_button/data/data.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  late Contacts newContact;
  TextEditingController nameInputController = TextEditingController();
  TextEditingController numberInputController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isFavorite = false;
  bool nameFieldEdited = false;
  bool numberFieldEdited = false;

  @override
  void dispose() {
    nameInputController.dispose();
    numberInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context),),
        title: Text(Data.addContactPageTitle),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              overlayColor: MaterialStatePropertyAll(Color.fromARGB(10, 0, 0, 0))
            ),
            onPressed: (){
              newContact = Contacts(
                nameInputController.value.text, 
                number: numberInputController.value.text,
                favorite: isFavorite
              );

              if(nameInputController.value.text.isEmpty || numberInputController.value.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Name Field or Number Field can\'t be empty'))
                );
              }
              else{
                Navigator.pop(context, newContact);
              }
            }, 
            child: const Text('Submit'),
            
          ),
        ]
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 8),
          child: Column(
            children: [
              TextField(
                controller: nameInputController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle),
                  border: const OutlineInputBorder(),
                  labelText: 'Name',
                  labelStyle: const TextStyle(),
                  errorText: errorTextValidation(nameInputController.value.text, nameFieldEdited)
                ),
                onChanged: (text) => setState(() {nameFieldEdited = true;}),
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: numberInputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
                  border: const OutlineInputBorder(),
                  labelText: 'Number',
                  labelStyle: const TextStyle(),
                  errorText: errorTextValidation(numberInputController.value.text, numberFieldEdited)
                ),
                onChanged: (text) => setState(() {numberFieldEdited = true;}),
              ),
              const SizedBox(height: 16,),
              ListTile(
                leading: Checkbox(
                  value: isFavorite, 
                  onChanged: (value){
                    setState(() {
                      isFavorite = value ?? false;
                    });
                  },
                ),
                title: const Text('Favorite Contact'),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? errorTextValidation(String text, bool edited){
    if(text.isEmpty && edited){
      return 'This field can\'t be empty';
    }
    return null;
  }

}