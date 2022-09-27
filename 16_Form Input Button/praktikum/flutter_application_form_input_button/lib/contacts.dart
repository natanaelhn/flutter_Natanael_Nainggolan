class Contacts{
  String name;
  String number;
  String profilePic;
  bool favorite;
  late bool showedUp;

  Contacts(this.name, {required this.number, this.profilePic = '', this.favorite = false}){
    showedUp = false;
  }
}