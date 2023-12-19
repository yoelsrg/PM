import '../controller/homepage_controller.dart';
import '../models/recipelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:yoel_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class RecipelistItemWidget extends StatelessWidget {
  RecipelistItemWidget(
    this.recipelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecipelistItemModel recipelistItemModelObj;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: 200.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: recipelistItemModelObj.recipeImage!.value,
              height: 120.v,
              width: 200.h,
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Obx(
              () => Text(
                recipelistItemModelObj.recipeName!.value,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Obx(
              () => Text(
                recipelistItemModelObj.recipeDescription!.value,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgClock,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Obx(
                    () => Text(
                      recipelistItemModelObj.timeText!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMaximize,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Obx(
                    () => Text(
                      recipelistItemModelObj.sizeText!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Row(
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: recipelistItemModelObj.authorImage!.value,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Obx(
                    () => Text(
                      recipelistItemModelObj.authorName!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 11.v),
        ],
      ),
    );
  }
}
