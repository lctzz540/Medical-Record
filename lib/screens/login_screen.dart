import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalrecord/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Login successful with $_email and $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0),
                SizedBox(height: screenHeight * .12),
                Text(
                  'Welcome,',
                  style: GoogleFonts.openSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: screenHeight * .01),
                Text(
                  'Sign in to continue!',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                SizedBox(height: screenHeight * .12),
                CupertinoTextField(
                  placeholder: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                CupertinoTextField(
                  placeholder: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                CupertinoButton(
                  onPressed: _submit,
                  color: CupertinoColors.activeBlue,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "I'm a new user, ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
