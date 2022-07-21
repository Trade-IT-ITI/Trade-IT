import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_it/handlers/requests_handler.dart';

import '../../layout/constants.dart';
import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Sign In",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 220,
                width: double.infinity,
              ),
              loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              "Email Address",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Email";
                              } else {
                                final bool isValid =
                                    EmailValidator.validate(value);
                                if (!isValid) {
                                  return "Enter Valid Email";
                                }
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                hintText: "Enter Email Address",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 17),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                fillColor: Colors.grey.withOpacity(.3),
                                filled: true),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Password";
                              }
                            },
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: passController,
                            decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                hintText: "Enter Password",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 17),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                fillColor: Colors.grey.withOpacity(.3),
                                filled: true),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).colorScheme.primary),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  login(
                                    email: emailController.text,
                                    password: passController.text,
                                  );
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/register");
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    User user;
    RequestHandler reqHandler = RequestHandler();
    String url = reqHandler.baseURL + 'User/Login';
    Map<String, String> reqBody = {
      "email": email,
      "password": password,
      "type": "1",
    };
    String response = await reqHandler.postData(
      url,
      bodyMap: reqBody,
    );
    if (response == "error") {
      alertDialog(
        context: context,
        title: "Can't Login !",
        body: 'Your Email or Password is Incorrect',
      );
    } else {
      Map responseJson = jsonDecode(response);
      user = User.fromJson(responseJson['user']);
      String token = responseJson['token'];
      storeUser(user: user);
      successSnackBar(
        context: context,
        title: 'Login Success !',
      );
      await Future.delayed(const Duration(
        seconds: 2,
      ));
      Navigator.pushNamed(context, "/home");
    }
    return User();
  }
}
