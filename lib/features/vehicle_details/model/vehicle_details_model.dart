class TotalVehicleDetailsModel {
  bool? status;
  Data? data;

  TotalVehicleDetailsModel({
    this.status,
    this.data,
  });

  factory TotalVehicleDetailsModel.fromJson(Map<String, dynamic> json) =>
      TotalVehicleDetailsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  int? id;
  String? uniqueId;
  int? fkUserId;
  int? fkRoleId;
  int? fkVehicleTypeId;
  int? fkCategoryId;
  int? fkSubCategoryId;
  int? fkBrandId;
  int? fkVehicleModelId;
  int? fkVehicleVariantId;
  int? fkVehicleColorId;
  int? fkTransmissionId;
  int? fkFuelTypeId;
  int? fkBodyTypeId;
  dynamic fkVehicleFeaturesId;
  String? year;
  String? location;
  String? latitude;
  String? longitude;
  String? kmDriven;
  DateTime? insuranceValidity;
  String? price;
  String? type;
  dynamic description;
  String? dealPrice;
  int? isNewArrival;
  int? isPopular;
  // Status? status;
  String? vehicleStatus;
  String? isVerified;
  dynamic remark;
  String? percentage;
  String? totalAmount;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  UserDetails? userDetails;
  dynamic bookingVehicleStatus;
  bool? isFavorite;
  int? listedDays;
  List<Image>? images;
  List<OverviewDetail>? overviewDetails;
  List<SpecificationDetail>? specificationDetails;
  List<VehicleDetailFeatureVehicle>? vehicleDetailFeatureVehicles;
  Brand? brand;
  BodyType? category;
  BodyType? subCategory;
  Brand? vehicleModel;
  BodyType? vehicleVariant;
  Brand? vehicleColor;
  BodyType? transmission;
  BodyType? fuelType;
  BodyType? bodyType;
  BodyType? vehicleType;
  List<VehicleInfoDetail>? vehicleInfoDetails;
  List<OverviewDetail>? vehicleOverviewDetails;

  Data({
    this.id,
    this.uniqueId,
    this.fkUserId,
    this.fkRoleId,
    this.fkVehicleTypeId,
    this.fkCategoryId,
    this.fkSubCategoryId,
    this.fkBrandId,
    this.fkVehicleModelId,
    this.fkVehicleVariantId,
    this.fkVehicleColorId,
    this.fkTransmissionId,
    this.fkFuelTypeId,
    this.fkBodyTypeId,
    this.fkVehicleFeaturesId,
    this.year,
    this.location,
    this.latitude,
    this.longitude,
    this.kmDriven,
    this.insuranceValidity,
    this.price,
    this.type,
    this.description,
    this.dealPrice,
    this.isNewArrival,
    this.isPopular,
    // this.status,
    this.vehicleStatus,
    this.isVerified,
    this.remark,
    this.percentage,
    this.totalAmount,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userDetails,
    this.bookingVehicleStatus,
    this.isFavorite,
    this.listedDays,
    this.images,
    this.overviewDetails,
    this.specificationDetails,
    this.vehicleDetailFeatureVehicles,
    this.brand,
    this.category,
    this.subCategory,
    this.vehicleModel,
    this.vehicleVariant,
    this.vehicleColor,
    this.transmission,
    this.fuelType,
    this.bodyType,
    this.vehicleType,
    this.vehicleInfoDetails,
    this.vehicleOverviewDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        uniqueId: json["unique_id"],
        fkUserId: json["fk_user_id"],
        fkRoleId: json["fk_role_id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        fkCategoryId: json["fk_category_id"],
        fkSubCategoryId: json["fk_sub_category_id"],
        fkBrandId: json["fk_brand_id"],
        fkVehicleModelId: json["fk_vehicle_model_id"],
        fkVehicleVariantId: json["fk_vehicle_variant_id"],
        fkVehicleColorId: json["fk_vehicle_color_id"],
        fkTransmissionId: json["fk_transmission_id"],
        fkFuelTypeId: json["fk_fuel_type_id"],
        fkBodyTypeId: json["fk_body_type_id"],
        fkVehicleFeaturesId: json["fk_vehicle_features_id"],
        year: json["year"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        kmDriven: json["km_driven"],
        insuranceValidity: json["insurance_validity"] == null
            ? null
            : DateTime.parse(json["insurance_validity"]),
        price: json["price"],
        type: json["type"],
        description: json["description"],
        dealPrice: json["deal_price"],
        isNewArrival: json["is_new_arrival"],
        isPopular: json["is_popular"],
        // status: statusValues.map[json["status"]]!,
        vehicleStatus: json["vehicle_status"],
        isVerified: json["is_verified"],
        remark: json["remark"],
        percentage: json["percentage"],
        totalAmount: json["total_amount"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
        bookingVehicleStatus: json["booking_vehicle_status"],
        isFavorite: json["is_favorite"],
        listedDays: json["listed_days"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]?.map((x) => Image.fromJson(x))),
        overviewDetails: json["overview_details"] == null
            ? []
            : List<OverviewDetail>.from(json["overview_details"]!
                .map((x) => OverviewDetail.fromJson(x))),
        specificationDetails: json["specification_details"] == null
            ? []
            : List<SpecificationDetail>.from(json["specification_details"]!
                .map((x) => SpecificationDetail.fromJson(x))),
        vehicleDetailFeatureVehicles:
            json["vehicle_detail_feature_vehicles"] == null
                ? []
                : List<VehicleDetailFeatureVehicle>.from(
                    json["vehicle_detail_feature_vehicles"]!
                        .map((x) => VehicleDetailFeatureVehicle.fromJson(x))),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        category: json["category"] == null
            ? null
            : BodyType.fromJson(json["category"]),
        subCategory: json["sub_category"] == null
            ? null
            : BodyType.fromJson(json["sub_category"]),
        vehicleModel: json["vehicle_model"] == null
            ? null
            : Brand.fromJson(json["vehicle_model"]),
        vehicleVariant: json["vehicle_variant"] == null
            ? null
            : BodyType.fromJson(json["vehicle_variant"]),
        vehicleColor: json["vehicle_color"] == null
            ? null
            : Brand.fromJson(json["vehicle_color"]),
        transmission: json["transmission"] == null
            ? null
            : BodyType.fromJson(json["transmission"]),
        fuelType: json["fuel_type"] == null
            ? null
            : BodyType.fromJson(json["fuel_type"]),
        bodyType: json["body_type"] == null
            ? null
            : BodyType.fromJson(json["body_type"]),
        vehicleType: json["vehicle_type"] == null
            ? null
            : BodyType.fromJson(json["vehicle_type"]),
        vehicleInfoDetails: json["vehicle_info_details"] == null
            ? []
            : List<VehicleInfoDetail>.from(json["vehicle_info_details"]!
                .map((x) => VehicleInfoDetail.fromJson(x))),
        vehicleOverviewDetails: json["vehicle_overview_details"] == null
            ? []
            : List<OverviewDetail>.from(json["vehicle_overview_details"]!
                .map((x) => OverviewDetail.fromJson(x))),
      );
}

class BodyType {
  int? id;
  int? fkVehicleTypeId;
  String? name;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? fkCategoryId;
  int? fkBrandId;
  int? fkVehicleModelId;

  BodyType({
    this.id,
    this.fkVehicleTypeId,
    this.name,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkCategoryId,
    this.fkBrandId,
    this.fkVehicleModelId,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
        id: json["id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        name: json["name"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        fkCategoryId: json["fk_category_id"],
        fkBrandId: json["fk_brand_id"],
        fkVehicleModelId: json["fk_vehicle_model_id"],
      );
}

class Brand {
  int? id;
  int? fkVehicleTypeId;
  String? name;
  String? icon;

  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? fkBrandId;

  Brand({
    this.id,
    this.fkVehicleTypeId,
    this.name,
    this.icon,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkBrandId,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        name: json["name"],
        icon: json["icon"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        fkBrandId: json["fk_brand_id"],
      );
}

class Image {
  int? id;
  int? fkVehicleDetailsId;
  String? imageUrl;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Image({
    this.id,
    this.fkVehicleDetailsId,
    this.imageUrl,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        fkVehicleDetailsId: json["fk_vehicle_details_id"],
        imageUrl: json["image_url"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );
}

class OverviewDetail {
  int? id;
  int? fkVehicleDetailsId;
  int? fkVehicleOverviewId;
  String? overviewDetails;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Brand? overview;

  OverviewDetail({
    this.id,
    this.fkVehicleDetailsId,
    this.fkVehicleOverviewId,
    this.overviewDetails,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.overview,
  });

  factory OverviewDetail.fromJson(Map<String, dynamic> json) => OverviewDetail(
        id: json["id"],
        fkVehicleDetailsId: json["fk_vehicle_details_id"],
        fkVehicleOverviewId: json["fk_vehicle_overview_id"],
        overviewDetails: json["overview_details"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        overview:
            json["overview"] == null ? null : Brand.fromJson(json["overview"]),
      );
}

class SpecificationDetail {
  int? id;
  int? fkVehicleDetailsId;
  int? fkSpecificationId;
  String? specificationDetails;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  BodyType? specification;

  SpecificationDetail({
    this.id,
    this.fkVehicleDetailsId,
    this.fkSpecificationId,
    this.specificationDetails,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.specification,
  });

  factory SpecificationDetail.fromJson(Map<String, dynamic> json) =>
      SpecificationDetail(
        id: json["id"],
        fkVehicleDetailsId: json["fk_vehicle_details_id"],
        fkSpecificationId: json["fk_specification_id"],
        specificationDetails: json["specification_details"],
        // specificationDetails:
        //     specificationDetailsValues.map[json["specification_details"]]!,
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        specification: json["specification"] == null
            ? null
            : BodyType.fromJson(json["specification"]),
      );
}

class UserDetails {
  int? id;
  String? name;
  String? countryCode;
  String? mobile;

  UserDetails({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "mobile": mobile,
      };
}

class VehicleDetailFeatureVehicle {
  int? id;
  int? fkVehicleDetailId;
  int? vehicleFeatureId;
  DateTime? createdAt;
  DateTime? updatedAt;
  BodyType? vehicleFeature;

  VehicleDetailFeatureVehicle({
    this.id,
    this.fkVehicleDetailId,
    this.vehicleFeatureId,
    this.createdAt,
    this.updatedAt,
    this.vehicleFeature,
  });

  factory VehicleDetailFeatureVehicle.fromJson(Map<String, dynamic> json) =>
      VehicleDetailFeatureVehicle(
        id: json["id"],
        fkVehicleDetailId: json["fk_vehicle_detail_id"],
        vehicleFeatureId: json["vehicle_feature_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        vehicleFeature: json["vehicle_feature"] == null
            ? null
            : BodyType.fromJson(json["vehicle_feature"]),
      );
}

class VehicleInfoDetail {
  int? id;
  int? fkVehicleDetailsId;
  int? fkVehicleInfoId;
  String? infoDetails;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Brand? vehicleInfo;

  VehicleInfoDetail({
    this.id,
    this.fkVehicleDetailsId,
    this.fkVehicleInfoId,
    this.infoDetails,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.vehicleInfo,
  });

  factory VehicleInfoDetail.fromJson(Map<String, dynamic> json) =>
      VehicleInfoDetail(
        id: json["id"],
        fkVehicleDetailsId: json["fk_vehicle_details_id"],
        fkVehicleInfoId: json["fk_vehicle_info_id"],
        infoDetails: json["info_details"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        vehicleInfo: json["vehicle_info"] == null
            ? null
            : Brand.fromJson(json["vehicle_info"]),
      );
}
