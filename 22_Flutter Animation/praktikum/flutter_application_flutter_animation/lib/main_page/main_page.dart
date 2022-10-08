import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/api_response/api_response.dart';
import 'package:flutter_application_flutter_animation/common_widget/image_grid_view.dart';
import 'package:flutter_application_flutter_animation/common_widget/my_app_bar.dart';
import 'package:flutter_application_flutter_animation/common_widget/tag_chips.dart';
import 'package:flutter_application_flutter_animation/const.dart';
import 'package:flutter_application_flutter_animation/main_page/main_page_caller.dart';
import 'package:flutter_application_flutter_animation/testing_state_management/called.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  MainPageCaller mainPageCaller = MainPageCaller();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) { 
      if(mainPageCaller.imgGridViewCalledState != null && mainPageCaller.futureImageObject != null){
        mainPageCaller.imgGridViewCalledState!.setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: myAppBar(
        title: const Image(image: AssetImage('assets/waifu_pics_logo_2.png'), width: 120,),
        actions: [
          
          
          TextButton(
            onPressed: (){
              (mainPageCaller.selectedTag != null)? 
                mainPageCaller.futureImageObject = APIResponse.fetchImages(tag: mainPageCaller.selectedTag!) : null;
              (mainPageCaller.imgGridViewCalledState != null) ? 
                mainPageCaller.imgGridViewCalledState!.setState(() {}) : null;
            }, 
            child: Icon(Icons.refresh_rounded, color: Const.textColorPrimary,)
          ),

          //TAG BUTTON CALLED WIDGET
          Called(
            caller: mainPageCaller,
            returnThisState: ((state) {
              mainPageCaller.tagButtonCalledState = state;
            }),
            builder: ()=> TextButton(
              onPressed: (){
                mainPageCaller.dropedDown = !mainPageCaller.dropedDown;
                mainPageCaller.tagButtonCalledState.setState(() {});
                mainPageCaller.chipsListCalledState.setState(() {});
              }, 
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Const.textColorPrimary)
              ),
              child: Row(
                children: [
                  const Icon(Icons.tag),
                  Icon(
                    (mainPageCaller.dropedDown) ? 
                      Icons.arrow_drop_down_rounded : Icons.arrow_drop_up_rounded
                  )
                ],
              )
            ),
          ),

          PopupMenuButton(
            color: Const.widgetColorSecondary,
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                enabled: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 8), 
                      child: Text('NSFW', style: TextStyle(color: Const.textColorPrimary),)
                    ),

                    //CHECKBOX CALLED WIDGET
                    Called(
                      caller: mainPageCaller,
                      returnThisState: (state) => mainPageCaller.checkboxCalledState = state,
                      builder: ()=> Checkbox(
                        value: mainPageCaller.isNSFW, 
                        fillColor: MaterialStatePropertyAll(Const.btnColorPrimary),
                        onChanged: (value) {
                          if(value == true){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const NSFWPage(),));
                            showDialog(context: context, builder: (context) => AlertDialog(
                              backgroundColor: Const.widgetColorPrimary,
                    
                              title: Row(
                                children: [
                                  Text('NSFW', style: TextStyle(color: Const.textColorPrimary),),
                                  Icon(Icons.warning_rounded, color: Const.dangerPrimary,)
                                ],
                              ),
                              content: Text(
                                'By clicking Continue, you are aware of inappropriate content that will appear.\nPrivacy advised.',
                                style: TextStyle(color: Const.textColorPrimary),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: (){Navigator.pop(context);}, 
                                  child: Text('Cancel', style: TextStyle(color: Const.textColorPrimary),)
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(Const.dangerPrimary),
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                    changeImageType(enabled: false);
                                    
                                  }, 
                                  child: Text('Continue', style: TextStyle(color: Const.textColorPrimary),)
                                ),
                              ],
                            ),);
                          }
                          else{
                            changeImageType(enabled: true);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]
          )

        ],
      ),
      backgroundColor: Const.pageColorPrimary,
      body: SafeArea(
        child: Column(

          children: [


            //CHIPS LIST CALLED WIDGET
            Called(
              caller: mainPageCaller,
              returnThisState: (state) => mainPageCaller.chipsListCalledState = state,
              builder: ()=> (mainPageCaller.dropedDown) ? Container(
                height: 45,
                width: double.infinity,
                color: Const.widgetColorPrimary,
                child: tagChips(
                  future: mainPageCaller.futureTagObject,
                  errorBuilder: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      LinearProgressIndicator()
                    ]
                  ),
                  builder: (tagObject) {

                  (mainPageCaller.futureImageObject == null) ?
                    mainPageCaller.futureImageObject = APIResponse.fetchImages(
                      tag: (!mainPageCaller.isNSFW) ? tagObject!.sfw[mainPageCaller.index] : tagObject!.nsfw[mainPageCaller.index],
                      type: (!mainPageCaller.isNSFW) ? 'sfw' : 'nsfw'
                    ): null;
                  

                  mainPageCaller.selectedTag = 
                    (!mainPageCaller.isNSFW) ? tagObject!.sfw[mainPageCaller.index] : tagObject!.nsfw[mainPageCaller.index];
                  
                  int length = (!mainPageCaller.isNSFW) ? tagObject.sfw.length : tagObject.nsfw.length;

                    return ListView(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        for(int index = 0; index < length; index++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: InputChip(
                              onPressed: (){
                                
                                mainPageCaller.index = index;
                                mainPageCaller.selectedTag = (!mainPageCaller.isNSFW)? tagObject.sfw[index] : tagObject.nsfw[index];
                                mainPageCaller.chipsListCalledState.setState(() {});
                                mainPageCaller.futureImageObject = APIResponse.fetchImages(
                                  tag: (!mainPageCaller.isNSFW)? tagObject.sfw[index] : tagObject.nsfw[index],
                                  type: (!mainPageCaller.isNSFW)? 'sfw' : 'nsfw',
                                );
                                mainPageCaller.imgGridViewCalledState!.setState(() {});

                              },
                              backgroundColor: (index == mainPageCaller.index)? 
                                Const.btnColorPrimary : Const.btnColorSecondary,
                              label: Text(
                                (!mainPageCaller.isNSFW) ? tagObject.sfw[index] : tagObject.nsfw[index], 
                                style: TextStyle(fontSize: 12, color: Const.textColorPrimary),
                              )
                            ),
                          )
                      ],
                    );
                      //CHIPS LIST ITEM CALLED WIDGET
                
                  }
                ),
              ) : null,
            ),


            //IMAGE GRID VIEW CALLED WIDGET
            Flexible(
              child: Called(
                caller: mainPageCaller,
                returnThisState: (state) {
                  mainPageCaller.imgGridViewCalledState = state;
                },
                builder: ()=> (mainPageCaller.futureImageObject != null)? ImageGridView(
                  width: MediaQuery.of(context).size.width,
                  future: mainPageCaller.futureImageObject,
                  errorBuilder: Container(
                    margin: const EdgeInsets.all(8),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CircularProgressIndicator(color: Const.btnColorSecondary,)
                    ),
                  ),
                  builder: (imageObject, count,) {
                    

                    int remainder = imageObject!.files.length % count;
              
                    return SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(int index = 0; index < count; index++)
                            Expanded(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                // itemCount: imageObject.files.length,
                                itemCount: (imageObject.files.length / count).floor() + ((index + 1 <= remainder)? 1 : 0),
                                itemBuilder: (context, indexList){
                                  return Image(
                                    image: NetworkImage(imageObject.files[(indexList * count) + index]), 
                                    fit: BoxFit.contain,
                                    loadingBuilder: (context, child, loadingProgress){
                                      return (loadingProgress == null)? child : 
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown, 
                                            child: CircularProgressIndicator(
                                              color: Const.btnColorSecondary,
                                            )
                                          ),
                                        );
                                    },
                                  );
                                }
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ) : null,
              ),
            )
          ],
        )
      ),

    );
  }

  //enabled parameter for safety reason
  changeImageType({required bool enabled}){

    if(enabled){
      mainPageCaller.isNSFW = !mainPageCaller.isNSFW;
      mainPageCaller.futureImageObject = null;

      timer = Timer.periodic(const Duration(seconds: 1), (timer) { 
        if(mainPageCaller.imgGridViewCalledState != null && mainPageCaller.futureImageObject != null){
          mainPageCaller.imgGridViewCalledState!.setState(() {});
          timer.cancel();
        }
      });

      mainPageCaller.chipsListCalledState.setState(() {});
      mainPageCaller.checkboxCalledState!.setState(() {});
    }

    else{
      showDialog(context: context, builder: (context) => AlertDialog(
        backgroundColor: Const.widgetColorPrimary,
        title: Row(
          children: [
            Text('NSFW type locked', style: TextStyle(color:  Const.textColorPrimary),),
            Icon(Icons.lock, color: Const.successPrimary,)
          ],
        ),
        content: const Text('NSFW type is locked for safety reason.\nFor unlocking it, you need to change \'changeImageType(enabled: false)\' into enabled: true'),
        contentTextStyle: TextStyle(color: Const.textColorPrimary),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Const.successPrimary)
            ),
            onPressed: ()=> Navigator.pop(context), 
            child: Text('Ok', style: TextStyle(color: Const.textColorPrimary),)
          )
        ])
      );
    }
  }
}