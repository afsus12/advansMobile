import 'package:advans_app/Data/Repository/ClientRepaymentMilestonesRepository.dart';
import 'package:advans_app/Models/PayMilestoneDTO.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RepaymentMilestonesController extends GetxController {
  final RepaymentMilestonesRepository repaymentMilestonesRepository;
  RepaymentMilestonesController({required this.repaymentMilestonesRepository});
  final box = GetStorage();
  var name = "".obs;
  var lname = "".obs;
  var isVisible = false.obs;
  var userId = 0.obs;
  var loading = false.obs;
  var currentPage = 0.obs;
  var pageSize = 5.obs;
  var totalpages = 0.obs;
  var userCode = 0.obs;
  String status = '';
  var milestones = [].obs;
  @override
  void onInit() {
    final arguments = Get.arguments;
    final loanId = arguments['loanId'] as int;
    userCode.value = box.read("USERCODE");

    userId.value = loanId;
    fetchLoanApplications(loanId);
    super.onInit();
  }

  void loadNextPage() {
    if (currentPage.value <= totalpages.value - 1) {
      currentPage.value += 1;
      fetchLoanApplications(userId.value);
    }
  }

  void loadPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value -= 1;
      fetchLoanApplications(userId.value);
    }
  }

  void fetchLoanApplications(int id) async {
    loading.value = true;
    try {
      final response = await repaymentMilestonesRepository
          .getRepaymentMilestones(id, currentPage.value, pageSize.value);
      if (response.statusCode == 200) {
        totalpages.value = response.body['totalPages'] as int;
        milestones.value = [];
        milestones.addAll(response.body['content']);
        update();
        print(currentPage.value);
      } else {
        Get.snackbar('Error', 'Failed to load applications  ');
      }
    } finally {
      loading(false);
    }
  }

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> payMilestone(int id, PayMilestoneDTO request) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      await repaymentMilestonesRepository.payMilestone(id, request);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
