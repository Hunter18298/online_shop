import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
                      "https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg?w=740&t=st=1667390038~exp=1667390638~hmac=582fd2a88f8daa1df8b87f6de03d3feab00b475f91dc1fb89d3824ac3da63d06"),
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
            child: Container(
              height: screenHeight * 0.45,
              color: Colors.red,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => Container(
                        color: Colors.black,
                        height: screenHeight * 0.1,
                        child: Text("hi"),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
