import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/delete_data.dart';

import 'package:giltezy_2ndproject/widgets/admin/productmanagment/update_prouduct.dart';

class Productedit extends StatefulWidget {
  final String productid;
  final String name;
  final String price;
  final String description;
  final String stock;
  final String category;
  final String image;
  const Productedit(
      {super.key,
      required this.productid,
      required this.name,
      required this.price,
      required this.description,
      required this.stock,
      required this.category,
      required this.image});

  @override
  State<Productedit> createState() => _CategoryeditState();
}

class _CategoryeditState extends State<Productedit> {
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
      onSelected: (String newvalue) async {
        if (newvalue == delete) {
          await deleteproudct(widget.productid);
        } else if (newvalue == edit) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateProduct(
                    category: widget.category,
                    description: widget.description,
                    image: widget.image,
                    name: widget.name,
                    price: widget.price,
                    stock: widget.stock),
              ));
        }
      },
    );
  }
}
