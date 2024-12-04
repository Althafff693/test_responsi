import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String summary;
  final VoidCallback onTap;

  const ListItem({
    Key? key,
    required this.title,
    required this.summary,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(summary),
      onTap: onTap,
    );
  }
}
