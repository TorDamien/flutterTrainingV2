import 'package:flutter_training/commons.dart';

part 'user_controller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  createState() => _UserScreen();
}

class _UserScreen extends UserController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User Screen',
            ),
          ],
        ),
      ),
    );
  }
}