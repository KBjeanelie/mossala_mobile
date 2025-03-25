import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/detail/single_offer_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../core/utils/utils.dart';
import '../features/auth/domain/entities/user_entity.dart';

class WorkerCardView extends StatefulWidget {
  const WorkerCardView({super.key, required this.user});
  final User user;

  @override
  State<WorkerCardView> createState() => _WorkerCardViewState();
}

class _WorkerCardViewState extends State<WorkerCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/user.jpg"),
            ),
            title: mediumTextApp(
              "${widget.user.lastname} ${widget.user.firstname}", context),
            subtitle: Row(
              spacing: 5,
              children: [
                if (widget.user.isActive)...[
                  Icon(Icons.circle, size: 10, color: AppColors.open,),
                  Text("Disponible", style: GoogleFonts.poppins(
                    color: AppColors.open,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),)
                ]else...[
                  Icon(Icons.circle, size: 10, color: AppColors.closed,),
                  Text("Indisponible", style: GoogleFonts.poppins(
                    color: AppColors.closed,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),)
                ]
              ],
            ),
          ),
          Container(
            margin: AppSizes.spaceHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                normalTextApp("Salut, je suis un prestataire sur Mosala et je suis disponible à l'instant si tu as besoin de mes services. \nMerci!", context),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < widget.user.competence.length; i++)
                      BadgeApp(i: i),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Icon(EvaIcons.checkmarkSquare2, size: 20, color: AppColors.secondary,),
                          Expanded(child: smallTextApp("64 projets réalisés", context))
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Icon(EvaIcons.pin, size: 20, color: AppColors.secondary,),
                          Expanded(child: smallTextApp("Mfilou", context))
                        ],
                      ),
                    ),
                  ],
                ),
                mainButtonApp(context, (){
                  context.push('/worker/${widget.user.id}');
                }, "Voir le profil")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BadgeApp extends StatelessWidget {
  const BadgeApp({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: AppColors.lightBorder,
      padding: EdgeInsets.all(5),
      label: Text("Metier ${i+1}", style: GoogleFonts.poppins(
        fontSize: 12,
        color: AppColors.lightText,
      ),),
    );
  }
}



class CardOfferView extends StatefulWidget {
  final ProjectEntity offer;
  const CardOfferView({super.key, required this.offer});

  @override
  State<CardOfferView> createState() => _CardOfferViewState();
}

class _CardOfferViewState extends State<CardOfferView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mediumTextApp(widget.offer.name, context),
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(EvaIcons.creditCard, color: AppColors.secondary,),
                      Expanded(child: normalTextApp("${widget.offer.amount.toString()}F CFA", context))
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Icon(EvaIcons.pin,color: AppColors.secondary,),
                      Expanded(child: normalTextApp(widget.offer.address, context))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.circle, size: 15, color: AppColors.open,),
                    normalTextApp("Ouvert", context)
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            normalTextApp("6 dévis envoyés", context),
            SizedBox(height: 20),
            normalTextApp(widget.offer.description.length > 150
              ? widget.offer.description.substring(0, 150)
              : widget.offer.description, context),
            SizedBox(height: 10),
            if (widget.offer.images != null && widget.offer.images.isNotEmpty)
              Wrap(
                children: [
                  SizedBox(
                    child: Image.network(
                      widget.offer.images[0]['image'],
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(EvaIcons.briefcase,color: AppColors.secondary,),
                      Expanded(child: normalTextApp("Charpentier, Plafonier", context))
                    ],
                  ),
                ),
                Flexible(child: smallTextApp(timeAgo(widget.offer.createdAt.toString()), context))
              ],
            ),
            SizedBox(height: 20),
            mainButtonApp(context, (){
              context.push('/project/${widget.offer.id}');
            }, "Voir l'offre")
          ],
        ),
      ),
    );
  }
}