class ApiException {
  int? code;
  String? message;

  ApiException({this.code, this.message}) {
    if (code != 400) {
      return;
    }
    if (message == "Failed to authenticate.") {
      message = "نام کاربری یا رمز عبور اشتباه است";
    }
  }
}
