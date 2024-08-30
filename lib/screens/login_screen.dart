import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/widget/button/divider/custom_divider.dart';
import 'package:blog_app/widget/button/login_button.dart';
import 'package:blog_app/widget/button/textfield/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController userTextcontroller = TextEditingController();
    TextEditingController passTextcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text("Welcome Back!"),
                    subtitle: Text("Glad to see you again"),
                  ),
                  SizedBox(
                    height: context.getHight(value: .51),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("Username"),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              //custom widget
                              CustomTextFormField(
                                  hintText: "Username",
                                  userTextcontroller: userTextcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    return validateEmail(value);
                                  }),

                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("Password"),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              //custom widget
                              CustomTextFormField(
                                hintText: "Password",
                                userTextcontroller: passTextcontroller,
                                obscure: true,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This feild is required';
                                  }
                                  return null;
                                },
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text("forget password")),
                              ),
                              LoginButton(
                                onPressed: () {
                                  validateLogin(formKey, context);
                                },
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomDivider(),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          "Enter as guest")),
                                  const CustomDivider(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateLogin(GlobalKey<FormState> formKey, BuildContext context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('input valide user name and password'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'This feild is required';
    }
    if (!value.contains("@")) {
      return "pleas input valide email @ is required";
    }
    return null;
  }
}
