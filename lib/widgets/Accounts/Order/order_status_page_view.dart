// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:giltezy_2ndproject/controller/order_provider.dart';
// import 'package:giltezy_2ndproject/controller/provder_auth.dart';
// import 'package:giltezy_2ndproject/controller/users_auth.dart';

// class MyOrder extends ConsumerStatefulWidget {
//   const MyOrder({super.key});

//   @override
//   ConsumerState<MyOrder> createState() => _MyOrderState();
// }

// class _MyOrderState extends ConsumerState<MyOrder> {
//   @override
//   Widget build(BuildContext context) {
//     final orderlist = ref.watch(userdata);
//     final product = ref.watch(productList);
//     return orderlist.when(
//       data: (orderdata) {
//         return SafeArea(
//           child: product.when(
//             data: (productdata) {
//               return Scaffold(
//                 body: ListView.builder(
//                   itemCount: orderdata.length,
//                   itemBuilder: (context, index) {
//                     final newdata =
//                         orderdata[index].data() as Map<String, dynamic>;
//                     final reference =
//                         newdata['product_reference'] as DocumentReference;
//                     final orderitems = productdata.where((element) {
//                       return element.reference == reference;
//                     });

//                   },
//                 ),
//               );
//             },
//             error: (error, stackTrace) {},
//             loading: () {},
//           ),
//         );
//       },

//       error: (error, stackTrace) {
//         return Text("data");
//       },
//       loading: () {
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/order_provider.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';

class MyOrder extends ConsumerStatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  ConsumerState<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends ConsumerState<MyOrder> {
  @override
  Widget build(BuildContext context) {
    final orderlist = ref.watch(userdata);
    final product = ref.watch(productList);

    return orderlist.when(
      data: (orderdata) {
        return SafeArea(
          child: product.when(
            data: (productdata) {
              return Scaffold(
                body: ListView.builder(
                  itemCount: orderdata.length,
                  itemBuilder: (context, index) {
                    final newdata =
                        orderdata[index].data() as Map<String, dynamic>;
                    final orderId = newdata['payment_id'];
                    final ordertime = newdata['time'];
                    final reference =
                        newdata['product_reference'] as DocumentReference;
                    final orderitems = productdata.where((element) {
                      return element.reference == reference;
                    });

                    if (orderitems.isNotEmpty) {
                      final productName = orderitems.first['p_name'];
                      final productPrice = orderitems.first['p_price'];
                      final productImage = orderitems.first['P-imageurl'];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            trailing: Text(ordertime),
                            leading: Image.network(productImage),
                            title: Text(productName),
                            subtitle: Text('Price: $productPrice'),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              return const Center(
                child: Text('Error loading product data'),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text('Error loading order data'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
