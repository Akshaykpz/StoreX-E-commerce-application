import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    int selectedValue = 1; // Initially selected value

    void handleRadioValueChanged(int? value) {
      // Make sure to handle null case if value is nullable
      if (value != null) {
        setState(() {
          selectedValue = value;
        });
      }
    }

    return Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(64, 75, 96, .9),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AKSHAY KP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  "blocked",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            trailing: Radio<int>(
              value: 1,
              groupValue: selectedValue,
              onChanged: handleRadioValueChanged,
            ),
          ),
        ));
  }
}
