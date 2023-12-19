import '../controller/homepage_controller.dart';
import '../models/informationlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:yoel_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class InformationlistItemWidget extends StatelessWidget {
  InformationlistItemWidget(
    this.informationlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  InformationlistItemModel informationlistItemModelObj;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      width: 160.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: informationlistItemModelObj.userImage!.value,
              height: 32.adaptSize,
              width: 32.adaptSize,
              radius: BorderRadius.circular(
                16.h,
              ),
            ),
          ),
          SizedBox(height: 9.v),
          Obx(
            () => Text(
              informationlistItemModelObj.userName!.value,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 22.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMegaphone,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Obx(
                  () => Text(
                    informationlistItemModelObj.text1!.value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgFavorite,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Obx(
                  () => Text(
                    informationlistItemModelObj.text2!.value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
