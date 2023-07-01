import 'package:flutter/material.dart';

import '../models/member.dart';
import '../pages/components/menu.dart';

class PageHelper extends StatelessWidget {
  const PageHelper(
      {super.key, this.selectedPage = 0, required this.memberList});

  final int selectedPage;
  final List<Member> memberList;

  @override
  Widget build(BuildContext context) {
    return pages(selectedPage, memberList);
  }
}
