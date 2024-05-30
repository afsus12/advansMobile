import 'package:advans_app/bloc/landing/landing_event.dart';
import 'package:advans_app/bloc/landing/landing_state.dart';
import 'package:bloc/bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(const LanguageState('en', 'assets/images/united-kingdom.png')) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageState(
          event.languageCode, getImagePathForLanguage(event.languageCode)));
    });
  }
}

String getImagePathForLanguage(String languageCode) {
  switch (languageCode) {
    case 'fr':
      return 'assets/images/france.png';
    case 'ar':
      return 'assets/images/tunisia.png';
    case 'en':
    default:
      return 'assets/images/united-kingdom.png';
  }
}
