import 'package:flutter/material.dart';
import 'package:novel_app/src/common/active_button/buttons.dart';
import 'package:novel_app/src/common/fields/text_input_fields.dart';
import 'package:novel_app/src/utils/validator/validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 39, 115, 246),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Text(
                      "SIGN IN",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 37,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Ready for another adventure?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextInputFields(
                        controller: emailController,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Harap masukan email";
                          }

                          if (!Validator.emailIsValid(value)) {
                            return "Email Tidak Valid";
                          }

                          return "null";
                        },
                      ),
                      const SizedBox(height: 12),
                      TextInputFields.password(
                        controller: passwordController,
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Harap masukan password";
                          }

                          return "null";
                        },
                      ),
                      SizedBox(
                        width: 200,
                        child: ActionButtons(
                          text: "SIGN IN",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
