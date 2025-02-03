part of 'main_base_layout_screen.dart';

abstract class MainBaseLayoutController extends State<MainBaseLayoutScreen> {

  int _currentIndex = 0;

  final List<Widget> _screens = [
    VolPage(title: 'Vol Page'),
    DronePage(title: 'Drone Page'),
    KpScreen(),
    NotamPage(
      url: 'https://sofia-briefing.aviation-civile.gouv.fr/sofia/pages/notamadminmenu.html',
      title: 'Sofia-Briefing Notam',
    ),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}