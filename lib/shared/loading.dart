import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.transparent,
      child: const Center(
        child: SpinKitChasingDots(
          color: Color(0xFFC86DD7),
          size: 50.0,
        ),
      ),
    );
  }
}
