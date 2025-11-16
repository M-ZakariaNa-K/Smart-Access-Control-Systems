class AttendanceRecords {
  final String loginDate;
  final String loginTime;

  AttendanceRecords({
   required this.loginDate,
   required this.loginTime,

});

  factory AttendanceRecords.fromJson(Map<String,dynamic>json){
    return AttendanceRecords(
      loginDate: json['Login Date'] ?? ' ',
      loginTime: json['Login Time'] ?? ' ',
    );
  }
}
class AttendanceData{
  final int userId;
  final List<AttendanceRecords> entryRecord;

  AttendanceData({
    required this.userId,
    required this.entryRecord,
  });

  factory AttendanceData.fromJson(Map<String,dynamic> json){
    var records= json['entry_records'] as List? ?? [];
    return AttendanceData(
      userId: json['user_id']?? 0,
      entryRecord: records.map((e)=>AttendanceRecords.fromJson(e)).toList(),
    );
  }
}