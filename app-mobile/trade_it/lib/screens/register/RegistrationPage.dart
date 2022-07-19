import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/user.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final fnController = TextEditingController();
  final lnController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User? user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign Up",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: BoxDecoration(
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
                SizedBox(height: 20),
                FieldName(name: "Last Name"),
                Field(
                  controllerName: lnController,
                  hint: "Enter Last Name",
                ),
                SizedBox(height: 20),
                FieldName(name: "Phone"),
                Field(
                  controllerName: phoneController,
                  hint: "Enter Phone",
                  type: TextInputType.phone,
                ),
                SizedBox(height: 20),
                FieldName(name: "Email"),
                Field(
                  controllerName: emailController,
                  hint: "Enter Email Address",
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                FieldName(
                  name: "Password",
                ),
                Field(
                  controllerName: passwordController,
                  hint: "Enter Password",
                  isSecured: true,
                ),
                SizedBox(height: 50),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("form submitted");
                        Navigator.pushNamed(context, "/login");
                      }
                      user?.firstName = fnController.text.trim();
                      user?.lastName = lnController.text.trim();
                      user?.phone = phoneController.text.trim();
                      user?.email = emailController.text.trim();
                      user?.password = passwordController.text.trim();
                    },
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

class Field extends StatelessWidget {
  const Field({
    required this.controllerName,
    required this.hint,
    this.isSecured = false,
    this.type = TextInputType.text,
    Key? key,
  }) : super(key: key);

  final TextEditingController controllerName;
  final bool isSecured;
  final String hint;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      obscureText: isSecured,
      controller: controllerName,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          fillColor: Colors.grey.withOpacity(.3),
          filled: true),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Valid Value";
        }
      },
    );
  }
}

class FieldName extends StatelessWidget {
  FieldName({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
