import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;

  const AppbarWidget({
    Key? key,
    required this.title,
    required this.onMenuPressed,
    required this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        onPressed: onMenuPressed,
      ),
      title: Text(title,style: const TextStyle(color: Colors.white,),),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search,color: Colors.white,),
          onPressed: onSearchPressed,
        ),
      ],
      backgroundColor: Colors.blue,
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
