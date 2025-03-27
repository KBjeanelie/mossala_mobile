// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mossala_mobile/features/offers/presentation/widgets/card_project_detail.dart';

import '../widgets/appbar_offer_detail.dart';

class SingleOfferScreen extends StatelessWidget {
  final int projectId;
  const SingleOfferScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOfferDetail(projectId: projectId.toString(), curentUserId: 2,),
      body: Column(
        children: [
          CardProjectDetail(currentUserId: 1, projectId: projectId,),
          SizedBox(height: 10,),
          //CardAppyOffer(projectId: projectId.toString())
        ],
      ),
    );
  }
}


