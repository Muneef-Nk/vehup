import 'package:flutter/material.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/requirement/model/brand_model.dart';
import 'package:vehup/features/requirement/model/get_requirement_model.dart';
import 'package:vehup/features/requirement/model/get_variant_model.dart';
import 'package:vehup/features/requirement/model/model_data_model.dart';
import 'package:vehup/features/requirement/service/add_requirement_service.dart';
import 'package:vehup/features/requirement/service/get_brand_data_service.dart';
import 'package:vehup/features/requirement/service/get_model_data_service.dart';
import 'package:vehup/features/requirement/service/get_requirement_service.dart';
import 'package:vehup/features/requirement/service/get_variant_service.dart';

class RequirementController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

// get requremt list
  RequirementModel? requirements;
  Future<void> getRequrementList(BuildContext context) async {
    _setLoading(true);
    try {
      requirements = await GetRequirementService.getRequirement();
    } catch (e) {
      showSnackBar(
          context, "Failed to load requrements. Please try again later.");
    } finally {
      _setLoading(false);
    }
  }

// get brand
  BrandModel? brandModel;
  Future<void> getBrand({
    required BuildContext context,
    required int typeId,
  }) async {
    _setLoading(true);
    selectedBrand = null;
    selectedModel = null;
    selectedVariant = null;
    dataModel = null;
    variantModel = null;
    selectedYear = null;
    selectedTransmission = null;
    try {
      brandModel = await GetBrandService.getBrandData(typeId);
    } catch (e) {
      showSnackBar(
          context, "Failed to load brand data. Please try again later.");
    } finally {
      _setLoading(false);
    }
  }

  // change brand
  Brand? selectedBrand;
  changeBrand({
    Brand? brand,
    required int typeId,
    required BuildContext ctx,
  }) {
    selectedBrand = brand;
    selectedModel = null;
    selectedVariant = null;
    selectedFuel = null;
    selectedBodyType = null;

    getModel(context: ctx, brandId: selectedBrand!.id!, typeId: typeId);
    notifyListeners();
  }

// get model
  ModelDataModel? dataModel;
  bool isModelLoading = false;
  Future<void> getModel({
    required BuildContext context,
    required int typeId,
    required int brandId,
  }) async {
    isModelLoading = true;
    notifyListeners();
    try {
      dataModel = await GetModelService.getModelData(typeId, brandId);
    } catch (e) {
      showSnackBar(
          context, "Failed to load brand data. Please try again later.");
    } finally {
      isModelLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

// change model
  Model? selectedModel;
  changeModel({
    Model? model,
    required int typeId,
    required BuildContext context,
  }) {
    selectedModel = model;
    selectedVariant = null;
    selectedFuel = null;
    selectedBodyType = null;
    variantModel = null;
    selectedTransmission = null;
    notifyListeners();
    getVariant(
      brandId: selectedBrand!.id!,
      context: context,
      modelId: selectedModel!.id!,
      typeId: typeId,
    );
    notifyListeners();
  }

// get variants
  GetVariantModel? variantModel;
  bool isVariantLoading = false;
  Future<void> getVariant({
    required BuildContext context,
    required int typeId,
    required int brandId,
    required int modelId,
  }) async {
    isVariantLoading = true;
    notifyListeners();
    try {
      variantModel =
          await GetVariantService.getVariantData(typeId, brandId, modelId);
    } catch (e) {
      showSnackBar(
          context, "Failed to load brand data. Please try again later.");
    } finally {
      isVariantLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  BodyType? selectedTransmission;
  changeTransmission(BodyType? transmission) {
    selectedTransmission = transmission;
    notifyListeners();
  }

  BodyType? selectedFuel;
  BodyType? selectedBodyType;
  BodyType? selectedVariant;
  String? selectedYear;

  // add requirement
  addRequirement(BuildContext context, int typeId) async {
    if (selectedBrand == null) {
      showSnackBar(context, "Please select a brand");
      return;
    }
    if (selectedModel == null) {
      showSnackBar(context, "Please select a model");

      return;
    }
    if (selectedVariant == null) {
      showSnackBar(context, "Please select a variant");

      return;
    }
    if (selectedTransmission == null) {
      showSnackBar(context, "Please select a transmission");

      return;
    }
    if (selectedFuel == null) {
      showSnackBar(context, "Please select a fuel type");

      return;
    }
    if (selectedBodyType == null) {
      showSnackBar(context, "Please select a body type");

      return;
    }
    if (selectedYear == null || selectedYear!.isEmpty) {
      showSnackBar(context, "Please select a valid year");

      return;
    }

    int year = int.parse(selectedYear!);

    var response = await AddRequirementService.addRequirement(
      typeId: typeId,
      brandId: selectedBrand!.id!,
      modelId: selectedModel!.id!,
      variantId: selectedVariant!.id!,
      transmissionId: selectedTransmission!.id!,
      fuelId: selectedFuel!.id!,
      colorId: selectedBodyType!.id!,
      year: year,
    );

    if (response["status"] == true) {
      showSnackBar(context, response["message"],
          backgroundColor: AppColors.primary);
      Navigator.pop(context);
      brandModel = null;
      variantModel = null;
    } else {
      showSnackBar(context, response["message"]);
    }
  }
}
