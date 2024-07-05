import 'package:advans_app/Data/Repository/TransactionHistoryRepository.dart';
import 'package:advans_app/Models/TransactionModel.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TransactionHistoryController extends GetxController {
  final TransactionHistoryRepository transactionHistoryRepository;
  TransactionHistoryController({required this.transactionHistoryRepository});
  final box = GetStorage();
  var name = "".obs;
  var lname = "".obs;
  var isVisible = false.obs;
  var userId = 0.obs;
  var loading = false.obs;
  var isLoading = true.obs;
  var transactions = <TransactionModel>[].obs;
  var currentPage = 0.obs;
  var pageSize = 5.obs; // Adjust page size as needed
  var totalPage = 0.obs;

  String? transTypeFilter; // Filter by 'in', 'out', or null for all

  @override
  void onInit() {
    userId.value = box.read("USERCODE");
    int id = userId.value;
    fetchTransactions(id);
    super.onInit();
  }

  void fetchTransactions(int id) async {
    isLoading.value = true;
    try {
      final response = await transactionHistoryRepository.getTransactionHistory(
        id, // Replace with user code or ID
        transTypeFilter ?? '', // Adjust as per API requirements
        currentPage.value,
        pageSize.value,
      );
      if (response.statusCode == 200) {
        totalPage.value = response.body['totalPages'];
        final data = response.body['content'] as List;
        transactions.value = data
            .map((e) => TransactionModel.fromJson(e))
            .toList(); // Handle error state
        print('Error fetching transactions: ${response.statusText}');
      } else {
        Get.snackbar('Error', 'Failed to load prospects');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void nextPage() {
    if (currentPage.value < totalPage.value - 1) {
      currentPage.value++;
      fetchTransactions(userId.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      fetchTransactions(userId.value);
    }
  }

  void updateTransTypeFilter(String? type) {
    transTypeFilter = type;
    currentPage.value = 0; // Reset to first page on filter change
    fetchTransactions(userId.value);
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }
}
