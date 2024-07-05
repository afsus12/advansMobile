import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Models/NotificationModel.dart';
import 'package:get/get.dart';

class ClientNotificationRepository extends GetxService {
  final ApiClient apiClient;

  ClientNotificationRepository({required this.apiClient});

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await apiClient
          .getData('/api/Notification/ShowNotificationsByReceptientId');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.body;
        List<NotificationModel> notifications = responseData
            .map((data) => NotificationModel.fromJson(data))
            .toList();
        return notifications;
      } else {
        throw Exception(
            'Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }
}
