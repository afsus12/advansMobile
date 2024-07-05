class Category {
  final String title;
  final String description1;
  final String description2;
  final String detailScreenTitle;
  final String detailScreenDetails;
  final String detailedDescription;
  final String eligibilityTitle;
  final List<String> eligibilityCriteria;
  final String conditionsTitle;
  final List<String> conditions;
  final List<String>? subscriptionSteps;

  Category({
    required this.title,
    required this.description1,
    required this.description2,
    required this.detailScreenTitle,
    required this.detailScreenDetails,
    required this.detailedDescription,
    required this.eligibilityTitle,
    required this.eligibilityCriteria,
    required this.conditionsTitle,
    required this.conditions,
    this.subscriptionSteps,
  });
}
