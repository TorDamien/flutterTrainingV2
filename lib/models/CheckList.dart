import 'package:flutter_training/commons.dart';

class ItemCL {
  final int id;
  final String description;
  bool isDone;

  ItemCL({required this.id, required this.description, this.isDone = false});

  // Méthode pour créer un Item à partir de JSON
  factory ItemCL.fromJson(Map<String, dynamic> json) {
    return ItemCL(
      id: json['id'],
      description: json['description'],
      isDone: json['isDone'] ?? false,
    );
  }

  // Méthode pour convertir un Item en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isDone': isDone,
    };
  }

}

class CategoryCL {
  final String name;
  final Color backgroundColor; // On pourrait mettre en couleur le thème de l'application + une certaine valeur pour différencier chaque catégorie
  final List<ItemCL> items;

  CategoryCL({required this.name, required this.backgroundColor, required this.items});

  // Méthode pour créer une Category à partir de JSON
  factory CategoryCL.fromJson(Map<String, dynamic> json) {
    return CategoryCL(
      name: json['name'],
      backgroundColor: Color(json['backgroundColor']),
      items: (json['items'] as List)
          .map((itemJson) => ItemCL.fromJson(itemJson))
          .toList(),
    );
  }

  // Méthode pour convertir une Category en JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'backgroundColor': backgroundColor,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class CheckList {
  final int id;
  final String title;
  final List<CategoryCL> categories;

  CheckList({required this.id, required this.title, required this.categories});

  // Méthode pour créer une CheckList à partir de JSON
  factory CheckList.fromJson(Map<String, dynamic> json) {
    return CheckList(
      id: json['id'],
      title: json['title'],
      categories: (json['categories'] as List)
          .map((categoryJson) => CategoryCL.fromJson(categoryJson))
          .toList(),
    );
  }

  // Méthode pour convertir une CheckList en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }
}