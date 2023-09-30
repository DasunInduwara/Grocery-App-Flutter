// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';

import 'package:grocery_app/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(productDataModel.imgUrl))),
              ),
              const SizedBox(height: 10),
              Text(productDataModel.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(productDataModel.quentity),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ ${productDataModel.price}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeProductWishlistButtonClickEvent(
                                productData: productDataModel));
                          },
                          icon: const Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeProductCartButtonClickEvent(
                                productData: productDataModel));
                          },
                          icon: const Icon(Icons.shopping_bag_outlined))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
