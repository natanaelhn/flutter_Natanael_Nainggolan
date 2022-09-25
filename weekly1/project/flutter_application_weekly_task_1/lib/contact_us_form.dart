import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextField(
              controller: usernameTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Username'),
                prefixIcon: Icon(Icons.account_circle),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16,),
            TextField(
              controller: emailTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
                prefixIcon: Icon(Icons.email,),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16,),
            TextField(
              controller: messageTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Message'),
                prefixIcon: Icon(Icons.message,)
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                          onPressed: () => Navigator.pop(context),
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
        )
      )
    );
  }
}