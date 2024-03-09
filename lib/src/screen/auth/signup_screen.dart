import 'package:flutter/material.dart';

import 'package:novel_app/src/common/active_button/buttons.dart';
import 'package:novel_app/src/common/fields/text_input_fields.dart';
import 'package:novel_app/src/utils/validator/validator.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 39, 115, 246),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Text(
                        "SIGN UP",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 37,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Start your reading journey with Narrative.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 300,
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextInputFields.password(
                              controller: passwordController,
                              hintText: "Password",
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }

                                return "null";
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextInputFields.password(
                              controller: confirmPasswordController,
                              hintText: "Password",
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }

                                return "null";
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/loginscreen');
                                },
                                child: const Text("Sign In"),
                              ),
                              const Text("now")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: ActionButtons(
                          text: "SIGN IN",
                          onPressed: () {
                            Navigator.pushNamed(context, '/mainscreen');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
