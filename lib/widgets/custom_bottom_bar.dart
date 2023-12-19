import 'package:flutter/material.dart';
import 'package:yoel_s_application4/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgContrast,
      activeIcon: ImageConstant.imgContrast,
      type: BottomBarEnum.Contrast,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlus,
      activeIcon: ImageConstant.imgPlus,
      type: BottomBarEnum.Plus,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgMegaphoneBlueGray900,
      activeIcon: ImageConstant.imgMegaphoneBlueGray900,
      type: BottomBarEnum.Megaphonebluegray900,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Container(
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder10,
                ),
                child: CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  color: appTheme.gray900,
                  margin: EdgeInsets.symmetric(vertical: 10.v),
                ),
              ),
              activeIcon: Container(
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder10,
                ),
                child: CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  color: appTheme.blueGray900,
                  margin: EdgeInsets.symmetric(vertical: 10.v),
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Contrast,
  Plus,
  Megaphonebluegray900,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
