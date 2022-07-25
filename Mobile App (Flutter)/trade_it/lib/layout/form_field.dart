import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({
    required this.controllerName,
    required this.hint,
    this.isSecured = false,
    this.type = TextInputType.text,
    this.isEmail = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controllerName;
  final bool isSecured, isEmail;
  final String hint;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      obscureText: isSecured,
      controller: controllerName,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 17),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent)),
          fillColor: Colors.grey.withOpacity(.3),
          filled: true),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a Value";
        }
        if (isEmail) {
          final bool isValid = EmailValidator.validate(value);
          if (!isValid) {
            return "Enter Valid Email";
          }
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
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
