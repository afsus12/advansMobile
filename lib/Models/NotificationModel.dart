class NotificationModel {
  final String title;
  final String subtitle;
  final String date;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    DateTime? createdAt = DateTime.tryParse(json['created_at'] ?? '');
    String formattedDate = createdAt != null
        ? '${createdAt.year}-${createdAt.month}-${createdAt.day}'
        : '';

    return NotificationModel(
      title: formattedDate,
      subtitle: json['message_description'] ?? '',
      date: json['sender_name'] ?? '',
    );
  }
}
