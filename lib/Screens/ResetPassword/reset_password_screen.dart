import 'package:flutter/material.dart';

import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: const Color.fromARGB(255, 102, 5, 144),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding * 2, horizontal: defaultPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text with beautiful font style
              const Text(
                "Please enter your email address and we will send you a link to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.all(defaultPadding),
                ),
              ),
              // Reset password button
              const SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12.0),
                ),
                child: const Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
