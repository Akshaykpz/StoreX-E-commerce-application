import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/delete_data.dart';
import 'package:giltezy_2ndproject/widgets/admin/categorymangment/update_category.dart';

class Categoryedit extends StatefulWidget {
  final String categoryid;
  final String image;
  final String name;

  const Categoryedit(
      {super.key,
      required this.categoryid,
      required this.image,
      required this.name});

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
        } else if (newvalue == edit) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateCategory(
                    categoryname: widget.name, image: widget.image),
              ));
        }
      },
    );
  }
}
