class ApiUrl {
  ///=================================This is baseUrl==============================================>
  static const baseUrl = "http://192.168.10.116:5000";

  ///=================================Authentication url==========================
  static const signupAuth = "/auth/register";
  static const otpVerificationEndPoint = "/auth/activate-user";
  static const logIn = "/auth/login";
  static const forgetOtp = "/auth/forgot-password";
  static const forgetOtpVerify = "/auth/verify-otp";
  static const resetPassword = "/auth/reset-password";
  static const resetOtpSignUp = "/auth/resend"; //state problem

  ///===================================Profile url===============================
  static const getProfile = "/auth/profile/"; //not complete
  static const editProfile = "/auth/edit-profile/"; //not complete

  ///====================================Settings url================================
  static const changePassword = "/auth/change-password"; //not complete
  static const deleteAccount = "/auth/delete-account"; //not complete

  ///==================================== Home Screen ================================
  static const banner = "/auth/forgot-password";
  static const trainingPrograms = "/training/all";
  static trainingDetails({required String id}) =>
      "/program-article/program-articles/$id";


  ///=====================================Post Screen======================
  static const postEndpoint = "/post/add-post";

}
