import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/model/user_object.dart';
import 'package:flutter_application_weekly_task_1/screen/data_user_page/data_user_page.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/contact_us_form/contact_us_form_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/my_home_page_provider.dart';
import 'package:provider/provider.dart';

class ContactUsForm extends StatefulWidget {
  const ContactUsForm({super.key});

  @override
  State<ContactUsForm> createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    MyHomePageProvider myHomePageProvider = Provider.of<MyHomePageProvider>(context, listen: false);
    ContactUsFormProvider contactUsFormProvider = Provider.of<ContactUsFormProvider>(context, listen: false);

    return Container(
      color: Colors.amberAccent,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
                color: Colors.black54
              )
            ],
          ),
          child: Column(
            children: [

              //USERNAME MESSAGE
              Consumer<ContactUsFormProvider>(
                builder: (context, value, child) => TextField(
                  controller: usernameTextController,
                  onChanged: (value) {
                    contactUsFormProvider.usernameIsChanged = true;
                    contactUsFormProvider.notifyListener();
                  },
                  decoration: InputDecoration(
                    errorText: contactUsFormProvider.fieldIsEmpty(
                      isChanged: contactUsFormProvider.usernameIsChanged, 
                      value: usernameTextController.text
                    ),
                    border: const OutlineInputBorder(),
                    label: const Text('Username'),
                    prefixIcon: const Icon(Icons.account_circle),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(height: 16,),

              //EMAIL TEXTFIELD
              Consumer<ContactUsFormProvider>(
                builder: (context, value, child) => TextField(
                  controller: emailTextController,
                  onChanged: (value) {
                      contactUsFormProvider.emailIsChanged = true;
                      contactUsFormProvider.notifyListener();
                    },
                  decoration: InputDecoration(
                    errorText: contactUsFormProvider.fieldIsEmpty(
                      isChanged: contactUsFormProvider.emailIsChanged, 
                      value: emailTextController.text
                    ),
                    border: const OutlineInputBorder(),
                    label: const Text('Email'),
                    prefixIcon: const Icon(Icons.email,),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 16,),

              //MESSAGE TEXTFIELD
              Consumer<ContactUsFormProvider>(
                builder: (context, value, child) => TextField(
                  controller: messageTextController,
                  onChanged: (value) {
                      contactUsFormProvider.messageIsChanged = true;
                      contactUsFormProvider.notifyListener();
                    },
                  decoration: InputDecoration(
                    errorText: contactUsFormProvider.fieldIsEmpty(
                      isChanged: contactUsFormProvider.messageIsChanged, 
                      value: messageTextController.text
                    ),
                    border: const OutlineInputBorder(),
                    label: const Text('Message'),
                    prefixIcon: const Icon(Icons.message,)
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  //SUBMIT BUTTON
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.amberAccent),
                      foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.all(16)),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        )
                      )
                    ),
                    onPressed: () => showDialog(
                      context: context, 
                      barrierDismissible: false,
                      builder: (BuildContext context) => AlertDialog(
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Username: ${usernameTextController.value.text}"),
                            const SizedBox(height: 10,),
                            Text("Email: ${emailTextController.value.text}"),
                            const SizedBox(height: 10,),
                            Text("Message: \n${messageTextController.value.text}"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              myHomePageProvider.addListUserObject(
                                UserObject(
                                  username: usernameTextController.text, 
                                  email: emailTextController.text, 
                                  message: messageTextController.text
                                )
                              );
                              Navigator.pop(context);
                            },
                            child: const Text('OK')
                          )
                        ],
                      )
                    ),
                    child: const Text('Submit')
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}