import 'package:flutter/material.dart';


class ESectionHeading extends StatelessWidget {
  const ESectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = "View All",
    this.buttonTextColor = Colors.blue,
    required this.title,
    this.showActionButton = false, 
    this.padding = EdgeInsets.zero,
  });
  final Color? textColor, buttonTextColor;
  final bool showActionButton;
  final EdgeInsetsGeometry padding;
  final String title, buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
              if(showActionButton)TextButton(onPressed: onPressed, child: Text(buttonTitle, style: TextStyle(color: buttonTextColor))),                   
            ],
          ),
    );
    }
}