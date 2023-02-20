import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalrecord/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: screenHeight * .12),
              Text(
                'Create Account,',
                style: GoogleFonts.openSans(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: screenHeight * .01),
              Text(
                'Sign up to get started!',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
              SizedBox(height: screenHeight * .12),
              CupertinoFormSection(
                children: [
                  CupertinoTextFormFieldRow(
                      placeholder: 'Full Name',
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      }),
                  const SizedBox(height: 20.0),
                  CupertinoTextFormFieldRow(
                      placeholder: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      }),
                  const SizedBox(height: 20.0),
                  CupertinoTextFormFieldRow(
                      placeholder: ' Password',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 32.0),
              CupertinoButton.filled(
                onPressed: _submit,
                child: const Text('Sign Up'),
              ),
              SizedBox(
                height: screenHeight * .125,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "I'm already a member, ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign In',
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
    );
  }
}
