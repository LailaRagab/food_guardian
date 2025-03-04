import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card.dart';

import '../../../models/card_itme_model.dart';

class FridgeCategory extends StatelessWidget {
  FridgeCategory({super.key});
  CollectionReference inventoryCollection = FirebaseFirestore.instance
      .collection(CardItemModel.collectionName)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Fridge");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: inventoryCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CardItemModel> itemsList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              itemsList.add(CardItemModel.fromJson(snapshot.data!.docs[i]));
            }
            return Column(children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: itemsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                        itemID: '',
                        onDelete: () {},
                        passedModel: itemsList[index],
                      );
                    }),
              ),
            ]);
          } else {
            return Text("loading");
          }
        });
  }
}
