import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../core/utils/validators.dart';
import '../bloc/profil_event.dart';

class CreateRelisationScreen extends StatefulWidget {
  const CreateRelisationScreen({super.key});

  @override
  State<CreateRelisationScreen> createState() => _CreateRelisationScreenState();
}

class _CreateRelisationScreenState extends State<CreateRelisationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  XFile? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  /// Fonction pour sélectionner une images
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  ImageProvider imageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path); // Image en ligne
    } else {
      return FileImage(File(path)); // Image locale
    }
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = namecontroler.text;
      final description = descriptionController.text;
      final date = dateController.text;
      BlocProvider.of<ProfilBloc>(context).add(
        ProfilRealisationEvent(
          name,
          description,
          date,
          0,
          File(_selectedImage!.path),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Ajouter une réalisation", context),
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
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Card(
              margin: EdgeInsets.only(left: 5, right: 5, top: 20),
              child: Padding(
                padding: AppSizes.spaceHV,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    normalTextApp("Titre", context),
                    inputForm("", namecontroler, Validators.validateInput,
                        type: TextInputType.name),
                    SizedBox(height: 15),
                    normalTextApp("Date de réalisation", context),
                    inputForm("", dateController, Validators.validateInput,
                        type: TextInputType.datetime),
                    SizedBox(height: 15),
                    normalTextApp("Description", context),
                    inputForm(
                        "", descriptionController, Validators.validateInput,
                        type: TextInputType.text, length: 255, lines: 4),
                    SizedBox(height: 15),
                    ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: Icon(EvaIcons.camera),
                      label: normalTextApp("Ajouter une images", context),
                    ),
                    SizedBox(height: 10),
                      _selectedImage == null
                          ? normalTextApp(
                              "Aucune image sélectionnée", context)
                          : Wrap(
                              spacing: 10,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                        image: imageProvider(_selectedImage!.path),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                    
                    SizedBox(height: 30),
                    mainButtonApp(context, submitForm, "Modifier")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
