import 'package:flutter/cupertino.dart';
import 'package:project/widget/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final color;
  final iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    this.color,
    this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}

