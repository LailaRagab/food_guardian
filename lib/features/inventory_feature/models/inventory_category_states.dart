import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';

class InventoryCategoryStates {}

class InitialState extends InventoryCategoryStates {}

class InventoryLoadingState extends InventoryCategoryStates {}

class InventoryAvailableDataState extends InventoryCategoryStates {
  List<CardItemModel> itemsList2;
  InventoryAvailableDataState({required this.itemsList2});
}

class InventoryEmptyState extends InventoryCategoryStates {}

class InventoryErrorState extends InventoryCategoryStates {
  String errorMessage;
  InventoryErrorState({required this.errorMessage});
}

class InventoryItemDeletedState extends InventoryCategoryStates {}

class InventoryItemFailedToDeletedState extends InventoryCategoryStates {
  String errorMessage;
  InventoryItemFailedToDeletedState({required this.errorMessage});
}

class InventoryItemEditedState extends InventoryCategoryStates {}

class InventoryItemFailedToEditState extends InventoryCategoryStates {
  String errorMessage;
  InventoryItemFailedToEditState({required this.errorMessage});
}
