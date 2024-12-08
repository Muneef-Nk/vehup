class ModelDataModel {
  bool? status;
  List<Model>? data;

  ModelDataModel({
    this.status,
    this.data,
  });

  factory ModelDataModel.fromJson(Map<String, dynamic> json) => ModelDataModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Model>.from(json["data"]!.map((x) => Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Model {
  int? id;
  String? name;

  Model({
    this.id,
    this.name,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
