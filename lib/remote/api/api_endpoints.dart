class ApiEndpoints {
  final String postLogin =
      "https://api.greenschool.io.vn/api/UserApp/authenticate/";
  final String postRegister =
      "https://api.greenschool.io.vn/api/UserApp/create/";
  final String getBinInfo =
      "https://api.greenschool.io.vn/api/CollectionEvent/get-bin-info/";
  final String postBinEvent =
      "https://api.greenschool.io.vn/api/CollectionEvent/create/";
  final String getCollectionEvent =
      "https://api.greenschool.io.vn/api/CollectionEvent/get-EventBy";
  final String getInfo =
      "https://api.greenschool.io.vn/api/Reward/PointsBalance/";
  final String getReward = "https://api.greenschool.io.vn/api/Reward/paging/";
  final String postReward =
      "https://api.greenschool.io.vn/api/Reward/Redemption-create";
  final String getRewardHistory =
      "https://api.greenschool.io.vn/api/Reward/redemption-history";
  final String forgotPassword =
      "https://api.greenschool.io.vn/api/UserApp/forgot-password";
  final String resetPassword =
      "https://api.greenschool.io.vn/api/UserApp/reset-password";
  final String deleteAccount =
      'https://api.greenschool.io.vn/api/UserApp/delete';
}
