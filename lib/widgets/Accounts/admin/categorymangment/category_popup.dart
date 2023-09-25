import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/delete_data.dart';

class Categoryedit extends StatefulWidget {
  final String categoryid;
  const Categoryedit({super.key, required this.categoryid});

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
              const Icon(Icons.edit),
              const Padding(padding: EdgeInsets.all(5)),
              Text(edit),
            ],
          ),
        ),
        PopupMenuItem(
          value: delete,
          child: Row(
            children: [
              const Icon(Icons.delete),
              const Padding(padding: EdgeInsets.all(5)),
              Text(delete),
            ],
          ),
        ),
      ],
      onSelected: (String newvalue) {
        if (newvalue == delete) {
          deleteCategory(widget.categoryid);
        } else if (newvalue == edit) {}
      },
    );
  }
}
