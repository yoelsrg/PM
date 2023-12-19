import '../homepage_page/widgets/informationlist_item_widget.dart';
import '../homepage_page/widgets/recipelist_item_widget.dart';
import 'controller/homepage_controller.dart';
import 'models/homepage_model.dart';
import 'models/informationlist_item_model.dart';
import 'models/recipelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:yoel_s_application4/core/app_export.dart';
import 'package:yoel_s_application4/widgets/app_bar/appbar_subtitle.dart';
import 'package:yoel_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:yoel_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:yoel_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:yoel_s_application4/widgets/custom_outlined_button.dart';

class HomepagePage extends StatelessWidget {
  HomepagePage({Key? key})
      : super(
          key: key,
        );

  HomepageController controller =
      Get.put(HomepageController(HomepageModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.h,
                bottom: 24.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBanner(),
                  SizedBox(height: 27.v),
                  Padding(
                    padding: EdgeInsets.only(right: 24.h),
                    child: _buildCreatorHeader(
                      dynamicText: "lbl_popular_recipes".tr,
                      dynamicText1: "lbl_see_all".tr,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  _buildRecipeList(),
                  SizedBox(height: 27.v),
                  Padding(
                    padding: EdgeInsets.only(right: 24.h),
                    child: _buildCreatorHeader(
                      dynamicText: "lbl_popular_creator".tr,
                      dynamicText1: "lbl_see_all".tr,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  _buildInformationList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(
          left: 24.h,
          top: 14.v,
          bottom: 107.v,
        ),
        child: Column(
          children: [
            AppbarTitle(
              text: "Hello, Yoel".tr,
              margin: EdgeInsets.only(right: 66.h),
            ),
            SizedBox(height: 3.v),
            AppbarSubtitle(
              text: "msg_what_do_you_want".tr,
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgLock,
          margin: EdgeInsets.fromLTRB(24.h, 21.v, 24.h, 115.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.only(right: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_recipes_recomendation".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 1.v),
                  SizedBox(
                    width: 176.h,
                    child: Text(
                      "msg_get_your_personalized".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.40,
                      ),
                    ),
                  ),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgEmojionePotOfFood,
                height: 59.adaptSize,
                width: 59.adaptSize,
                margin: EdgeInsets.only(bottom: 2.v),
              ),
            ],
          ),
          SizedBox(height: 17.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  text: "lbl_get_started".tr,
                  margin: EdgeInsets.only(right: 6.h),
                ),
              ),
              Expanded(
                child: CustomOutlinedButton(
                  text: "lbl_skip".tr,
                  margin: EdgeInsets.only(left: 6.h),
                  buttonStyle: CustomButtonStyles.outlineGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecipeList() {
    return SizedBox(
      height: 277.v,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 12.h,
            );
          },
          itemCount:
              controller.homepageModelObj.value.recipelistItemList.value.length,
          itemBuilder: (context, index) {
            RecipelistItemModel model = controller
                .homepageModelObj.value.recipelistItemList.value[index];
            return RecipelistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInformationList() {
    return SizedBox(
      height: 161.v,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 12.h,
            );
          },
          itemCount: controller
              .homepageModelObj.value.informationlistItemList.value.length,
          itemBuilder: (context, index) {
            InformationlistItemModel model = controller
                .homepageModelObj.value.informationlistItemList.value[index];
            return InformationlistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildCreatorHeader({
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            dynamicText,
            style: CustomTextStyles.titleMediumSemiBold.copyWith(
              color: appTheme.gray900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(
            dynamicText1,
            style: CustomTextStyles.titleMediumOrange800.copyWith(
              color: appTheme.orange800,
            ),
          ),
        ),
      ],
    );
  }
}
