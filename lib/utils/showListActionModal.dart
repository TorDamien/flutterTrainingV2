import 'package:flutter_training/commons.dart';


void showListActionModal(BuildContext context, VoidCallback onEdit, VoidCallback onDelete) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => ListActionModal(
      onEdit: onEdit,
      onDelete: onDelete,
    ),
  );
}