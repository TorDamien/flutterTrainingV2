import 'package:flutter_training/commons.dart';

class KpRadialGauge extends StatelessWidget {
  final double kpIndex;

  const KpRadialGauge({super.key, required this.kpIndex});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLastLabel: true,
          minimum: 0,
          maximum: 10,
          showLabels: true,
          showTicks: true,
          axisLineStyle: AxisLineStyle(thickness: 15),
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 4, color: Colors.green, startWidth: 15, endWidth: 15),
            GaugeRange(startValue: 4, endValue: 7, color: Colors.yellow, startWidth: 15, endWidth: 15),
            GaugeRange(startValue: 7, endValue: 10, color: Colors.red, startWidth: 15, endWidth: 15),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(value: kpIndex, enableAnimation: true, needleColor: Colors.black, knobStyle: KnobStyle(color: Colors.black)),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                kpIndex.toStringAsFixed(1),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              positionFactor: 0.8,
              angle: 90,
            ),
          ],
        ),
      ],
    );
  }
}