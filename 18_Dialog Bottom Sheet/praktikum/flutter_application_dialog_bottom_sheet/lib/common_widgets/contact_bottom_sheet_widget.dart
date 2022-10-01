

import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/common_widgets/profile_picture_widget.dart';
import 'package:flutter_application_form_input_button/contact_detail_page.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';
import 'package:flutter_application_form_input_button/model/data.dart';

class ContactBottomSheetWidget extends StatefulWidget{
  final Contacts contact;
  final bool roundedCorner;
  final Widget? navigatorOnTap;
  final Function()? onTap;
  final bool disposeOnTap;
  final double backgroundImageHeight;
  final Widget? child;

  const ContactBottomSheetWidget({
    super.key, 
    required this.contact, 
    this.roundedCorner = true, 
    this.navigatorOnTap, 
    this.onTap,
    this.disposeOnTap = false,
    this.backgroundImageHeight = 150,
    this.child,
    
  });

  @override
  State<ContactBottomSheetWidget> createState() => _ContactBottomSheetWidgetState();

}

class _ContactBottomSheetWidgetState extends State<ContactBottomSheetWidget> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(50))
      // ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: widget.backgroundImageHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular((widget.roundedCorner) ? 25 : 0)),
                  image: DecorationImage(
                    image: AssetImage('assets/wallpaper/${widget.contact.theme.fileName}'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              const SizedBox(height: 50,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 16, color: widget.contact.theme.color.withAlpha(200))
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ', ),
                        const SizedBox(height: 10),
                        (widget.child != null) ? widget.child! : const SizedBox(),
                      ],
                    )
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              children: [
                SizedBox(height: widget.backgroundImageHeight - 50,),
                Material(
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(50)),
                  color: widget.contact.theme.color,
                  child: InkWell(
                    onTap: () {
                      
                      (widget.navigatorOnTap != null) ? 
                        Navigator.push(context, MaterialPageRoute(builder: (context) => widget.navigatorOnTap!,)) : null;
                      (widget.onTap != null) ? widget.onTap : null;
                      (widget.disposeOnTap) ? Navigator.pop(context, true) : null;
                    },
                    splashColor: Data.personalInfo.theme.color,
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(50)),
                    child: Row(
                      children: [
                        ProfilePictureWidget(tempContact: widget.contact, containerSize: 100),
                        const SizedBox(width: 20,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Text(
                                      widget.contact.name, 
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.female, color: Colors.pinkAccent,),
                                ],
                              ),
                              const SizedBox(height: 7,),
                              Text(widget.contact.status, style: const TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: (widget.navigatorOnTap != null || widget.onTap != null) ? 
                            const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white, size: 30,) : null
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

dynamic showContactBottomSheetWidget({required context, required contact,}) async {
  final bool? tapped = await showModalBottomSheet(
    
    context: context, 
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context){
      return ContactBottomSheetWidget(contact: contact, onTap: (){}, disposeOnTap: true,);
    }
  );

  if(tapped != null && tapped) {
    return await Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return ContactDetailPage(contacts: contact);
    })));
  }

  // result = await Navigator.push(context, MaterialPageRoute(builder: ((context) {
  //   return ContactDetailPage(contacts: widget.contact);
  // })));
}