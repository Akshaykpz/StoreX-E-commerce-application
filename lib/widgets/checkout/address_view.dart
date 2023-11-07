import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/address_provider.dart';

class AddressView extends ConsumerStatefulWidget {
  const AddressView({super.key});

  @override
  ConsumerState<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends ConsumerState<AddressView> {
  @override
  Widget build(BuildContext context) {
    final addressdata = ref.watch(addressdataList);
    return addressdata.when(
      data: (data) {
        final address = data[0].data() as Map<String, dynamic>;
        final name = address['name'];
        final orderaddress = address['address'];
        final phone = address['phone'];
        final district = address['district'];
        final pincode = address["pincode"];
        return SizedBox(
            // decoration: BoxDecoration(color: Colors.blue),
            height: 150,
            width: 370,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  orderaddress,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  district,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Phone:$phone",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Pincode:$pincode",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],

              // trailing: Text(abc),
            ));
      },
      error: (error, stackTrace) {
        return const Text('data is not availble');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
