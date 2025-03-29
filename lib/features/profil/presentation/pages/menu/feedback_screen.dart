import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_event.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/utils/validators.dart';


class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controler = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final profilBloc = BlocProvider.of<ProfilBloc>(context);
      profilBloc.add(FeedBackSendEvent(controler.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Feedback", context),
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

          if (state is FeedbackSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: normalTextApp("Merci de votre feedback, nous l'avons bien pris en compte.", context), backgroundColor: AppColors.open,),
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
                  "Vous avez des remarques ? Merci de nous laisser un retour sur l'utilisation de l'application",
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
