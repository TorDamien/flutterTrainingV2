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
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.flight_outlined),
          label: 'Vol',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discord_rounded),
          label: 'Drone',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'KP',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important),
          label: 'Notam',
        ),
      ],
    );
  }
}
