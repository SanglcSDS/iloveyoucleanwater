import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.description,
    required this.id,
    required this.name,
    required this.image,
    required this.tags,
    required this.itemId,
  });

  final String description;
  final String id;
  final String name;
  final String image;
  final List<Tag> tags;
  final String itemId;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        description: json["description"] ?? '',
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        image: json["image"]["url"] ?? '',
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        itemId: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags.map((x) => x.toJson())),
        "id": itemId == null ? null : itemId,
      };
}

class Tag {
  Tag({
    required this.name,
    required this.price,
    required this.item,
    required this.id,
  });

  final String name;
  final double price;
  final String item;
  final String id;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"] ?? '',
        price: json["price"].toDouble() ?? '',
        item: json["item"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "item": item == null ? null : item,
        "id": id == null ? null : id,
      };
}
