import 'package:flutter/material.dart';

class EProductTitleText extends StatelessWidget {
  const EProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left, this.overflow = TextOverflow.ellipsis,
  });
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
              title,
              style: smallSize
                  ? Theme.of(context).textTheme.labelLarge
                  : Theme.of(context).textTheme.titleSmall,
              maxLines: maxLines,
              overflow: overflow,
              textAlign: textAlign,
          ),
        ),
      ],
    );  
  }
}