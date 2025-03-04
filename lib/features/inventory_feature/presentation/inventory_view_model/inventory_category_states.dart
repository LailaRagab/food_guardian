import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';

class InventoryCategoryStates {}

class InitialState extends InventoryCategoryStates {}

class LoadingState extends InventoryCategoryStates {}

class AvailableDataState extends InventoryCategoryStates {
  List<CardItemModel> itemsList2;
  AvailableDataState({required this.itemsList2});
}

class EmptyState extends InventoryCategoryStates {}

class ErrorState extends InventoryCategoryStates {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
