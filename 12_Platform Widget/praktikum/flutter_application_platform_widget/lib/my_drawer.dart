import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(

              //https://stackoverflow.com/questions/56620719/flutter-drawer-background-image
              //https://www.javatpoint.com/flutter-images
              image: DecorationImage(
                image: AssetImage("assets/grey_forest.jpg"),
                fit: BoxFit.cover
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[

                //https://stackoverflow.com/questions/51513429/how-to-do-rounded-corners-image-in-flutter
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/profile_picture.jpg"),
                ),

                //https://www.geeksforgeeks.org/how-to-add-images-in-flutter-app/
                // Image.asset(
                //   'assets/profile_picture.jpg',
                //   scale: 3,
                  
                // ),

                //https://stackoverflow.com/questions/52774921/space-between-columns-children-in-flutter
                SizedBox(height: 10),
                Text(
                  'Dan Ashford',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  '+1 (042) 911 05',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.group),
            title: Text("New Group"),
          ),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text("New Secret Chat"),
          ),
          const ListTile(
            leading: Icon(Icons.campaign),
            title: Text("New Channel"),
          ),

          //https://stackoverflow.com/questions/59327190/how-to-add-divider-subtitle-in-drawer-in-flutter
          Divider(),
          const ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Contacts"),
          ),
          const ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Invite Friends"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text("Telegram FAQ"),
          ),
        ],
      )
    );
  }
}