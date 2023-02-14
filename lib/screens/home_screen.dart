import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/auth/auth_error.dart';
import 'package:onlineshop/bloc/app_bloc_bloc.dart';
import 'package:onlineshop/dialogs/show_auth_error.dart';
import 'package:onlineshop/model/items.dart';
import 'package:onlineshop/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  HomeScreen({super.key});
  final List<Items> item = [];
  @override
  Widget build(BuildContext context) {
    // final List<Items>? getData = context.read<AppBlocBloc>().state.items;
    // print(getData!.toList().length.toString() + "Herreee WEE GOOO!!");

    // print(itemsRef.get());

    Size size = MediaQuery.of(context).size;

    final screenWidth = size.width;
    final screenHeight = size.height;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, snapshot) {
          final snapConnection = snapshot.connectionState;
          switch (snapConnection) {
            case ConnectionState.none:

            case ConnectionState.waiting:

            case ConnectionState.done:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black.withAlpha(150),
                ),
              );

            case ConnectionState.active:
              if (!snapshot.hasData) {
                return const Center(
                    child: Text('please check Your connection'));
              }
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                primary: true,
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const ColorScheme.light().primary,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/flat-winter-clothes-essentials-collection_23-2149139964.jpg?w=1800&t=st=1675266996~exp=1675267596~hmac=4735b9f6d40c71523f0fcc1521b8d94ba6eef294abb04c4ad2327726d3ce7a23"),
                        ),
                      ),
                      child: Stack(children: [
                        Positioned(
                          left: 10,
                          top: 20,
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.amber,
                            child: const Icon(
                              Icons.production_quantity_limits,
                              size: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 20,
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.amber,
                            child: const Icon(
                              Icons.food_bank,
                              size: 30,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Text(
                    "Products",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Material(
                    color: const Color(0xFF0081C9),
                    borderRadius: BorderRadius.circular(2),
                    child: SizedBox(
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.008,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.008,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: screenHeight * 0.40,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];
                            final itemId = data.id;
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DetailsScreen.routeName,
                                    arguments: itemId);
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                height: screenHeight * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          data['image'].toString()),
                                      fit: BoxFit.cover),
                                ),
                                child: Material(
                                  color: Colors.black87,
                                  child: SizedBox(
                                    width: screenWidth,
                                    height: screenHeight * 0.06,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(data['name'].toString()),
                                              Text(
                                                  '${data['price'].toString()}\$'),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.bookmark_border,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              );
          }
        });
  }
}
