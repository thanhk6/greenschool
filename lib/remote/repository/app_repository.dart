import 'package:green_school/remote/model/ai/ai_model.dart';
import 'package:green_school/remote/model/bin/bin_model.dart';
import 'package:green_school/remote/model/collection/collection_model.dart';
import 'package:green_school/remote/model/delete_acc/delete_model.dart';
import 'package:green_school/remote/model/event/event_create_model.dart';
import 'package:green_school/remote/model/event/event_model.dart';
import 'package:green_school/remote/model/forgot_password/forgot_password_model.dart';
import 'package:green_school/remote/model/forgot_password/reset_password_model.dart';
import 'package:green_school/remote/model/info/info_model.dart';
import 'package:green_school/remote/model/login/login_model.dart';
import 'package:green_school/remote/model/login/user_login_model.dart';
import 'package:green_school/remote/model/redemption/redemption_model.dart';
import 'package:green_school/remote/model/redemption_history/r_history.dart';
import 'package:green_school/remote/model/register/create_user_model.dart';
import 'package:green_school/remote/model/register/register_model.dart';
import 'package:green_school/remote/model/reward/reward_model.dart';
import 'package:green_school/remote/response/api_response.dart';

abstract class AppRepository {
  Future<ApiResponse<LoginModel>> userLogin(UserLoginModel model);
  Future<ApiResponse<RegisterModel>> userRegister(CreateUserModel model);
  Future<ApiResponse<BinModel>> getBinInfo(String binId);
  Future<ApiResponse<EventResult>> createEvent(EventCreateModel model);
  Future<ApiResponse<CollectionModel>> getCollection();
  Future<ApiResponse<InfoModel>> getInfo();
  Future<ApiResponse<RewardModel>> getRewards();
  Future<ApiResponse<RedemptionModel>> postRedemtion(
    Map<String, dynamic> redemption,
  );
  Future<ApiResponse<RedemptionHistoryModel>> getRewardHistory();
  Future<ApiResponse<ForgotPasswordModel>> forgotPassword({
    required String email,
  });
  Future<ApiResponse<ResetPasswordModel>> resetPassword({
    required String token,
    required String newPassword,
  });
  Future<ApiResponse<DeleteModel>> deleteAccount({required String password});
  Future<ApiResponse<AiModel>> analyzeImage({
    required String imageBase64,
    required int wasteTypeID,
  });
}
