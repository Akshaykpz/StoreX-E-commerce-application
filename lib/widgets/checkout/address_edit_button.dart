import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/accounts/shippingAddress/shipping_address.dart';

class AddressEditButton extends StatefulWidget {
  const AddressEditButton({super.key});

  @override
  State<AddressEditButton> createState() => _AddressEditButtonState();
}

class _AddressEditButtonState extends State<AddressEditButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShippingAddress(),
            ));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(4)),
          height: 30,
          width: 70,
          child: const Center(
            child: Text(
              "edit",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          )),
    );
  }
}
