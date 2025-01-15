import 'package:flutter_training/commons.dart';

part 'main_base_layout_controller.dart';

class MainBaseLayoutScreen extends StatefulWidget {

  const MainBaseLayoutScreen({super.key});

  @override
  createState() => _MainBaseLayoutScreen();
}

class _MainBaseLayoutScreen extends MainBaseLayoutController {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text du layout de base'),
      ),
      drawer: GlobalLeftDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: GlobalBottomBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}