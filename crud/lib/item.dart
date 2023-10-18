class Item {
  final String title;
  final String disc;

  Item({required this.title, required this.disc});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(title: json['title'], disc: json['disc']);
  }
}