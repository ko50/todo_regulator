class Tag {
  final String id;
  String name;
  int colorCode;

  Tag({
    this.id,
    this.name,
    this.colorCode,
  });

  Tag.fromJson(Map<String, dynamic> json)
      : this.id = json["id"],
        this.name = json["name"],
        this.colorCode = json["colorCode"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "colorCode": colorCode,
      };
}
