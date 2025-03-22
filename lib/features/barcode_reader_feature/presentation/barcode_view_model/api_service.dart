import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_guardian/core/widgets/snack_bar.dart';
import '../../../../core/utils/assets/colors.dart';
import '../../../inventory_feature/presentation/inventory_view/inventory_widgets/custom_add_manually_bottom_sheet.dart';
import '../../../inventory_feature/presentation/inventory_view_model/write_on_firestore_logic.dart';

class APIService {
  static String base = "https://world.openfoodfacts.net/api/v2";

  static Future fetchItemFromAPIs(BuildContext context, String barcode,
      DateTime selectedExpirationDate) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get("$base/product/${barcode}");
      Map<String, dynamic> dataField = response.data;
      if (dataField["product"] == null) {
        print(
            "helloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
        // Product not found
        if (context.mounted) {
          snackBar(
              context,
              'Product not found. Would you like to add with yourself?',
              SnackBarAction(
                  label: "Add",
                  onPressed: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      backgroundColor: AppColors.kTransparent,
                      context: context,
                      builder: (context) {
                        return CustomAddManuallyBottomSheet();
                      },
                    );
                  }));
        }
        return;
      }
      final data = dataField["product"];
      String? name = data["product_name"];
      String? quantity = data["quantity"];
      var image = data["image_front_small_url"];

      if (name == null || quantity == null) {
        if (context.mounted) {
          snackBar(
              context,
              "Incomplete product data. Edit product to complete it manually.",
              null);
          return;
        }
      }

      WriteOnFireStoreLogic.buildAddItemsToFirestore(context, "Fridge", name,
          quantity, selectedExpirationDate, image, barcode);
    } on DioException catch (ex) {
      final String badResponse =
          ex.response?.data?["error"] ?? "Oops, there's an error!";
      if (context.mounted) {
        snackBar(context, badResponse, null);
      }
    } catch (e) {
      if (context.mounted) {
        snackBar(context, "An unexpected error occurred. Try again.", null);
      }
    }
  }
}
