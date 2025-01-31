import 'package:flutter_training/commons.dart';

part 'kp_controller.dart';

class KpScreen extends StatefulWidget {
  const KpScreen({super.key});

  @override
  createState() => _KpScreen();
}

class _KpScreen extends KpController {



  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (_isForecastLoading || _isKpLoading)
            ? const Center(child: CircularProgressIndicator()) // TODO: Remplacer par le skeleton loading
            : Column(
                children: <Widget>[
                  // TODO: Utiliser l'api pour afficher le kp dans le demi donut et n faire un widget
                  Text(
                    'Current Kp Index',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  KpRadialGauge(kpIndex: getCurrentKpIndex().toDouble()),
                  const SizedBox(height: 16),
                  const Text(
                    'Forecast Data',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  // TODO: En faire un widget de l'affichage de la forecast liste
                  Expanded(
                    child: PageView.builder(
                      itemCount: (_forecastDataList.length / 5).ceil(), // 5 jours par page
                      onPageChanged: (index) {
                        setState(() => currentPage = index);
                      },
                      itemBuilder: (context, pageIndex) {
                        final items = _forecastDataList.skip(pageIndex * 4).take(4).toList();
                        return Container(
                            decoration: BoxDecoration(
                            border: Border(
                            top: BorderSide(color: Colors.grey.shade400, width: 2),
                            ),

                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Wrap(
                            spacing: 10, // Espace entre les éléments
                            runSpacing: 10, // Espace vertical si plusieurs lignes
                            alignment: WrapAlignment.spaceEvenly, // Répartit uniformément les éléments
                            children: items.map((data) {
                              return Container(
                                width: 80, // Taille fixe pour chaque item
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: data.kp < 5
                                      ? Colors.green.shade200
                                      : (data.kp <= 6 ? Colors.yellow.shade200 : Colors.red.shade200),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      data.kp.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${data.jour} ${data.mois}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
        ),
      )
    );
  }
}

// TODO: Mettre un bouton pour reload les données dans le cas ou ça a échoué en arrivant sur la page
// Mettre également un message pour dire que les données n'ont pas pu être chargées