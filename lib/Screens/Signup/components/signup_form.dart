import 'package:flutter/material.dart';
import 'package:neuramap/services/services.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:intl/intl.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _name, _gender, _password;
  String? _birthdate;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {
              _email = email;
            },
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: const Icon(Icons.email),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(29),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (name) {
              _name = name;
            },
            decoration: InputDecoration(
              hintText: "Name",
              prefixIcon:
                  const Icon(Icons.person_pin), // Remove the Padding widget
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(29),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          DropdownButtonFormField<String>(
            items: ["Male", "Female", "Other"].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Gender",
              prefixIcon: const Icon(Icons.person),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(29),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            readOnly: true,
            controller: TextEditingController(
              text: _birthdate != null
                  ? DateFormat('yyyy-MM-dd').format(DateTime.parse(_birthdate!))
                  : '', // Format the date
            ),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  setState(() {
                    _birthdate = date
                        .toIso8601String(); // Store the ISO8601 formatted date
                  });
                }
              });
            },
            onSaved: (birthdate) {
              // Don't save if _birthdate is null
              if (_birthdate != null) {
                _birthdate = birthdate;
              }
            },
            decoration: InputDecoration(
              hintText: "Birthdate",
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(29),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            obscureText: _obscureText,
            onSaved: (password) {
              _password = password;
            },
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(Icons.lock), // Updated icon
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(29),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                final userCredential = await AuthServices()
                    .signup(_email!, _password!, _name!, _gender!, _birthdate!);

                if (userCredential != null) {
                  // Successfully signed up
                  // Navigate to the desired screen or show a success message
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen()), // Replace with your success screen
                  );
                } else {
                  // Handle sign-up error
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("Sign-up error occurred. Please try again."),
                    ),
                  );
                }
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
