import 'package:flutter/material.dart';
import 'package:with_you/view/SignupForm.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 70, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Sign in to continue",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 15),
                      TextInputContainer(
                        controller: userEmailController,
                        hintText: "E-Mail",
                        icon: const Icon(Icons.mail),
                      ),
                      const SizedBox(height: 15),
                      TextInputContainer(
                        controller: passwordController,
                        hintText: "Password",
                        icon: const Icon(Icons.key),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUp();
                              },
                            ),
                          );
                        },
                        child: const Text("Sign Up!"),
                      )
                    ],
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

class TextInputContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon icon;

  const TextInputContainer(
      {required this.controller,
      required this.hintText,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        TextFormField(
          controller: controller,
          validator: (val) => val?.length == 0 ? "Please Enter $hintText" : null,
          onSaved:(newValue) => controller.text= newValue ?? " ",
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        )
      ],
    );
  }
}

