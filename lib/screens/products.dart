import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshop/screens/details_screen.dart';

class ProductsByCategory extends StatelessWidget {
  static const routeName = '/products';
  const ProductsByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('items')
              .where("category", isEqualTo: categoryName)
              .snapshots(),
          builder: (context, snapshot) {
            final snapshotStatus = snapshot.connectionState;
            switch (snapshotStatus) {
              case ConnectionState.none:

              case ConnectionState.waiting:

              case ConnectionState.done:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final snap = snapshot.data!.docs;
                return SingleChildScrollView(
                  child: SizedBox(
                    height: screenHeight * 0.40,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: snap.length,
                        itemBuilder: (context, index) {
                          final data = snap[index];
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
                                    image:
                                        NetworkImage(data['image'].toString()),
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
                );
            }
          }),
    );
  }
}
