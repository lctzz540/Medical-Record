import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalrecord/screens/collections_screen.dart';
import 'package:medicalrecord/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle customTextStyle = GoogleFonts.zeyada(
      fontSize: 52,
      fontWeight: FontWeight.bold,
      color: CupertinoColors.black,
    );

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/home_screen.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Medical Record',
                    style: customTextStyle,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Keep your health data organized and easily accessible. Sign in to get started.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const CollectionScreen()),
                      );
                    },
                    child: const Center(
                        child: Text(
                      'Collections',
                      style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
