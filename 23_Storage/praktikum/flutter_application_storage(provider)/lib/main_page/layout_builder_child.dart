import 'package:flutter/material.dart';
import 'package:flutter_application_storage/main_page/my_appbar.dart';

class LayoutBuilderChild extends StatelessWidget {
  const LayoutBuilderChild({super.key, this.isVertical = true, required this.child});

  final bool isVertical;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return (isVertical) ? Column(
      children: [
        const MyAppbar(isHorizontal: true,),
        Expanded(child: child),
      ],
    ) : Row(
      children: [
        const MyAppbar(isHorizontal: false,),
        Expanded(child: child),
      ],
    );
  }
}