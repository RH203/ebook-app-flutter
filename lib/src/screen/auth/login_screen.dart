import 'package:flutter/material.dart';
import 'package:novel_app/src/common/active_button/buttons.dart';
import 'package:novel_app/src/common/fields/text_input_fields.dart';
import 'package:novel_app/src/utils/validator/validator.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 35,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hi! Welcome back, you've been missed",
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
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
                margin: const EdgeInsets.only(right: 25),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child: ActionButtons(
                  onPressed: () => Navigator.pushNamed(context, '/mainscreen'),
                  text: "Submit",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70),
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
                      const Text("Dont have an account?"),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signupscreen'),
                        child: Text(
                          "Sign Up",
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
