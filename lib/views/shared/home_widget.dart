import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/views/ui/product_by_cat.dart';

import '../../models/sneaker_model.dart';
import 'appstyle.dart';
import 'new_shoes.dart';
import 'product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    required Future<List<Sneakers>> male, required this.tabIndex,
  })  : _male = male,
        super(key: key);

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          // color: Colors.amber,
          child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error ${snapshot.error} ');
                } else {
                  final male = snapshot.data;

                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return ProductCard(
                        price: ' \$${shoe.price}',
                        category: shoe.category,
                        id: shoe.id,
                        name: shoe.name,
                        image: shoe.imageUrl[0],
                      );
                    },
                  );
                }
              }),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCat(tabIndex: tabIndex,)));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Show All',
                          style: appstyle(22, Colors.black, FontWeight.w500),
                        ),
                        const Icon(
                          AntDesign.caretright,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: FutureBuilder<List<Sneakers>>(
                  future: _male,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error ${snapshot.error} ');
                    } else {
                      final male = snapshot.data;

                      return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewShoes(
                              imageUrl: shoe.imageUrl[1],
                            ),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        )
      ],
    );
  }
}
