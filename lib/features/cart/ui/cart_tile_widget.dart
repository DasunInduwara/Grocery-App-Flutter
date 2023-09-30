// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';

import 'package:grocery_app/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productDataModel.imgUrl))),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(productDataModel.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(productDataModel.quentity),
                const SizedBox(height: 15),
                Text("\$ ${productDataModel.price}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(width: 20),
            CircleAvatar(
              backgroundColor: Colors.teal,
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(dataModel: productDataModel));
                      },
                      icon: Icon(Icons.remove))),
            ),
            CircleAvatar(
              backgroundColor: Colors.teal,
              child: Center(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.navigate_next))),
            ),
            SizedBox(width: 10),
          ],
        ));
  }
}
