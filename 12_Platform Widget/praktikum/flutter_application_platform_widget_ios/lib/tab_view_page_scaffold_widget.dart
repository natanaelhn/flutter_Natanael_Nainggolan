import 'package:flutter/cupertino.dart';

class TabViewPageScaffoldWidget extends StatelessWidget {
  final String? appBarName;
  final Widget childWidget;

  const TabViewPageScaffoldWidget({
    Key? key,
    this.appBarName,
    this.childWidget = const Text('null')
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(appBarName!),
      ),
      
      //https://stackoverflow.com/questions/59379899/why-flutters-cupertinonavigationbar-overlaps-children-in-cupertinopagescaffold
      child: SafeArea(
        child: childWidget,
        )
    );
  }
}

class ListTabViewPageScaffold{
  static const List<TabViewPageScaffoldWidget> list = [
    TabViewPageScaffoldWidget(appBarName: 'Contacts'), 
    TabViewPageScaffoldWidget(appBarName: 'Calls'), 
    TabViewPageScaffoldWidget(
      appBarName: 'Chats',
      childWidget: Text('This is Chats Page'),
    ),
    TabViewPageScaffoldWidget(appBarName: 'Settings')
  ];


}

