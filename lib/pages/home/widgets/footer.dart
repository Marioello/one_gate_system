import 'package:flutter/material.dart';
import 'package:one_gate_system/shared/helper.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    var w = size.width / 100;
    // var h = size.height / 100;

    return Container(
      // color: Colors.grey[50]?.withOpacity(.50),
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(w * 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textHelper('Copyright 2023 - One Gate System Team',
                size: 15.0, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
