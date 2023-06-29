import 'package:flutter/material.dart';
import 'package:one_gate_system/pages/home/widgets/login.dart';
import 'package:one_gate_system/shared/helper.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.size,
    this.mobileMode = false,
    this.tabletMode = false,
    this.desktopMode = false,
    this.text = 'Desktop',
  });

  final Size size;
  final bool mobileMode;
  final bool tabletMode;
  final bool desktopMode;
  final String text;

  @override
  Widget build(BuildContext context) {
    // var h = size.height / 100;
    // var w = size.width / 100;
    // var titleText = text.isNotEmpty ? ' - $text' : text;
    var mode = '';
    if (mobileMode) {
      mode = 'Mobile';
    } else if (tabletMode) {
      mode = 'Tablet';
    } else if (desktopMode) {
      mode = 'Desktop';
    }

    double hPad = 10;
    double btnHeight = 15;
    if (mobileMode) {
      hPad = 10;
    }
    if (tabletMode) {
      hPad = 10;
      btnHeight = 10;
    }
    if (desktopMode) {
      btnHeight = 8;
    }

    print('hPad: $hPad\nbtnHeight: $btnHeight\n');

    return Container(
      color: Colors.transparent,
      // color: Colors.white70,
      child: Padding(
        padding: EdgeInsets.all(hPad),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textHelper(mobileMode ? 'OGS - $mode' : 'One Gate System - $mode',
                size: 30.0,
                color: Colors.white,
                shadows: [
                  const Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
            if (mobileMode)
              const Icon(Icons.menu, size: 40, color: Colors.white)
            else
              WidgetLogin(btnHeight: btnHeight),
          ],
        ),
      ),
    );
  }
}
