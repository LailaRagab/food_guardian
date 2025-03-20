import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../inventory_feature/presentation/inventory_view/inventory_widgets/custom_show_my_date_picker_widget.dart';
import '../../../inventory_feature/presentation/inventory_view_model/write_on_firestore_logic.dart';

class APIService {
  static String base = "https://world.openfoodfacts.net/api/v2";

  static Future fetchItemFromAPIs(BuildContext context, String barcode,
      DateTime selectedExpirationDate) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get("$base/product/${barcode}");
      Map<String, dynamic> dataField = response.data;
      final data = dataField["product"];
      String name = data["product_name"];
      String quantity = data["quantity"];
      var image = NetworkImage(data["image_front_small_url"]).url;
      WriteOnFireStoreLogic.buildAddItemsToFirestore(context, "Fridge", name,
          quantity, selectedExpirationDate, null, barcode, image);
    } on DioException catch (ex) {
      final String badResponse =
          ex.response?.data['error']['message'] ?? "oops there 's an error !";
      return throw Exception(badResponse);
    } on Exception catch (e) {}
  }
}
