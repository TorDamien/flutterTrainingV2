import 'package:flutter_training/commons.dart';

class ListActionModal extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ListActionModal({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Modifier'),
            leading: const Icon(Icons.edit),
            onTap: () {
              Navigator.pop(context);
              onEdit();
            },
          ),
          ListTile(
            title: const Text('Supprimer'),
            leading: const Icon(Icons.delete),
            onTap: () {
              Navigator.pop(context);
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}
