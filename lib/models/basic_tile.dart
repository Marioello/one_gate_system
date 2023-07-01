import '../services/auth.dart';

class BasicTile {
  final int pageNo;
  final String title;
  final List<BasicTile> tiles;
  final Function? onTap;

  BasicTile({
    required this.pageNo,
    required this.title,
    this.tiles = const [],
    this.onTap,
  });
}

final AuthService auth = AuthService();

final basicTiles = [
  BasicTile(pageNo: 0, title: 'Beranda', onTap: () {}),
  BasicTile(pageNo: 1, title: 'Produk', onTap: () {}),
  BasicTile(pageNo: 2, title: 'Menu', onTap: () {}),
  BasicTile(
    pageNo: 3,
    title: 'Marketing Plan',
    tiles: [
      BasicTile(pageNo: 31, title: 'Fast Track', onTap: () {}),
    ],
  ),
  BasicTile(pageNo: -1, title: 'Logout', onTap: () => auth.signOut()),
];
