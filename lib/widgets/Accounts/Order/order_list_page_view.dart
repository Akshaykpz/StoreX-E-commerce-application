import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/order_provider.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/widgets/accounts/order/orderstatus_view.dart';

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
                    // final orderId = newdata['payment_id'];
                    // final ordertime = newdata['time'];
                    final reference =
                        newdata['product_reference'] as DocumentReference;
                    final orderitems = productdata.where((element) {
                      return element.reference == reference;
                    });

                    if (orderitems.isNotEmpty) {
                      final productName = orderitems.first['p_name'];

                      final productImage = orderitems.first['P-imageurl'];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          child: Card(
                            color: Colors.deepPurple[100],
                            elevation: 6,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              leading: Image.network(productImage),
                              title: const Text(
                                'Arriving Monday',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green),
                              ),
                              subtitle: Text(
                                productName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderStatus(),
                                        ));
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ),
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
