import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshop/cart_bloc/cart_bloc.dart';
import 'package:onlineshop/model/items.dart';
import 'package:onlineshop/screens/order_screen.dart';
import 'package:onlineshop/utils/drawer.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/detailsScreen';
  DetailsScreen({this.items, super.key});
  Items? items;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String data = ModalRoute.of(context)!.settings.arguments as String;
    // final test = FirebaseFirestore.instance.collection('user').doc(data);

    // print(test.get());
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF0081C9),
                Color(0xFF5BC0F8),
                Color(0xFF86E5FF),
              ]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              )),
        ),
        toolbarHeight: screenHeight * 0.07,
        elevation: 0,
        title: const Text('Description'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('items')
              .doc(data)
              .snapshots(),
          builder: (context, snapshot) {
            final snapshotStatus = snapshot.connectionState;
            switch (snapshotStatus) {
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
                  return const Text('Check Your connection');
                }
                final snap = snapshot.data!.data()!;
                // var da = snapshot.data!.data()!.entries.map((e) {
                //   for (var i in e.value) {
                //     return i['name'];
                //   }
                // });
                return ListView(
                  primary: true,
                  padding: EdgeInsets.all(8.0),
                  children: [
                    Image.network(
                      snap['image'],
                      fit: BoxFit.cover,
                      height: screenHeight * 0.3,
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 22),
                    ),
                    Divider(
                      color: Colors.black.withAlpha(150),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      snap['description'],
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      "Price : ${snap['price'].toString()} \$",
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 18),
                    ),
                    BlocConsumer<CartBloc, CartState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return SizedBox(
                          height: screenHeight * 0.15,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow.shade700,
                        ),
                        onPressed: () {
                          items = Items(
                              name: snap['name'],
                              description: snap['description'],
                              image: snap['image'],
                              price: snap['price']);

                          context.read<CartBloc>().add(CartItemsAdded(items!));
                        },
                        child: Text(
                          "Buy Now",
                          style: GoogleFonts.montserrat(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
