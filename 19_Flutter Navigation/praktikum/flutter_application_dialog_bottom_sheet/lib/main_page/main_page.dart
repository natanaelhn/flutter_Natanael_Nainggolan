import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/add_post_page.dart';
import 'package:flutter_application_form_input_button/main_page/widget/drawer_widget.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';
import 'package:flutter_application_form_input_button/model/data.dart';
import 'package:flutter_application_form_input_button/model/posts.dart';
import 'package:flutter_application_form_input_button/common_widgets/favorite_contact_widget.dart';
import 'package:flutter_application_form_input_button/main_page/initial_size.dart';
import 'package:flutter_application_form_input_button/common_widgets/post_list_item_widget.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> implements IPostListItem{

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
  void dispose() {
    postListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(widget.title, style: const TextStyle(fontSize: 17),),
        backgroundColor: Data.personalInfo.theme.color,
        actions: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                favoriteShowed = !favoriteShowed;
              });
            },
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              // overlayColor: const MaterialStatePropertyAll<Color>(Color.fromARGB(10, 0, 0, 0)),
              backgroundColor: MaterialStatePropertyAll<Color>(Data.personalInfo.theme.color),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                (favoriteShowed)? Container(
                  alignment: Alignment.topLeft,
                  height: 115,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(Contacts contact in Data.contactsData)
                        if(contact.favorite)
                          Material(
                            color: Data.personalInfo.theme.color.withAlpha(200),//const Color.fromARGB(255, 235, 247, 255),
                            child: InkWell(
                              splashColor: Colors.amber,
                              child: SizedBox(
                                height: double.infinity,
                                child: FavoriteContactWidget(contact: contact, )
                              ),
                            ),
                          ),
                    ],
                  ),
                ) : const SizedBox(),

                //ListView
                Expanded(
                  //For list scroll notification
                  child: NotificationListener(
                    onNotification: (t){
                      if (t is ScrollNotification){
                        final bool tempIsResuffleIcon = (postListController.offset <= 0) ? true : false;
                        if(tempIsResuffleIcon != isReshuffleIcon){
                          setState(() {
                            isReshuffleIcon = tempIsResuffleIcon;
                          });
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      controller: postListController,
                      itemCount: listPost.length,
                      itemBuilder: ((context, index) {
                        return PostListItemWidget(post: listPost[index], iPostListItem: this, state: this,);
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
                Posts? tempPost = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AddPostPage()
                ));
                if(tempPost != null){
                  setState(() {
                    listPost.insert(0, tempPost);
                  });
                }
                
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

      endDrawer: DrawerWidget(iPostListItem: this,)
    );
  }

  List<Posts> findAllPosts(){
    List<Posts> listPost = [];
    for(Contacts i in Data.contactsData){
      for(Posts j in i.listPost){
        listPost.add(j);
      }
    }
    for(Posts i in Data.personalInfo.listPost){
      listPost.add(i);
    }
    return listPost;
  }

  @override
  refreshPostList({Posts? post}){
    setState(() {
      if (post != null) {
        listPost.remove(post) ;
      }
      else{
        listPost = findAllPosts();
        listPost.shuffle();
      }
    });
    postListController.jumpTo(0);
  }
}