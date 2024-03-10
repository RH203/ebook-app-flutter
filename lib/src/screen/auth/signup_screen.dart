import 'package:flutter/material.dart';
import 'package:novel_app/src/common/active_button/buttons.dart';
import 'package:novel_app/src/common/fields/text_input_fields.dart';
import 'package:novel_app/src/utils/validator/validator.dart';
import 'package:icons_plus/icons_plus.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 35,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 300,
                child: Text(
                  "Fill your information below or register with your social account",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                width: 350,
                child: TextInputFields(
                  controller: nameController,
                  hintText: "Username",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }

                    if (!Validator.usernameIsValid(value)) {
                      return "Invalid username";
                    }

                    return "null";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child: TextInputFields(
                  controller: emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }

                    if (!Validator.emailIsValid(value)) {
                      return "Invalid Email";
                    }

                    return "null";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child: TextInputFields.password(
                  controller: passwordController,
                  hintText: "Password",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }

                    if (!Validator.passwordIsValid(value)) {
                      return "Invalid Password";
                    }

                    return "null";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                width: 350,
                child: ActionButtons(
                  onPressed: () => Navigator.pushNamed(context, '/mainscreen'),
                  text: "Submit",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  "Or sign in with",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        AntDesign.google_circle_fill,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        AntDesign.facebook_fill,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        AntDesign.apple_fill,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signupscreen'),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
