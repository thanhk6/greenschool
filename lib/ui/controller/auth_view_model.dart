import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_school/remote/model/bin/bin_model.dart';
import 'package:green_school/remote/model/collection/collection_model.dart';
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
import 'package:green_school/remote/repository/app_repository.dart';
import 'package:green_school/remote/response/api_response.dart';

class AuthViewModel extends GetxController {
  final AppRepository _api;

  AuthViewModel({required AppRepository api}) : _api = api;

  Rx<ApiResponse<LoginModel>> loginResponse =
      const ApiResponse<LoginModel>.loading().obs;
  Rx<ApiResponse<RegisterModel>> registerResponse =
      const ApiResponse<RegisterModel>.loading().obs;
  Rx<ApiResponse<BinModel>> binResponse =
      const ApiResponse<BinModel>.loading().obs;
  Rx<ApiResponse<EventResult>> eventResponse =
      const ApiResponse<EventResult>.loading().obs;
  Rx<ApiResponse<CollectionModel>> collectionResponse =
      const ApiResponse<CollectionModel>.loading().obs;
  Rx<ApiResponse<InfoModel>> infoResponse =
      const ApiResponse<InfoModel>.loading().obs;
  Rx<ApiResponse<RewardModel>> rewardsResponse =
      const ApiResponse<RewardModel>.loading().obs;
  Rx<ApiResponse<RedemptionModel>> redemptionResponse =
      const ApiResponse<RedemptionModel>.loading().obs;
  Rx<ApiResponse<RedemptionHistoryModel>> rewardHistoryResponse =
      const ApiResponse<RedemptionHistoryModel>.loading().obs;
  Rx<ApiResponse<ForgotPasswordModel>> forgotPasswordResponse =
      const ApiResponse<ForgotPasswordModel>.loading().obs;
  Rx<ApiResponse<ResetPasswordModel>> resetPasswordResponse =
      const ApiResponse<ResetPasswordModel>.loading().obs;

  Future<void> login({required UserLoginModel model}) async {
    loginResponse.value = ApiResponse.loading();

    ApiResponse<LoginModel> result = await _api.userLogin(model);

    result.when(
      loading: () {
        loginResponse.value = const ApiResponse.loading();
      },
      success: (loginRes) {
        debugPrint("LOGIN SUCCESS: ${loginRes.data}");
        loginResponse.value = ApiResponse.success(data: loginRes);
      },
      error: (message) {
        debugPrint("ERROR: $message");
        loginResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> register({required CreateUserModel model}) async {
    registerResponse.value = ApiResponse.loading();

    ApiResponse<RegisterModel> result = await _api.userRegister(model);

    result.when(
      loading: () {
        registerResponse.value = const ApiResponse.loading();
      },
      success: (registRes) {
        registerResponse.value = ApiResponse.success(data: registRes);
      },
      error: (message) {
        registerResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> getBinData({required String binId}) async {
    binResponse.value = ApiResponse.loading();

    ApiResponse<BinModel> result = await _api.getBinInfo(binId);

    result.when(
      loading: () {
        binResponse.value = ApiResponse.loading();
      },
      success: (binRes) {
        binResponse.value = ApiResponse.success(data: binRes);
      },
      error: (message) {
        binResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> createEvent({required EventCreateModel model}) async {
    eventResponse.value = ApiResponse.loading();

    ApiResponse<EventResult> result = await _api.createEvent(model);

    result.when(
      loading: () {
        eventResponse.value = ApiResponse.loading();
      },
      success: (eventRes) {
        eventResponse.value = ApiResponse.success(data: eventRes);
      },
      error: (message) {
        eventResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> getCollection() async {
    collectionResponse.value = ApiResponse.loading();

    ApiResponse<CollectionModel> result = await _api.getCollection();

    result.when(
      loading: () {
        collectionResponse.value = ApiResponse.loading();
      },
      success: (data) {
        collectionResponse.value = ApiResponse.success(data: data);
      },
      error: (message) {
        collectionResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> getInfo() async {
    infoResponse.value = ApiResponse.loading();

    ApiResponse<InfoModel> result = await _api.getInfo();

    result.when(
      loading: () {
        infoResponse.value = ApiResponse.loading();
      },
      success: (data) {
        infoResponse.value = ApiResponse.success(data: data);
      },
      error: (message) {
        infoResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> getRewards() async {
    rewardsResponse.value = ApiResponse.loading();

    ApiResponse<RewardModel> result = await _api.getRewards();

    result.when(
      loading: () {
        rewardsResponse.value = ApiResponse.loading();
      },
      success: (data) {
        rewardsResponse.value = ApiResponse.success(data: data);
      },
      error: (message) {
        rewardsResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> postRedemption(int id) async {
    redemptionResponse.value = ApiResponse.loading();

    ApiResponse<RedemptionModel> result = await _api.postRedemtion(
      <String, dynamic>{'rewardId': id, 'quantity': 1},
    );

    result.when(
      loading: () {
        redemptionResponse.value = ApiResponse.loading();
      },
      success: (data) {
        redemptionResponse.value = ApiResponse.success(data: data);
      },
      error: (message) {
        redemptionResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> getRewardHistory() async {
    rewardHistoryResponse.value = ApiResponse.loading();

    ApiResponse<RedemptionHistoryModel> result = await _api.getRewardHistory();

    result.when(
      loading: () {
        rewardHistoryResponse.value = ApiResponse.loading();
      },
      success: (data) {
        rewardHistoryResponse.value = ApiResponse.success(data: data);
      },
      error: (message) {
        rewardHistoryResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> forgotPassword({required String email, required String newPassword}) async {
    forgotPasswordResponse.value = ApiResponse.loading();

    ApiResponse<ForgotPasswordModel> result = await _api.forgotPassword(
      email: email,
      newPassword: newPassword
    );

    result.when(
      loading: () {
        forgotPasswordResponse.value = ApiResponse.loading();
      },
      success: (data) {
        forgotPasswordResponse.value = ApiResponse.success(data: data);
      },
      error: (error) {
        rewardHistoryResponse.value = ApiResponse.error(message: error);
      },
    );
  }

  Future<void> resetPassword({
    required String code,
    required String newPassword,
  }) async {
    resetPasswordResponse.value = ApiResponse.loading();

    ApiResponse<ResetPasswordModel> result = await _api.resetPassword(
      code: code,
      newPassword: newPassword,
    );
    result.when(
      loading: () {
        resetPasswordResponse.value = ApiResponse.loading();
      },
      success: (data) {
        resetPasswordResponse.value = ApiResponse.success(data: data);
      },
      error: (error) {
        resetPasswordResponse.value = ApiResponse.error(message: error);
      },
    );
  }
}
