import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshop/screens/products.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String categoryName = '';
  @override
  Widget build(BuildContext context) {
    final userCredential = FirebaseAuth.instance.currentUser!.uid;

    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            setState(() {
              categoryName = 'men';
            });
            await Navigator.pushNamed(
              context,
              ProductsByCategory.routeName,
              arguments: categoryName,
            );
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.005,
            ),
            width: screenWidth,
            height: screenHeight * 0.2,
            decoration: const BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/image-confident-caucasian-man-smiling-pleased-holding-hands-crossed-chest-looking-satisfie_1258-145702.jpg?w=1800&t=st=1677019033~exp=1677019633~hmac=5aa8a374d5e79f42917fda1d61db5388e69c3a96e38e5881faaf23fa9279cfaa'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Men',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            setState(() {
              categoryName = 'women';
            });
            await Navigator.pushNamed(
              context,
              ProductsByCategory.routeName,
              arguments: categoryName,
            );
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.005,
            ),
            width: screenWidth,
            height: screenHeight * 0.2,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/young-beautiful-brunette-businesswoman-smiling-pointing-finger-side_176420-9925.jpg?w=1800&t=st=1677022761~exp=1677023361~hmac=26834e0bda8c2a60b3732bd42ef13f537764900546eea19555a27f8109b86a66',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Women',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
