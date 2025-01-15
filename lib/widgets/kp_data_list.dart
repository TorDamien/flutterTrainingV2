import 'package:flutter_training/commons.dart';

class KpDataList extends StatelessWidget {

  final List<KpData> kpDataList;

  const KpDataList({super.key, required this.kpDataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kpDataList.length,
      itemBuilder: (context, index) {
        final KpData kp = kpDataList[index];
        return ListTile(
          title: Text('Date: ${kp.time_tag}'),
          subtitle: Text('Kp value: ${kp.kp_index}'),
        );
      },
    );
  }
}