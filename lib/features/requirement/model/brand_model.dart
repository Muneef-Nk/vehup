class BrandModel {
  bool? status;
  BrandData? data;

  BrandModel({
    this.status,
    this.data,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        status: json["status"],
        data: json["data"] == null ? null : BrandData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class BrandData {
  List<Brand>? brands;
  List<Brand>? vehicleColors;
  List<Brand>? vehicleInfo;

  BrandData({
    this.brands,
    this.vehicleColors,
    this.vehicleInfo,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
        brands: json["brands"] == null
            ? []
            : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
        vehicleColors: json["vehicleColors"] == null
            ? []
            : List<Brand>.from(
                json["vehicleColors"]!.map((x) => Brand.fromJson(x))),
        vehicleInfo: json["vehicleInfo"] == null
            ? []
            : List<Brand>.from(
                json["vehicleInfo"]!.map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
        "vehicleColors": vehicleColors == null
            ? []
            : List<dynamic>.from(vehicleColors!.map((x) => x.toJson())),
        "vehicleInfo": vehicleInfo == null
            ? []
            : List<dynamic>.from(vehicleInfo!.map((x) => x.toJson())),
      };
}

class Brand {
  int? id;
  String? name;

  Brand({
    this.id,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
