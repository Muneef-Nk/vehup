class TotalVehicleModel {
  bool? status;
  List<Data>? data;

  TotalVehicleModel({
    this.status,
    this.data,
  });

  factory TotalVehicleModel.fromJson(Map<String, dynamic> json) =>
      TotalVehicleModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  int? id;
  String? uniqueId;
  int? fkVehicleTypeId;
  int? fkFuelTypeId;
  int? fkBrandId;
  int? fkVehicleModelId;
  int? fkVehicleVariantId;
  String? year;
  String? price;
  String? dealPrice;
  int? isNewArrival;
  int? isPopular;
  String? vehicleStatus;
  String? isVerified;
  String? totalAmount;
  DateTime? createdAt;
  String? location;
  String? kmDriven;
  int? listedDays;
  bool? isBooked;
  dynamic bookingId;
  List<Image>? images;
  Brand? vehicleType;
  Brand? fuelType;
  Brand? brand;
  Brand? vehicleModel;
  Brand? vehicleVariant;

  Data({
    this.id,
    this.uniqueId,
    this.fkVehicleTypeId,
    this.fkFuelTypeId,
    this.fkBrandId,
    this.fkVehicleModelId,
    this.fkVehicleVariantId,
    this.year,
    this.price,
    this.dealPrice,
    this.isNewArrival,
    this.isPopular,
    this.vehicleStatus,
    this.isVerified,
    this.totalAmount,
    this.createdAt,
    this.location,
    this.kmDriven,
    this.listedDays,
    this.isBooked,
    this.bookingId,
    this.images,
    this.vehicleType,
    this.fuelType,
    this.brand,
    this.vehicleModel,
    this.vehicleVariant,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        uniqueId: json["unique_id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        fkFuelTypeId: json["fk_fuel_type_id"],
        fkBrandId: json["fk_brand_id"],
        fkVehicleModelId: json["fk_vehicle_model_id"],
        fkVehicleVariantId: json["fk_vehicle_variant_id"],
        year: json["year"],
        price: json["price"],
        dealPrice: json["deal_price"],
        isNewArrival: json["is_new_arrival"],
        isPopular: json["is_popular"],
        vehicleStatus: json["vehicle_status"],
        isVerified: json["is_verified"],
        totalAmount: json["total_amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        location: json["location"],
        kmDriven: json["km_driven"],
        listedDays: json["listed_days"],
        isBooked: json["is_booked"],
        bookingId: json["booking_id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        vehicleType: json["vehicle_type"] == null
            ? null
            : Brand.fromJson(json["vehicle_type"]),
        fuelType: json["fuel_type"] == null
            ? null
            : Brand.fromJson(json["fuel_type"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        vehicleModel: json["vehicle_model"] == null
            ? null
            : Brand.fromJson(json["vehicle_model"]),
        vehicleVariant: json["vehicle_variant"] == null
            ? null
            : Brand.fromJson(json["vehicle_variant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unique_id": uniqueId,
        "fk_vehicle_type_id": fkVehicleTypeId,
        "fk_fuel_type_id": fkFuelTypeId,
        "fk_brand_id": fkBrandId,
        "fk_vehicle_model_id": fkVehicleModelId,
        "fk_vehicle_variant_id": fkVehicleVariantId,
        "year": year,
        "price": price,
        "deal_price": dealPrice,
        "is_new_arrival": isNewArrival,
        "is_popular": isPopular,
        "vehicle_status": vehicleStatus,
        "is_verified": isVerified,
        "total_amount": totalAmount,
        "created_at": createdAt?.toIso8601String(),
        "location": location,
        "km_driven": kmDriven,
        "listed_days": listedDays,
        "is_booked": isBooked,
        "booking_id": bookingId,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "vehicle_type": vehicleType?.toJson(),
        "fuel_type": fuelType?.toJson(),
        "brand": brand?.toJson(),
        "vehicle_model": vehicleModel?.toJson(),
        "vehicle_variant": vehicleVariant?.toJson(),
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

class Image {
  int? id;
  int? fkVehicleDetailsId;
  String? imageUrl;

  Image({
    this.id,
    this.fkVehicleDetailsId,
    this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        fkVehicleDetailsId: json["fk_vehicle_details_id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fk_vehicle_details_id": fkVehicleDetailsId,
        "image_url": imageUrl,
      };
}
