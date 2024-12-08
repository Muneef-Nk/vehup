import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/leading_button.dart';
import 'package:vehup/core/global/loading.dart';
import 'package:vehup/features/requirement/controller/requirement_controller.dart';
import 'package:vehup/features/requirement/model/brand_model.dart';
import 'package:vehup/features/requirement/model/get_variant_model.dart';
import 'package:vehup/features/requirement/model/model_data_model.dart';

class CreateRequirement extends StatefulWidget {
  final int vehicleTypeId;
  CreateRequirement({super.key, required this.vehicleTypeId});

  @override
  State<CreateRequirement> createState() => _CreateRequirementState();
}

class _CreateRequirementState extends State<CreateRequirement> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RequirementController>(context, listen: false)
          .getBrand(context: context, typeId: widget.vehicleTypeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const LeadingButton(),
        surfaceTintColor: AppColors.white,
        title: const Text(
          "Vehicle Requirement",
          style: TextStyle(fontSize: 16, color: AppColors.black),
        ),
      ),
      body: Consumer<RequirementController>(builder: (context, provider, _) {
        return provider.isLoading
            ? Center(child: Loading())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Requred(
                              text: "Brand",
                            ),
                            DropdownButtonFormField<Brand>(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                              hint: Text(
                                'Select Brand',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                              ),
                              value: provider.selectedBrand,
                              items: [
                                DropdownMenuItem<Brand>(
                                  value: null,
                                  child: Text(
                                    "None",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ...(provider.brandModel?.data?.brands
                                        ?.map<DropdownMenuItem<Brand>>((brand) {
                                      return DropdownMenuItem<Brand>(
                                        value: brand,
                                        child: Text(
                                          brand.name.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList() ??
                                    []),
                              ],
                              onChanged: (Brand? brand) {
                                provider.changeBrand(
                                    brand: brand,
                                    ctx: context,
                                    typeId: widget.vehicleTypeId);
                              },
                            )
                          ],
                        ),
                      ),
                      provider.isModelLoading
                          ? ShimmerLoading()
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Requred(
                                    text: "Model",
                                  ),
                                  DropdownButtonFormField<Model>(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 19, vertical: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    hint: Text(
                                      'Select Model',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                    ),
                                    value: provider.selectedModel,
                                    items: [
                                      DropdownMenuItem<Model>(
                                        value: null,
                                        child: Text(
                                          "None",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      ...(provider.dataModel?.data
                                              ?.map<DropdownMenuItem<Model>>(
                                                  (model) {
                                            return DropdownMenuItem<Model>(
                                              value: model,
                                              child: Text(
                                                model.name.toString(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList() ??
                                          []),
                                    ],
                                    onChanged: (Model? model) {
                                      if (model != null) {
                                        provider.changeModel(
                                          context: context,
                                          typeId: widget.vehicleTypeId,
                                          model: model,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                      provider.isVariantLoading
                          ? ShimmerLoading()
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Requred(
                                    text: "Variant",
                                  ),
                                  DropdownButtonFormField<BodyType>(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 19, vertical: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    hint: Text(
                                      'Select variant',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                    ),
                                    value: provider.selectedVariant,
                                    items: [
                                      DropdownMenuItem<BodyType>(
                                        value: null,
                                        child: Text(
                                          "None",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      ...(provider.variantModel?.data?.variant
                                              ?.map<DropdownMenuItem<BodyType>>(
                                                  (variant) {
                                            return DropdownMenuItem<BodyType>(
                                              value: variant,
                                              child: Text(
                                                variant.name.toString(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList() ??
                                          []),
                                    ],
                                    onChanged: (BodyType? variant) {
                                      if (variant != null) {
                                        provider.selectedVariant = variant;
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Requred(
                              text: "Year",
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                              hint: Text(
                                'Select year',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                              ),
                              value: provider.selectedYear,
                              items: List.generate(
                                2040 - 1900 + 1,
                                (index) {
                                  final year = (1900 + index);
                                  return DropdownMenuItem<String>(
                                    value: year.toString(),
                                    child: Text(
                                      year.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                },
                              ),
                              onChanged: (String? year) {
                                if (year != null) {
                                  provider.selectedYear = year;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Requred(text: 'Transmission'),
                      provider.isVariantLoading
                          ? TransmissionLoading()
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  if (provider
                                          .variantModel?.data?.transmissions !=
                                      null)
                                    ...provider
                                            .variantModel?.data!.transmissions!
                                            .map((transmission) {
                                          return Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  provider.changeTransmission(
                                                      transmission);
                                                });
                                              },
                                              child: Container(
                                                height: 60,
                                                margin:
                                                    EdgeInsets.only(right: 16),
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: provider
                                                                .selectedTransmission
                                                                ?.name ==
                                                            transmission.name
                                                        ? AppColors.primary
                                                        : Colors.transparent,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    transmission.name ?? '',
                                                    style: TextStyle(
                                                      color: provider
                                                                  .selectedTransmission
                                                                  ?.name ==
                                                              transmission
                                                          ? AppColors.primary
                                                          : Colors.black,
                                                      fontWeight: provider
                                                                  .selectedTransmission
                                                                  ?.name ==
                                                              transmission
                                                          ? FontWeight.bold
                                                          : FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList() ??
                                        [],
                                ],
                              ),
                            ),
                      provider.isVariantLoading
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              child: ShimmerLoading(),
                            )
                          : fuelDropDown(provider),
                      provider.isVariantLoading
                          ? ShimmerLoading()
                          : bodyTypeDropdown(provider),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          provider.addRequirement(
                              context, widget.vehicleTypeId);
                        },
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.only(bottom: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary,
                          ),
                          child: Center(
                              child: Text(
                            "Submit",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }

  Padding bodyTypeDropdown(RequirementController provider) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Requred(
            text: "Body type",
          ),
          DropdownButtonFormField<BodyType>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
            hint: Text(
              'Select body type',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            value: provider.selectedBodyType,
            items: [
              DropdownMenuItem<BodyType>(
                value: null,
                child: Text(
                  "None",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...(provider.variantModel?.data?.bodyTypes
                      ?.map<DropdownMenuItem<BodyType>>((model) {
                    return DropdownMenuItem<BodyType>(
                      value: model,
                      child: Text(
                        model.name.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList() ??
                  []),
            ],
            onChanged: (BodyType? bodyTpe) {
              if (bodyTpe != null) {
                provider.selectedBodyType = bodyTpe;
              }
            },
          )
        ],
      ),
    );
  }

  Padding fuelDropDown(RequirementController provider) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Requred(
            text: "Fuel",
          ),
          DropdownButtonFormField<BodyType>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
            hint: Text(
              'Select fuel',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            value: provider.selectedFuel,
            items: provider.variantModel?.data?.fuelTypes
                ?.map<DropdownMenuItem<BodyType>>((model) {
              return DropdownMenuItem<BodyType>(
                value: model,
                child: Text(
                  model.name.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (BodyType? fuel) {
              if (fuel != null) {
                provider.selectedFuel = fuel;
              }
            },
          )
        ],
      ),
    );
  }
}

class TransmissionLoading extends StatelessWidget {
  const TransmissionLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        2,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class Requred extends StatelessWidget {
  final String text;
  const Requred({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            "$text",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            " *",
            style: TextStyle(
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
