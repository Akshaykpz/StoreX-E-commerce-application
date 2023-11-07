import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/service/serach_data.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/item_view.dart';
import 'package:page_transition/page_transition.dart';

class SearchViewPage extends ConsumerStatefulWidget {
  const SearchViewPage({Key? key}) : super(key: key);

  @override
  _SearchViewPageState createState() => _SearchViewPageState();
}

class _SearchViewPageState extends ConsumerState<SearchViewPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<QueryDocumentSnapshot> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    final firebaseService = ref.watch(firebaseServiceProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          foregroundColor: Colors.black,
          title: TextField(
            cursorColor: Colors.black,
            cursorOpacityAnimates: true,
            controller: _searchController,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.clear_rounded,
                color: Colors.black,
              ),

              fillColor: Colors.grey[500],
              filled: true,

              hintText: '   Search ',

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.zero,

              //                border: InputBorder.none,
              //                hintText: "My Custom Search Label", // KEY PROP
              hintStyle: const TextStyle(color: Colors.black), // KEY PROP
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
              firebaseService.searchItems(_searchQuery).then((results) {
                setState(() {
                  _searchResults = results; // Update the search results
                });
              });
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<QueryDocumentSnapshot>>(
                  future: firebaseService.searchItems(_searchQuery),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (_searchQuery.isEmpty) {
                      return Center(
                          child: Image.asset(
                        // 'assets/images/Animation - 1699335032719.gif',
                        'assets/images/Animation - 1699335032719.gif',
                        color: Colors.black38,
                      ));
                    } else if (_searchResults.isEmpty) {
                      return const Center(child: Text('No items found'));
                    } else {
                      return ListView.separated(
                        itemCount: _searchResults.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 1,
                            color: Colors.grey,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final data = _searchResults[index].data()
                              as Map<String, dynamic>;
                          final productname = data["p_name"].toString();

                          final productimage = data['P-imageurl'].toString();

                          final productPrice = data['p_price'].toString();

                          final productstock = data['stock'].toString();
                          // final reference = document[index].reference;
                          // final reference = data[index].reference;

                          // ignore: non_constant_identifier_names
                          final Productdescription =
                              data['p_description'].toString();
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: ItemViews(
                                          stock: productstock,
                                          imageUrl: productimage,
                                          productName: productname,
                                          productPrice: productPrice,
                                          reference:
                                              _searchResults[index].reference,
                                          productDescription:
                                              Productdescription)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      productimage,
                                      height: 70,
                                    ),
                                    Text(productname)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/**
 * class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    final productListAsyncValue = ref.watch(productListProvider);

    return backgroundColor(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            foregroundColor: Colors.white,
            title: Text(
              'Search Your product',
              style: TextStyle(color: customTextColor),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: productListAsyncValue.when(
            data: (data) {
              // Extract product data from the List<DocumentSnapshot<Object?>>
              final products = data.map((snapshot) {
                final productData = snapshot.data() as Map<String, dynamic>;
                return Product(
                  productImage: productData['p_image'],
                  productStock: productData['p_stock'],
                  productDescription: productData['p_description'],
                  productName: productData['p_name'],
                  price: productData['p_price'],
                );
              }).toList();

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: SearchableList<Product>(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  initialList: products,
                  builder: (displayedList, itemIndex, item) {
                    return GridAnimatorWidget(
                      child: ShowSearchResult(
                        productName: item.productName,
                        productPrice: item.price,
                        productStock: item.productStock,
                        imageUrl: item.productImage,
                      ),
                    );
                  },
                  filter: (value) => products
                      .where(
                        (element) =>
                            element.productName.toLowerCase().contains(value),
                      )
                      .toList(),
                  emptyWidget: const Center(
                    child: Text('empty'),
                  ),
                  inputDecoration: InputDecoration(
                    labelText: "Search product",
                    labelStyle: const TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => loading(),
            loading: loading,
          ),
        ),
      ),
    );
  }
}
 */