// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/features/offers/presentation/widgets/card_appy_offer.dart';
import 'package:mossala_mobile/features/offers/presentation/widgets/card_project_detail.dart';
import 'package:mossala_mobile/widgets/widgets.dart';
import '../../../../core/theme/app_colors.dart';
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
          CardAppyOffer(projectId: projectId.toString())
        ],
      ),
    );
  }
}


