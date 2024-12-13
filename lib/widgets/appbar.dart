import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool istitlecenter;
  const MyAppbar({Key? key, required this.title, this.istitlecenter = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: const Color.fromARGB(255, 4, 26, 44),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
