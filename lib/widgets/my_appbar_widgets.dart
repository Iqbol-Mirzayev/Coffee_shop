import 'package:flutter/material.dart';

import '../core/constants/color_const.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color? color;
  final BuildContext context;
  final VoidCallback? function;
  final IconData? icon;
  MyAppBar(
      {Key? key,
      required this.title,
      this.color = ColorConst.kPrimaryColor,
      required this.context,
      this.function,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(title),
      backgroundColor: color,
      actions: [
        function != null
            ? IconButton(
                onPressed: function,
                icon: Icon(icon != null ? icon : Icons.logout))
            : SizedBox()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.07);
}
