import '../commons.dart';

class GlobalBottomBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTabSelected;

  const GlobalBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'KP',
        ),
      ],
    );
  }
}
