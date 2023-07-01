import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/member.dart';
import '../../shared/helper.dart';
import '../components/header.dart';
import 'mission.dart';

class PageFasttrack extends StatelessWidget {
  const PageFasttrack(
      {super.key, required this.memberList, this.isSideItem = false});

  final List<Member> memberList;
  final bool isSideItem;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var w = size.width / 100;

    ///
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
                if (isSideItem)
                  textHelper('Fast track', size: 30, weight: FontWeight.bold)
                else
                  const Header(
                    title: 'Fast track',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer orci velit, varius quis urna eu, lobortis finibus quam.',
                  ),
                if (isSideItem) const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              // child: textHelper('Last updated:\n${DateTime.now()}',
                              //     size: fntSizeDefault0, style: FontStyle.italic),
                              child: textHelper(
                                  '* List ini di-update berkala tiap 5 menit.',
                                  size: 15,
                                  color: Colors.red,
                                  style: FontStyle.italic),
                            ),
                            Expanded(
                              child: memberList.isNotEmpty
                                  ? ListView.builder(
                                      itemBuilder: (context, index) {
                                        Member m = memberList[index];
                                        return Card(
                                          elevation: 10.0,
                                          child: ListTile(
                                            title: textHelper(m.uid),
                                            subtitle: textHelper(
                                                DateFormat(
                                                        'dd-MMM-yyyy hh:mm:ss.sss')
                                                    .format(m.joinDate),
                                                color: Colors.grey,
                                                style: FontStyle.italic),
                                          ),
                                        );
                                      },
                                      itemCount: memberList.length,
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      if (!isSideItem)
                        const Expanded(
                          flex: 2,
                          child: PageMission(isSideItem: true),
                        ),
                    ],
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
