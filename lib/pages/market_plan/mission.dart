import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/helper.dart';
import '../../shared/widgets/header.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key, this.isSideItem = false});

  final bool isSideItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: isSideItem ? 2 : 12,
          child: Padding(
            padding: isSideItem
                ? const EdgeInsets.fromLTRB(
                    10.0, 0.0, 0.0, 20.0) // When called as side item
                : const EdgeInsets.fromLTRB(
                    20.0, 30.0, 20.0, 20.0), // When called as page
            child: Column(
              crossAxisAlignment: isSideItem
                  ? CrossAxisAlignment.center // When called as side item
                  : CrossAxisAlignment.start, // When called as page
              children: [
                if (!isSideItem)
                  const Header(
                    title: 'Missions',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer orci velit, varius quis urna eu, lobortis finibus quam.',
                  ),
                if (isSideItem) const SizedBox(height: 20),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: textHelper('Mission',
                                      size: fntSizeDef16,
                                      weight: FontWeight.bold),
                                ),
                              ],
                            ),
                            textHelper('- Watch advertisements'),
                            textHelper('- Buy products'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Expanded(
//       flex: 2,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//         child: Card(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: textHelper('Mission',
//                           size: fntSizeDef16, weight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 textHelper('- Watch advertisements'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     )