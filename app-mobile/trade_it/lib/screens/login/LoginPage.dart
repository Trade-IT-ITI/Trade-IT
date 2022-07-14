import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passController = TextEditingController();

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
                height: 200,
                width: double.infinity,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Email Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Enter Email Address",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 17),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    fillColor: Colors.grey.withOpacity(.3),
                    filled: true),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Enter Password",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 17),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    fillColor: Colors.grey.withOpacity(.3),
                    filled: true),
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
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ))
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     SizedBox(
              //       height: 50,
              //       width: 130,
              //       child: ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all<Color>(
              //               Colors.white.withOpacity(.5)),
              //           shape:
              //               MaterialStateProperty.all<RoundedRectangleBorder>(
              //                   RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(15))),
              //         ),
              //         onPressed: () {},
              //         child: const Text(
              //           "F",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Colors.black),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 50,
              //       width: 130,
              //       child: ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all<Color>(
              //               Colors.white.withOpacity(.5)),
              //           shape:
              //               MaterialStateProperty.all<RoundedRectangleBorder>(
              //                   RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(15))),
              //         ),
              //         onPressed: () {},
              //         child: const Text(
              //           "G",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Colors.black),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
