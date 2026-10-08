import 'package:evently_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.size,
    required this.childClicked,
    required this.isClicked,
    required this.childNotClicked,
  });
  final Widget childClicked;
  final Widget childNotClicked;
  final Size size;
  final bool isClicked;
  @override
  Widget build(BuildContext context) {
    return 
        Container(
            width: size.width * .2,
            height: size.height * .03,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:isClicked?
               Theme.of(context).shadowColor:Theme.of(context).splashColor,
              border: BoxBorder.all(color: 
              isClicked?
              Theme.of(context).shadowColor:
              Theme.of(context).hintColor
              ),
            ),
            child: Center(child: isClicked ? childClicked : childNotClicked),
          );
       
  }
}
