import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  double totalPrice = 0.0;

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery Cart"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<CartBloc, CartState>(
                  bloc: cartBloc,
                  listener: (context, state) {
                    if (state is CartSuccessState) {
                      setState(() {
                        totalPrice = state.totalPrice;
                      });
                    }
                  },
                  listenWhen: (previous, current) =>
                      current is CartSuccessState,
                  builder: (context, state) => Text(
                    "Total : \$ $totalPrice",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => null,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text(
                    "Pay",
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          print(state.runtimeType == CartSuccessState);
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successSate = state as CartSuccessState;
              return ListView.builder(
                itemCount: successSate.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                      productDataModel: successSate.cartItems[index],
                      cartBloc: cartBloc);
                },
              );
            case CartEmptyState:
              return Center(
                child: Image.network(
                    "https://img.icons8.com/cotton/50/shopping-cart--v1.png"),
              );
            default:
          }

          return Container();
        },
      ),
    );
  }
}
