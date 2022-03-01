import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../models/enums/enums.dart';
import '../../components/services/app_services.dart';

part 'media_services_state.dart';

class MediaServicesCubit extends Cubit<MediaServicesState> {
  MediaServicesCubit() : super(MediaServicesInitial());

  static MediaServicesCubit get(context) => BlocProvider.of(context);

  /// Images And Media
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;
  String? imageName;

  Future<void> getImage(ImageSource src) async {
    final pickedFile = await imagePicker.pickImage(source: src);
    imageFile = null;
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      imageName = imageFile!.path.split('/').last;
      emit(GetImageSuccessState());
    } else {
      AppServices.showToast(state: ToastStates.warning, msg: 'No Image Selected ...');
      emit(NoGetImageState());
    }
  }

  void removeImage() {
    imageFile = null;
    imageName = null;
    emit(MediaChangeState());
  }
}
