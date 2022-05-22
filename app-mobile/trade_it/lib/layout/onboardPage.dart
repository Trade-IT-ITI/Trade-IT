import 'package:flutter/material.dart';


class OnboardPage extends StatelessWidget {
  const OnboardPage({
    Key? key,
    required this.img,
    required this.title,
    required this.description,
  }) : super(key: key);


  final String img, title, description;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        Image.asset(img),
        const SizedBox(
          height: 70,
        ),
         Text(
          title,
          style:const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          description,
          style:const TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}