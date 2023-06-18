import 'package:flutter/material.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.description = ''});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textHelper(title, size: 35.0, weight: FontWeight.bold),
        const SizedBox(height: 15.0),
        if (description.isNotEmpty)
          textHelper(description, size: fntSizeDefault),
        if (description.isNotEmpty) const SizedBox(height: 50.0),
      ],
    );
  }
}
