import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/data.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({super.key});

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/DT34 logo.jpg'))
            ),
          ),
          const SizedBox(width: 32,),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Data.welcomeText, style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.1
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    Data.welcomeSubtext,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      height: 1.1
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}