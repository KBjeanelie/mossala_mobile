import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_event.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_state.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../widgets/widgets.dart';

class WarningScreen extends StatefulWidget {
  const WarningScreen({super.key});

  @override
  State<WarningScreen> createState() => _WarningScreenState();
}

class _WarningScreenState extends State<WarningScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controler = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final profilBloc = BlocProvider.of<ProfilBloc>(context);
      profilBloc.add(WarningSendEvent(controler.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Signaler un problème", context),
      ),
      body: BlocListener<ProfilBloc, ProfilState>(
        listener: (context, state) {
          if (state is ProfilLoading) {
            CircularProgressIndicator();
          }
          if (state is ProfilError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: normalTextApp(state.message, context), backgroundColor: AppColors.closed,),
            );
          }

          if (state is WarningSent) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: normalTextApp("Votre problème a été signalé avec succès", context), backgroundColor: AppColors.open,),
              );
            controler.clear();
          }
        },
        child: SingleChildScrollView(
          padding: AppSizes.spaceHV,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(child: Image.asset("assets/logo.png")),
                normalTextApp(
                  "Vous avez rencontré un problème ? Un beug trouvé ? \nDécrivez le problème rencontré et nos developpeur se chargerons du reste !",
                  context,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 870,
                  maxLines: 20,
                  minLines: 2,
                  controller: controler,
                  keyboardType: TextInputType.text,
                  cursorWidth: 1,
                  validator: Validators.validateInput,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.secondary, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.secondary, width: 2)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 192, 27, 27),
                              width: 2)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 192, 27, 27),
                              width: 2))),
                ),
                SizedBox(height: 20),
                Center(child: buttonApp(context, submitForm, 'Envoyer'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
