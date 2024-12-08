class RequirementModel {
  bool? status;
  List<Data>? data;

  RequirementModel({
    this.status,
    this.data,
  });

  factory RequirementModel.fromJson(Map<String, dynamic> json) =>
      RequirementModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );
}

class Data {
  int? id;
  int? fkVehicleTypeId;
  int? fkBrandId;
  int? fkVehicleModelId;
  int? fkVehicleVariantId;
  int? fkTransmissionId;
  int? fkFuelTypeId;
  int? fkVehicleColorId;
  String? year;
  String? status;
  RBrand? vehicleType;
  RBrand? brand;
  RBrand? vehicleModel;
  RBrand? vehicleVariant;
  RBrand? transmission;
  RBrand? fuelType;
  RBrand? vehicleColor;

  Data({
    this.id,
    this.fkVehicleTypeId,
    this.fkBrandId,
    this.fkVehicleModelId,
    this.fkVehicleVariantId,
    this.fkTransmissionId,
    this.fkFuelTypeId,
    this.fkVehicleColorId,
    this.year,
    this.status,
    this.vehicleType,
    this.brand,
    this.vehicleModel,
    this.vehicleVariant,
    this.transmission,
    this.fuelType,
    this.vehicleColor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        fkBrandId: json["fk_brand_id"],
        fkVehicleModelId: json["fk_vehicle_model_id"],
        fkVehicleVariantId: json["fk_vehicle_variant_id"],
        fkTransmissionId: json["fk_transmission_id"],
        fkFuelTypeId: json["fk_fuel_type_id"],
        fkVehicleColorId: json["fk_vehicle_color_id"],
        year: json["year"],
        status: json["status"],
        vehicleType: json["vehicle_type"] == null
            ? null
            : RBrand.fromJson(json["vehicle_type"]),
        brand: json["brand"] == null ? null : RBrand.fromJson(json["brand"]),
        vehicleModel: json["vehicle_model"] == null
            ? null
            : RBrand.fromJson(json["vehicle_model"]),
        vehicleVariant: json["vehicle_variant"] == null
            ? null
            : RBrand.fromJson(json["vehicle_variant"]),
        transmission: json["transmission"] == null
            ? null
            : RBrand.fromJson(json["transmission"]),
        fuelType: json["fuel_type"] == null
            ? null
            : RBrand.fromJson(json["fuel_type"]),
        vehicleColor: json["vehicle_color"] == null
            ? null
            : RBrand.fromJson(json["vehicle_color"]),
      );
}

class RBrand {
  int? id;
  String? name;

  RBrand({
    this.id,
    this.name,
  });

  factory RBrand.fromJson(Map<String, dynamic> json) => RBrand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
