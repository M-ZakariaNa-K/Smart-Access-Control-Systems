class MonthlyAttendanceModel {
  final int userId;
  final String month;
  final int totalHours;
  final LastLogin? lastLogin;
  final LastLogout? lastLogout;

  MonthlyAttendanceModel({
    required this.userId,
    required this.month,
    required this.totalHours,
    this.lastLogin,
    this.lastLogout,
  });

  factory MonthlyAttendanceModel.fromJson(Map<String,dynamic> json){
    final loginList= json['Last Login '] as List?;
    final loginData= loginList !=null && loginList.isNotEmpty ? loginList.first : null;

    final logoutList= json['Last Logout '] as List?;
    final logoutData= logoutList !=null && logoutList.isNotEmpty ? logoutList.first : null;

    return MonthlyAttendanceModel(
      userId:json ['user_id']?? 0,
       month: json ['month'] ?? '', 
       totalHours: json ['Total Hours of attendance at the club '] ?? 0,
        lastLogin: loginData != null ? LastLogin.fromJson(loginData) : null,
        lastLogout: logoutData != null ? LastLogout.fromJson(logoutData) : null,
    );
  }
}
class LastLogin{
    final String loginDate;
    final String loginTime;

    LastLogin({
      required this.loginDate,
      required this.loginTime,
    });
    factory LastLogin.fromJson(Map<String,dynamic> json){
      return LastLogin(
        loginDate:json['Login Date']?? '',
        loginTime:json['Login Time']?? '',
      );
    }
  }
class LastLogout{
  final String logoutDate;
  final String logoutTime;

  LastLogout({
    required this.logoutDate,
    required this.logoutTime,
  });

  factory LastLogout.fromJson(Map<String,dynamic> json){
    return LastLogout(
      logoutDate:json['Logout Date']?? '' , 
      logoutTime: json['Logout Time']?? '',
      );
  }
}