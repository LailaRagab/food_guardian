import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_guardian/features/barcode_reader_feature/presentation/barcode_view_model/custom_show_snak_bar.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../inventory_feature/presentation/inventory_view_model/write_on_firestore_logic.dart';

class APIService {
  static String base = "https://world.openfoodfacts.net/api/v2";
  static var dio = Constants.dio;
  static Future fetchItemFromAPIs(BuildContext context, String barcode,
      DateTime selectedExpirationDate) async {
    try {
      Response response = await dio.get("$base/product/${barcode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> dataField = response.data;
        final data = dataField["product"];
        String? name = data["product_name"];
        String? quantity = data["quantity"];
        var image = data["image_front_small_url"];

        if (name == null || quantity == null) {
          if (context.mounted) {
            ShowSnackBarHandlingBarcodeReader.snackBarCompleteData(context);
          }
        }
        if (context.mounted) {
          WriteOnFireStoreLogic.buildAddItemsToFirestore(context, "Fridge",
              name, quantity, selectedExpirationDate, image, barcode);
        }
      }
    } on DioException catch (ex) {
      final badResponse = ex.response?.statusMessage;
      if (badResponse == "Not Found") {
        if (context.mounted) {
          ShowSnackBarHandlingBarcodeReader.customSnackBarAction(context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ShowSnackBarHandlingBarcodeReader.snackBarForOtherErrorsTypes(context);
      }
    }
  }
}
