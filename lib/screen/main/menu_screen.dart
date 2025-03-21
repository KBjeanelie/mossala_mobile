import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mossala_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../features/auth/presentation/bloc/auth_event.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple("Menu", context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizes.spaceH,
            Card(
              margin: AppSizes.spaceHorizontal,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => context.push("/profil"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/user.jpg"),
                    ),
                    title: mediumTextApp("KUBEMBULA Jean Elie", context),
                    trailing: Icon(EvaIcons.arrowIosForward),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () => context.push('/create_project'),
                    leading: CircleAvatar(
                      child: Icon(EvaIcons.plus),
                    ),
                    title: normalTextApp("Créer un nouveau projet", context),
                    subtitle: smallTextApp("Créer un nouveau projet ou demander un service en toute simplicité",context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: AppSizes.spaceHorizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () => context.push('/realisations'),
                            child: CardMenu(
                              icon: EvaIcons.checkmarkSquare,
                              title: "Réalisations",
                            ))),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.push('/project_create'),
                          child: CardMenu(
                            icon: EvaIcons.edit2,
                            title: "Projets créés",
                          ))),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => context.push('/project_assigned'),
                          child: CardMenu(
                            icon: EvaIcons.award,
                            title: "Projets remportés",
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CardMenu2(
                icon: EvaIcons.bell,
                title: "Notifications",
                function: () => context.push('/notifications')),
            CardMenu2(
                icon: EvaIcons.settings, title: "Paramètres", function: () {}),
            CardMenu2(
                icon: EvaIcons.alertTriangle,
                title: "Signaler un problème",
                function: () => context.push('/warning')),
            CardMenu2(
                icon: EvaIcons.externalLink,
                title: "Envoyer un feedback",
                function: () => context.push('/feedback')),
            CardMenu2(
                icon: EvaIcons.info,
                title: "À propos de nous",
                function: () => context.push('/about')),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                  color: const Color.fromARGB(33, 29, 114, 184)),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedOut) {
                    context.go("/login");
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: normalTextApp(state.message, context))
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  return ListTile(
                    leading: Icon(EvaIcons.logOut, color: AppColors.secondary),
                    title: normalTextApp("Déconnexion", context),
                    onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  const CardMenu({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppColors.secondary,
            ),
            normalTextApp(title, context)
          ],
        ),
      ),
    );
  }
}

class CardMenu2 extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback function;
  const CardMenu2(
      {super.key,
      required this.icon,
      required this.title,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 5, right: 5, top: 3),
      child: ListTile(
        onTap: function,
        leading: Icon(
          icon,
          color: AppColors.secondary,
        ),
        title: normalTextApp(title, context),
      ),
    );
  }
}
