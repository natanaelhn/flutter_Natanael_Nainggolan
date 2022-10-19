import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/model/user_data.dart';
import 'package:flutter_application_weekly_task_1/screen/data_user_page/data_user_page_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/contact_us_form/contact_us_form_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/end_drawer.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/my_home_page.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/my_home_page_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/new_page/new_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Finding Welcome to my app text', (widgetTester) async{

    UserData userData = UserData();
    
    await widgetTester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyHomePageProvider(userData: userData),),
          ChangeNotifierProvider(create: (context) => DataUserPageProvider(userData: userData),),
          ChangeNotifierProvider(create: (context) => ContactUsFormProvider()),
        ],
        child: const MaterialApp(
          home: MyHomePage(title: 'Weekly Task 3'),
        ),
      )
    ); 

    //Make sure there are certain widgets in MyHomePage
    expect(find.text('Weekly Task 3'), findsOneWidget);
    expect(find.text('Welcome to my app'), findsOneWidget);
    expect(find.byType(TextField), findsWidgets);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byIcon(Icons.more_vert), findsOneWidget);

    //Go to EndDrawer by tap a widget
    await widgetTester.tap(find.byIcon(Icons.more_vert));
    await widgetTester.pumpAndSettle();

    //Make sure the EndDrawer showed and go to NewPage by tap a widget
    //NewPage = for Task #2
    expect(find.byType(EndDrawer), findsOneWidget);
    await widgetTester.tap(find.text('New Page'));
    await widgetTester.pumpAndSettle();

    //Make sure there are certain widgets in NewPage
    expect(find.byType(NewPage), findsOneWidget);
    expect(find.text('This is new page'), findsOneWidget);



  },);
}