import 'package:flutter/material.dart';

class CustomTopNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onProfile;

  CustomTopNavbar({
    required this.title,
    required this.onProfile,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: onProfile,
        ),
      ],
      centerTitle: true,
      elevation: 0, // Remove shadow if needed
      backgroundColor: Colors.white, // Adjust color as needed
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
