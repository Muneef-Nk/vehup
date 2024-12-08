class GetVariantModel {
  bool? status;
  Data? data;

  GetVariantModel({
    this.status,
    this.data,
  });

  factory GetVariantModel.fromJson(Map<String, dynamic> json) =>
      GetVariantModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  List<BodyType>? variant;
  List<BodyType>? transmissions;
  List<BodyType>? fuelTypes;
  List<BodyType>? bodyTypes;

  Data({
    this.variant,
    this.transmissions,
    this.fuelTypes,
    this.bodyTypes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        variant: json["variant"] == null
            ? []
            : List<BodyType>.from(
                json["variant"]!.map((x) => BodyType.fromJson(x))),
        transmissions: json["transmissions"] == null
            ? []
            : List<BodyType>.from(
                json["transmissions"]!.map((x) => BodyType.fromJson(x))),
        fuelTypes: json["fuelTypes"] == null
            ? []
            : List<BodyType>.from(
                json["fuelTypes"]!.map((x) => BodyType.fromJson(x))),
        bodyTypes: json["bodyTypes"] == null
            ? []
            : List<BodyType>.from(
                json["bodyTypes"]!.map((x) => BodyType.fromJson(x))),
      );
}

class BodyType {
  int? id;
  String? name;

  BodyType({
    this.id,
    this.name,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
        id: json["id"],
        name: json["name"],
      );
}
