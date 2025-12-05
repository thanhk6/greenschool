import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/remote/api/api_endpoints.dart';
import 'package:green_school/remote/api/http_manager.dart';
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
import 'package:green_school/remote/repository/app_repository.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/utils/app_const.dart';

class AppRepositoryImpl implements AppRepository {
  final _httpManager = HttpManager();
  final box = GetStorage();

  @override
  Future<ApiResponse<LoginModel>> userLogin(UserLoginModel model) async {
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().postLogin,
        method: HttpMethods.post,
        body: model.toJson(),
      );
      if (response != null) {
        LoginModel jsonData = LoginModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request failed");
      }
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<RegisterModel>> userRegister(CreateUserModel model) async {
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().postRegister,
        method: HttpMethods.post,
        body: model.toJson(),
      );

      if (response != null) {
        RegisterModel jsonData = RegisterModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<BinModel>> getBinInfo(String binId) async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: "${ApiEndpoints().getBinInfo}?qrCode=$binId",
        method: HttpMethods.get,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response != null) {
        BinModel jsonData = BinModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<EventResult>> createEvent(EventCreateModel model) async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().postBinEvent,
        method: HttpMethods.post,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: model.toJson(),
      );

      if (response != null) {
        EventResult jsonData = EventResult.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<CollectionModel>> getCollection() async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().getCollectionEvent,
        method: HttpMethods.get,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response != null) {
        CollectionModel jsonData = CollectionModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<InfoModel>> getInfo() async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().getInfo,
        method: HttpMethods.get,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response != null) {
        InfoModel jsonData = InfoModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<RewardModel>> getRewards() async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().getReward,
        method: HttpMethods.get,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response != null) {
        RewardModel jsonData = RewardModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<RedemptionModel>> postRedemtion(
    Map<String, dynamic> redemption,
  ) async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().postReward,
        method: HttpMethods.post,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: redemption,
      );

      if (response != null) {
        RedemptionModel jsonData = RedemptionModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<RedemptionHistoryModel>> getRewardHistory() async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().getRewardHistory,
        method: HttpMethods.get,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response != null) {
        RedemptionHistoryModel jsonData = RedemptionHistoryModel.fromJson(
          response,
        );
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<ForgotPasswordModel>> forgotPassword({
    required String email,
  }) async {
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().forgotPassword,
        method: HttpMethods.post,
        body: {'email': email, 'newPassword': "string"},
      );

      if (response != null) {
        ForgotPasswordModel jsonData = ForgotPasswordModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<ResetPasswordModel>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      dynamic response = await _httpManager.restRequest(
        url: ApiEndpoints().resetPassword,
        method: HttpMethods.post,
        body: {'token': token, 'newPassword': newPassword},
      );

      if (response != null) {
        ResetPasswordModel jsonData = ResetPasswordModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<DeleteModel>> deleteAccount({required String password}) async {
    String userToken = box.read(AppConst.USER_TOKEN) ?? '';
    try {
      dynamic response = await _httpManager.restRequest(
        url: "${ApiEndpoints().deleteAccount}?password=$password",
        method: HttpMethods.delete,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response != null) {
        DeleteModel jsonData = DeleteModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Request data failed!!");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse.error(message: e.toString());
    }
  }
}
