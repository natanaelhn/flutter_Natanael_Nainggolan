import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';

class FavoriteWidget extends StatefulWidget {
  final State? state;
  final Contacts tempContact;

  const FavoriteWidget({super.key, required this.tempContact, this.state,});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  void onPressed(){
    if(widget.state != null){
      
      widget.state?.setState(() {
        widget.tempContact.favorite = !widget.tempContact.favorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      icon: (widget.tempContact.favorite == false) ? const Icon(Icons.favorite_border_outlined) : const Icon(Icons.favorite),
      color: (widget.tempContact.favorite == false) ? null : Colors.red
    );
  }
}

// Widget favoriteWidget(Contacts tempContact, State state) {

//   void onPressed(){
//     state.setState(() {
//       tempContact.favorite = !tempContact.favorite;
//     });
//   }

//   if (tempContact.favorite == false){
//     return IconButton(onPressed: onPressed, icon: const Icon(Icons.favorite_border_outlined));
//   }
//   else {
//     return IconButton(onPressed: onPressed, icon: const Icon(Icons.favorite), color: Colors.red,);
//   }
// }