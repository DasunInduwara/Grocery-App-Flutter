import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/wishlist/bloc/wishlist_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successSate = state as WishlistSuccessState;
              return GridView.builder(
                itemCount: successSate.wishlistItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (context, index) {
                  return SizedBox(
                      child: Card(
                    child: Column(children: [
                      Container(
                        height: 130,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                    successSate.wishlistItems[index].imgUrl))),
                      ),
                      IconButton(
                          onPressed: () {
                            wishlistBloc.add(WishlistRemoveFromListEvent(dataModel: successSate.wishlistItems[index]));
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red[700],
                          ))
                    ]),
                  ));
                },
              );
            case WishlistEmptyState:
              return const Center(
                child: Icon(Icons.heart_broken),
              );
            default:
          }

          return Container();
        },
      ),
    );
  }
}
