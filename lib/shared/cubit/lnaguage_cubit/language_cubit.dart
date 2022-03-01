import 'dart:io';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/constants.dart';
import '../../network/local/cache_helper.dart';
import 'language_state.dart';
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  static LanguageCubit get(context) => BlocProvider.of(context);

  Locale localeApp = Locale(CacheHelper.getData(key: 'lang') ??
      Platform.localeName.substring(0, 2));

  void changeLocaleApp(String languageCode) async{
    if (localeApp.countryCode != languageCode) {
      Constants.lang = languageCode;
      localeApp = Locale(languageCode);
      await CacheHelper.saveData(key: 'lang', value: languageCode);
    }
    emit(ChangeLanguageState());
  }

}
