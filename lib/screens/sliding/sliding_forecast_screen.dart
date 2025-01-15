import 'package:flutter_training/commons.dart';

class SlidingForecast extends StatefulWidget {
  @override
  _SlidingForecastState createState() => _SlidingForecastState();
}

class _SlidingForecastState extends State<SlidingForecast> {
  final List<Map<String, dynamic>> forecastData = List.generate(
    27,
        (index) => {
      'date': 'Day ${index + 1}',
      'kp': (2 + index % 6).toDouble(), // Exemple de données
    },
  );

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliding Forecast')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: (forecastData.length / 5).ceil(), // 5 jours par page
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              itemBuilder: (context, pageIndex) {
                final items = forecastData.skip(pageIndex * 5).take(5).toList();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: items.map((data) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['kp'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: data['kp'] < 5
                                ? Colors.green
                                : (data['kp'] <= 6 ? Colors.yellow : Colors.red),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(data['date']),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text('Page: ${currentPage + 1}'),
        ],
      ),
    );
  }
}