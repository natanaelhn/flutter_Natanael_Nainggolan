import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/data/data.dart';
import 'package:flutter_application_form_input_button/data/posts.dart';
import 'package:flutter_application_form_input_button/post_list_item_widget.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final PageController pageViewController = PageController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int pageIndex = 0;
  Posts tempPost = Posts(ownerName: 'MC');
  DateTime dateNow = DateTime.now();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController captionTextController = TextEditingController();

  //for Dropdown Color
  final List<String> listTextColorString = ['Black', 'White'];
  final List<Color> listColor = [Colors.black, Colors.white];
  Color fgColor = Colors.black;

  //the name of picked image
  String fileName = '';

  Color colorPicked = Colors.white;
  DateTime? datePicked;

  @override
  void initState() {
    dateTextController.text = DateFormat('yyyy-MM-dd').format(dateNow);
    super.initState();
  }


  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //APP BAR
      appBar: AppBar(
        title: const Text('Add Post', style: TextStyle(fontSize: 17),),
        toolbarHeight: 40,
        leading: IconButton(icon: const Icon(Icons.arrow_back, size: 17,), onPressed: (() {
          Navigator.pop(context);
        }),),
        leadingWidth: 35,

        actions: [
          Container(
            //color: Colors.amber,
            width: 130,
            height: 5,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      pageViewController.animateToPage(
                        0, duration: const Duration(milliseconds: 500), curve: Curves.ease
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: (pageIndex == 0)? Colors.amber : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      child: const Icon(
                        Icons.edit_outlined, 
                        size: 17, 
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 16, ),
                  GestureDetector(
                    onTap: (){
                      pageViewController.animateToPage(
                        1, duration: const Duration(milliseconds: 500), curve: Curves.ease
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: (pageIndex == 1)? Colors.amber : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.remove_red_eye_outlined, 
                        size: 17, 
                        color:Colors.black
                      ),
                    )
                  ),
                  const SizedBox(width: 10,)
                ],
              ),
            ),
          )
        ],
      ),

      //BODY
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        controller: pageViewController,
        children: [

          //PAGE FORM
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                //color: Colors.amber,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cover Image: $fileName'),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () async{
                        File? temp = await pickFile();
                        if(temp != null){
                          tempPost.file = temp;
                          fileName = temp.path.split(
                            (Platform.isAndroid) ? '/' : '\\'
                          ).last;
          
                          setState(() {});
                          if(mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Succesfuly getting image'),
                                duration: Duration(milliseconds: 1500),
                              )
                            );
                          }
                        }
                        else{
                          if(mounted){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Getting image cancelled'), 
                                duration: Duration(milliseconds: 1500),
                              )
                            );
                          }
                        }
                      }, 
                      child: const Text('Pick Image')
                    ),
                    const SizedBox(height: 20,),
          
                    //TextFormField
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 14
                        ),
                        controller: dateTextController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Publish At',
                          labelStyle: const TextStyle(
                            fontSize: 14
                          ),
                          suffix: InkWell(
                            onTap: () async {
                              datePicked = await showDatePicker(
                                context: context, 
                                initialDate: dateNow,
                                firstDate: DateTime(1900), 
                                lastDate: DateTime(dateNow.year + 5)
                              );
                              setState(() {
                                if(datePicked != null){
                                  tempPost.dateTime = datePicked;
                                  final DateFormat formatter = DateFormat('yyyy-MMM-dd');
                                  dateTextController.text =  formatter.format(datePicked!);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              width: 30,
                              height: 28,
                              alignment: Alignment.center,
                              child: const Icon(Icons.edit_calendar, color: Colors.white, size: 14,) 
                            ),
                          ),
                          
                          hintStyle: const TextStyle(fontSize: 14),
                          contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10)
                        ),
          
                        onChanged: ((value) {
                          setState(() {  
                            tempPost.dateTime = datePicked;
                          });
                        }),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text('Post Color:'),
                    const SizedBox(height: 10,),
          
                    //ColorPicker
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorPicked,
                              border: Border.all(width: 0.5)
                            ),
                            child: Text('Example Color', style: TextStyle(color: fgColor),),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () async {
                            Color tempColor = Colors.transparent;
                            Color? colorPickedTemp = await showDialog<Color>(
                              context: context, 
                              builder: ((context) => AlertDialog(
                                title: const Text('Pick Color'),
                                content: ColorPicker(
                                  pickerColor: colorPicked, 
                                  onColorChanged: ((value) {
                                    tempColor = value;
                                  })
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel')
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, tempColor);
                                    },
                                    child: const Text('Pick')
                                  ),
                                
                                ],
                              ))
                            );
          
                            setState(() {
                              if(colorPickedTemp != null){
                                colorPicked = colorPickedTemp;
                                tempPost.bgColor = colorPicked;
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Color picking canceled'), 
                                    duration: Duration(milliseconds: 1500),
                                  )
                                );
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Icon(Icons.color_lens, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
          
                    const SizedBox(height: 20,),

                    //Text Color
                    const Text('Text Color'),
                    const SizedBox(height: 10,),
                    DropdownButton(
                      value: fgColor,
                      items: listOfDropdownItem(listTextColorString, listColor),
                      onChanged: ((value) {
                        setState(() {
                          fgColor = value;
                          tempPost.fgColor = value;
                        });
                      })
                    ),

                    const SizedBox(height: 20,),
                    //Caption
                    TextFormField(
                      controller: captionTextController,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Type your caption',
                        labelText: 'Caption',
                      ),
                      onChanged: (value) {
                        setState(() {
                          tempPost.caption = value;
                        });
                      },
                    )
                    
                  ],
                )
              )
            ),
          ),

          //PAGE PREVIEW
          Stack(
            children: [

              //Preview
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  //color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20,),
                      PostListItemWidget(post: tempPost,),
                    ],
                  ),
                ),
              ),

              //Add Button
              Positioned(
                right: 20,
                bottom: 20,
                child: ElevatedButton(
                  onPressed: (){
                    if(tempPost.fileName != null || tempPost.file != null){
                      Data.personalInfo.listPost.add(tempPost);
                      Navigator.pop(context, tempPost);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Image still empty"), duration: Duration(milliseconds: 1500),
                      ));
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
          )
        ],
      )
    );
  }

  Future<File?> pickFile() async{
    final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return null;
    
    final var1 = result.files.first;
    final var2 = File(var1.path!);

    return var2;
    
  }

  List<DropdownMenuItem> listOfDropdownItem(List<String> listString, List<dynamic> listDynamic){
    List<DropdownMenuItem> listItem = [];
    for(int i = 0; i < listString.length; i++){
      listItem.add(
        DropdownMenuItem(
          value: listDynamic[i],
          child: Text(listString[i]),
        )
      );
    }
    return listItem;
  }
}