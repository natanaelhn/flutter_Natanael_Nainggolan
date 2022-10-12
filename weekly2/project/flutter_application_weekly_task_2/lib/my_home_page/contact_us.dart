import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/data.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      alignment: Alignment.topLeft,
      color: Colors.amberAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Data.contactUsText,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 6,),
          Text(
            Data.contactUsSubtext,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              
            ),
          ),
        ],
      ),
    );
  }
}