import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about_us';
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight * 0.8,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              AboutContainer(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                image: 'assets/paywand.jpg',
                name: 'paywand',
                role: 'Group Leader',
              ),
              AboutContainer(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                image: 'assets/paywand.jpg',
                name: 'paywand',
                role: 'student',
              ),
              AboutContainer(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                image: 'assets/paywand.jpg',
                name: 'paywand',
                role: 'student',
              ),
              AboutContainer(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                image: 'assets/paywand.jpg',
                name: 'paywand',
                role: 'student',
              ),
              AboutContainer(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                image: 'assets/paywand.jpg',
                name: 'paywand',
                role: 'student',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutContainer extends StatelessWidget {
  const AboutContainer({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.name,
    required this.role,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;
  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: screenHeight * 0.1,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Material(
        color: Colors.black87,
        child: SizedBox(
          width: screenWidth,
          height: screenHeight * 0.06,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name),
                    Text(role),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
