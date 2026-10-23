import 'package:evently_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppBarIconWidget extends StatelessWidget {
  const AppBarIconWidget({
    super.key, required this.containerChild, this.onPressed,

  });
final Widget containerChild;

final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon:containerChild,
          onPressed:onPressed ,
        ),
      ),
    );
  }
}