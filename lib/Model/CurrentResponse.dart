/// data : [{"id":5,"code":"31783","created_at":"12:11"},{"id":7,"code":"30474","created_at":"12:11"}]
/// status : "success"
/// message : "Get Product Successfully"

class CurrentResponse {
  CurrentResponse({
      this.data, 
      this.status, 
      this.message,});

  CurrentResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CurrentData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<CurrentData>? data;
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}

/// id : 5
/// code : "31783"
/// created_at : "12:11"

class CurrentData {
  CurrentData({
      this.id, 
      this.code, 
      this.createdAt,});

  CurrentData.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    createdAt = json['created_at'];
  }
  int? id;
  String? code;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['created_at'] = createdAt;
    return map;
  }

}