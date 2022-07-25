import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../handlers/requests_handler.dart';
import '../../layout/constants.dart';
import '../../layout/form_field.dart';
import '../../models/user.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final fnController = TextEditingController();
  final lnController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          "Sign Up",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: AlignmentDirectional.center,
                    height: 200,
                    child: Image.asset("assets/images/logo.png")),
                FieldName(name: "First Name"),
                Field(
                  controllerName: fnController,
                  hint: "Enter First Name",
                ),
                const SizedBox(height: 20),
                FieldName(name: "Last Name"),
                Field(
                  controllerName: lnController,
                  hint: "Enter Last Name",
                ),
                const SizedBox(height: 20),
                FieldName(name: "Phone"),
                Field(
                  controllerName: phoneController,
                  hint: "Enter Phone",
                  type: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                FieldName(name: "Email"),
                Field(
                  controllerName: emailController,
                  hint: "Enter Email Address",
                  type: TextInputType.emailAddress,
                  isEmail: true,
                ),
                const SizedBox(height: 20),
                FieldName(
                  name: "Password",
                ),
                Field(
                  controllerName: passwordController,
                  hint: "Enter Password",
                  isSecured: true,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        User newUser = User(
                          firstName: fnController.text,
                          lastName: lnController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        );
                        register(
                          context: context,
                          user: newUser,
                        );
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> register(
    {required BuildContext context, required User user}) async {
  RequestHandler reqHandler = RequestHandler();
  String url = reqHandler.baseURL + 'User/Register';
  Map<String, dynamic> reqBody = user.toJson();
  String response = await reqHandler.postData(
    url,
    bodyMap: reqBody,
  );
  if (response == "error") {
    alertDialog(
      context: context,
      title: "Can't Register !",
      body: 'Something Went Wrong Please Try Again.',
    );
    return false;
  } else {
    successSnackBar(
      context: context,
      title: 'Register Complete !',
    );
    await Future.delayed(const Duration(
      seconds: 2,
    ));
    Navigator.pushNamed(context, "/login");
    return true;
  }
}
