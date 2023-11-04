import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/accounts/shippingAddress/shipping_address.dart';

class AddressEditButton extends StatefulWidget {
  final String? name;

  final String? address;
  final String? phone;
  final String? pincode;
  final String? district;
  const AddressEditButton(
      {super.key,
      this.name,
      this.address,
      this.phone,
      this.pincode,
      this.district});

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
              builder: (context) => ShippingAddress(
                  name: widget.name.toString(),
                  address: widget.address,
                  district: widget.district,
                  phone: widget.phone,
                  pincode: widget.pincode),
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
