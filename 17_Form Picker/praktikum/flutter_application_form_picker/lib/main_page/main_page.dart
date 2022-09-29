import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/add_post_page.dart';
import 'package:flutter_application_form_input_button/contacts_page.dart';
import 'package:flutter_application_form_input_button/data/contacts.dart';
import 'package:flutter_application_form_input_button/data/data.dart';
import 'package:flutter_application_form_input_button/data/posts.dart';
import 'package:flutter_application_form_input_button/favorite_contact_widget.dart';
import 'package:flutter_application_form_input_button/main_page/initial_size.dart';
import 'package:flutter_application_form_input_button/post_list_item_widget.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Posts> listPost= [];
  late bool isReshuffleIcon;
  late bool favoriteShowed;
  ScrollController postListController = ScrollController();

  @override
  void initState() {

    //Setting initial window size for windows, linux, macos
    if(!kIsWeb){
      InitialSize(this);
    }
    
    listPost = findAllPosts();
    listPost.shuffle();
    Data.contactsData.shuffle();
    isReshuffleIcon = true;
    favoriteShowed = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(widget.title, style: const TextStyle(fontSize: 17),),
        actions: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                favoriteShowed = !favoriteShowed;
              });
            },
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              overlayColor: MaterialStatePropertyAll<Color>(Color.fromARGB(10, 0, 0, 0))
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite, size: 17,),
                Icon(favoriteShowed ? Icons.arrow_drop_down : Icons.arrow_drop_up, size: 17)
              ],
            ),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                if(postListController.offset < 100){
                  listPost.shuffle();
                  Data.contactsData.shuffle();
                }
                postListController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.linear);
              });
            }, 
            icon: Icon((isReshuffleIcon) ? Icons.refresh : Icons.arrow_upward, size: 17,)

          ),
          Builder(
            builder: (BuildContext context){
              return IconButton(
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                }, 
                icon: const Icon(Icons.more_vert, size: 17,),
              );
            },
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                (favoriteShowed)? Container(
                  alignment: Alignment.topLeft,
                  height: 115,
                  color: const Color.fromARGB(255, 235, 247, 255),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(Contacts contact in Data.contactsData)
                        if(contact.favorite)
                          SizedBox(
                            height: double.infinity,
                            child: FavoriteContactWidget(contact: contact,)
                          ),
                    ],
                  ),
                ) : const SizedBox(),

                Expanded(
                  //For list scroll notification
                  child: NotificationListener(
                    onNotification: (t){
                      if (t is ScrollNotification){
                        setState(() {
                          if(postListController.offset < 100){
                            isReshuffleIcon = true;
                          }
                          else{
                            isReshuffleIcon = false;
                          }
                        });
                      }
                      return true;
                    },
                    child: ListView.builder(
                      controller: postListController,
                      itemCount: listPost.length,
                      itemBuilder: ((context, index) {
                        return PostListItemWidget(post: listPost[index], state: this,);
                      })
                    ),
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            right: 20,
            bottom: 20,
            child: ElevatedButton(
              onPressed: () async{
                Posts tempPost = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AddPostPage()
                ));
                setState(() {
                  listPost.insert(0, tempPost);
                });
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
                fixedSize: MaterialStatePropertyAll(Size(56, 56)),
                shape: MaterialStatePropertyAll(CircleBorder())
              ),
              child: const Icon(Icons.add),
              
            )
          )
        ],
      ),

      endDrawer: Drawer(
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Text(
                Data.personalInfo.name, 
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Text(
                Data.personalInfo.number, 
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey),
              )
            ),
            const SizedBox(height: 10,),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: ((context) => ContactsPage(title: Data.contactsPageTitle))
                ));
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
      ),
    );
  }

  List<Posts> findAllPosts(){
    List<Posts> listPost = [];
    for(Contacts i in Data.contactsData){
      for(Posts j in i.listPost){
        listPost.add(j);
      }
    }
    return listPost;
  }
}