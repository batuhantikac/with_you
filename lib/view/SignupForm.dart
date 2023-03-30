import 'package:flutter/material.dart';
import 'LoginPage.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userIdController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEMailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userComPasswordController = TextEditingController();

  signUp() {
    final form = _formKey.currentState;

    String uid = _userIdController.text;
    String uName = _userNameController.text;
    String uMail = _userEMailController.text;
    String uPassword = _userPasswordController.text;
    String uComPassword = _userComPasswordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Create New Account",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      TextInputContainer(
                        controller: _userNameController,
                        hintText: "User Name",
                        icon: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 15),
                      TextInputContainer(
                        controller: _userEMailController,
                        hintText: "E-Mail",
                        icon: const Icon(Icons.mail),
                      ),
                      const SizedBox(height: 15),
                      TextInputContainer(
                        controller: _userPasswordController,
                        hintText: "Password",
                        icon: const Icon(Icons.key),
                      ),
                      const SizedBox(height: 15),
                      TextInputContainer(
                        controller: _userComPasswordController,
                        hintText: "Confirm Password",
                        icon: const Icon(Icons.key),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.blue,
                        ),
                        child: TextButton(
                          onPressed: signUp(),
                          child: const Text(
                            "SignUp",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginForm();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Already Register? Log in here",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
