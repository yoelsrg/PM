import '../../../core/app_export.dart';

/// This class is used in the [recipelist_item_widget] screen.
class RecipelistItemModel {
  RecipelistItemModel({
    this.recipeImage,
    this.recipeName,
    this.recipeDescription,
    this.timeText,
    this.sizeText,
    this.authorImage,
    this.authorName,
    this.id,
  }) {
    recipeImage = recipeImage ?? Rx(ImageConstant.imgRectangle2);
    recipeName = recipeName ?? Rx("Spaghetti Bolognese");
    recipeDescription = recipeDescription ?? Rx("Pasta");
    timeText = timeText ?? Rx("30-45 minutes");
    sizeText = sizeText ?? Rx("Medium");
    authorImage = authorImage ?? Rx(ImageConstant.imgEllipse3);
    authorName = authorName ?? Rx("Miriam belina");
    id = id ?? Rx("");
  }

  Rx<String>? recipeImage;

  Rx<String>? recipeName;

  Rx<String>? recipeDescription;

  Rx<String>? timeText;

  Rx<String>? sizeText;

  Rx<String>? authorImage;

  Rx<String>? authorName;

  Rx<String>? id;
}
