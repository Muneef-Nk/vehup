import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/leading_button.dart';
import 'package:vehup/core/global/loading.dart';
import 'package:vehup/features/requirement/controller/requirement_controller.dart';
import 'package:vehup/features/requirement/view/select_preference.dart';
import 'package:vehup/features/requirement/widgets/requiremnt_container.dart';

class RequirementView extends StatefulWidget {
  const RequirementView({super.key});

  @override
  State<RequirementView> createState() => _RequirementViewState();
}

class _RequirementViewState extends State<RequirementView> {
  @override
  void initState() {
    super.initState();
    Provider.of<RequirementController>(context, listen: false)
        .getRequrementList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        leading: LeadingButton(),
        centerTitle: true,
        title: Text(
          "Requirement  List",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: Consumer<RequirementController>(builder: (context, provider, _) {
        return provider.isLoading
            ? Center(
                child: Loading(),
              )
            : ListView.builder(
                itemCount: provider.requirements?.data?.length,
                itemBuilder: (context, index) {
                  return RequirementContainer(index: index);
                });
      }),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SelectPreference()));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                Text(
                  "Create A Requirement",
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
