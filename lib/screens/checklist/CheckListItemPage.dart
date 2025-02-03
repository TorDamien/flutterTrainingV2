import 'package:flutter_training/commons.dart';

class CheckListItemPage extends StatelessWidget {
  final CheckList checkList;
  final Drone drone;

  CheckListItemPage({required this.checkList, required this.drone});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final checkList = drone.checkList;

    return Scaffold(
      appBar: AppBar(
        title: Text(checkList.title),
      ),
      body: ListView.builder(
        itemCount: checkList.categories.length,
        itemBuilder: (context, categoryIndex) {
          final category = checkList.categories[categoryIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: category.backgroundColor,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: category.items.length,
                itemBuilder: (context, itemIndex) {
                  final item = category.items[itemIndex];

                  return ListTile(
                    title: Text(item.description),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

