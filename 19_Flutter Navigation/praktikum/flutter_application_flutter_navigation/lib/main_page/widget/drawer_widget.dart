import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/common_widgets/contact_bottom_sheet_widget.dart';
import 'package:flutter_application_form_input_button/common_widgets/post_list_item_widget.dart';
import 'package:flutter_application_form_input_button/contacts_page/contacts_page.dart';
import 'package:flutter_application_form_input_button/model/data.dart';

class DrawerWidget extends StatefulWidget {
  final IPostListItem? iPostListItem;

  const DrawerWidget({super.key, required this.iPostListItem});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 170,
      child: ListView(
        children: [
          Container(
            width: 170,
            height: 170,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/photoProfile/${Data.personalInfo.profilePic}")),
            ),
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.edit, color: Colors.white,),
            ),
          ),

          const SizedBox(height: 7,),
          Material(
            color: Data.personalInfo.theme.color,
            child: InkWell(
              onTap: (() async {
                final bool? tempBool = await showContactBottomSheetWidget(context: context, contact: Data.personalInfo,);
                (tempBool != null && tempBool == true && widget.iPostListItem != null) ? 
                  widget.iPostListItem?.refreshPostList() : null;
              }),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      Data.personalInfo.name, 
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                    )
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      Data.personalInfo.number, 
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                    )
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),

          const Divider(),
          InkWell(
            onTap: () async{
              // await Navigator.push(context, MaterialPageRoute(
              //   builder: ((context) => ContactsPage(title: Data.contactsPageTitle))
              // ));

              Navigator.of(context).pushNamed('/contactsPage');
              setState(() {
                
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(margin: const EdgeInsets.only(right: 10),child: const Icon(Icons.people_alt,)),
                  Expanded(child: Text(Data.contactsPageTitle)),
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}