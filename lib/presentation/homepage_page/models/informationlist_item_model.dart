import '../../../core/app_export.dart';

/// This class is used in the [informationlist_item_widget] screen.
class InformationlistItemModel {
  InformationlistItemModel({
    this.userImage,
    this.userName,
    this.text1,
    this.text2,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgEllipse432x32);
    userName = userName ?? Rx("James Nikidaw");
    text1 = text1 ?? Rx("124");
    text2 = text2 ?? Rx("41391");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? userName;

  Rx<String>? text1;

  Rx<String>? text2;

  Rx<String>? id;
}
