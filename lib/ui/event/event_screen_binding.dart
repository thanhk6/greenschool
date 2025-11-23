import 'package:get/get.dart';
import 'package:green_school/remote/repository/app_repository.dart';
import 'package:green_school/remote/repository/app_repository_impl.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';

class EventScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppRepositoryImpl>(AppRepositoryImpl());
    Get.put(AuthViewModel(api: Get.find<AppRepository>()));
  }
}
