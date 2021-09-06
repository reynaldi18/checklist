import 'package:si_jaja/src/models/time.dart';

class UploadRes {
  bool? success;
  Object? data;
  String? message;
  Time? time;


  UploadRes({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  UploadRes.fromJson(Map<dynamic, dynamic> json) {
    success = json['success'];
    data = json['data'] == null ? null :json['data'];
    message = json['message'];
    time = json['time'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    data['message'] = this.message;
    data['time'] = this.time;
    return data;
  }
}
