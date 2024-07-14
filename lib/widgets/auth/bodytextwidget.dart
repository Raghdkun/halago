import 'package:flutter/material.dart';

class BodyTextField extends StatelessWidget {
  final String bodytext ;
  const BodyTextField({super.key, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  bodytext,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ));
  }
}