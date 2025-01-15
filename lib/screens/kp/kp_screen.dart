import 'package:flutter_training/commons.dart';

part 'kp_controller.dart';

class KpScreen extends StatefulWidget {
  const KpScreen({super.key});

  @override
  createState() => _KpScreen();
}

class _KpScreen extends KpController {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kp index'),
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : Text('Current Kp index: ${getCurrentKpIndex()}'),
    );
  }
}

// TODO: Mettre un bouton pour reload les données dans le cas ou ça a échoué en arrivant sur la page
// Mettre également un message pour dire que les données n'ont pas pu être chargées