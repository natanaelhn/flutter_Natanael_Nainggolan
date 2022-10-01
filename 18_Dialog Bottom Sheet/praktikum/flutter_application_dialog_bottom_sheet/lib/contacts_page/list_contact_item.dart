import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_form_input_button/common_widgets/contact_bottom_sheet_widget.dart';
import 'package:flutter_application_form_input_button/common_widgets/favorite_widget.dart';
import 'package:flutter_application_form_input_button/common_widgets/profile_picture_widget.dart';
import 'package:flutter_application_form_input_button/contacts_page/i_contacts_page.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';

class ListContactItem extends StatefulWidget {
  final Contacts tempContact;
  final IContactsPage iContactsPage;

  const ListContactItem({super.key, required this.tempContact, required this.iContactsPage});

  @override
  State<ListContactItem> createState() => _ListContactItemState();
}

class _ListContactItemState extends State<ListContactItem> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return listContactItem(widget.tempContact,widget.iContactsPage);
  }

  Widget listContactItem(Contacts tempContact, IContactsPage iContactsPage) {

    return InkWell(
      splashColor: Colors.yellow,
      onLongPress: () {
        setState(() {
          tempContact.showedUp = true;
          Future.delayed(const Duration(milliseconds: 2200), () {
            tempContact.showedUp = false;
            if(iContactsPage.isDispose == false && (mounted)){
              setState(() {
                
              });
            }
          });
        });
      },
      onTap: () async {
        // dynamic isFavorite = await Navigator.push(context, MaterialPageRoute(
        //   builder: ((context) => ContactDetailPage(contacts: tempContact,))
        // ));

        // if(isFavorite is bool){
        //   setState(() {
        //     tempContact.favorite = isFavorite;
        //   });
        // }
        await showContactBottomSheetWidget(context: context, contact: tempContact,);
        setState(() { });
        
      },
      child: Container(
        decoration: tempContact.showedUp && tempContact.profilePic.isNotEmpty ? BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photoProfile/${tempContact.profilePic}', ),
            fit: BoxFit.cover,
            opacity: 0.5,

          )
        ) : null,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfilePictureWidget(tempContact: tempContact, containerSize: 75,),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tempContact.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
                Text(
                  tempContact.number,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: FavoriteWidget(tempContact: tempContact, state: this)
              )
            ),
          ],
        )
      )
    );
  }
}