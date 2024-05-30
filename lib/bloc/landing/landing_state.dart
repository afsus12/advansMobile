import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final String languageCode;
  final String imagePath;

  const LanguageState(this.languageCode, this.imagePath);

  @override
  List<Object> get props => [languageCode, imagePath];
}
