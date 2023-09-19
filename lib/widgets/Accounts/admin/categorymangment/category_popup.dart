import 'package:flutter/material.dart';

class Categoryedit extends StatefulWidget {
  const Categoryedit({super.key});

  @override
  State<Categoryedit> createState() => _CategoryeditState();
}

class _CategoryeditState extends State<Categoryedit> {
  @override
  Widget build(BuildContext context) {
    String edit = 'edit';
    String delete = 'delete';
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: edit,
          child: Row(
            children: [
              Icon(Icons.edit),
              Padding(padding: EdgeInsets.all(5)),
              Text(edit),
            ],
          ),
        ),
        PopupMenuItem(
          value: edit,
          child: Row(
            children: [
              Icon(Icons.delete),
              Padding(padding: EdgeInsets.all(5)),
              Text(delete),
            ],
          ),
        ),
      ],
      onSelected: (String newvalue) {
        setState(() {});
      },
    );
  }
}
