/// data : [{"id":2,"code":"93087","created_at":"14/11/2023"},{"id":4,"code":"95472","created_at":"14/11/2023"}]
/// status : "success"
/// message : "Get Product Successfully"

class CanceledOrederResponse {
  CanceledOrederResponse({
      this.data, 
      this.status, 
      this.message,});

  CanceledOrederResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CanceledData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<CanceledData>? data;
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

/// id : 2
/// code : "93087"
/// created_at : "14/11/2023"

class CanceledData {
  CanceledData({
      this.id, 
      this.code, 
      this.createdAt,});

  CanceledData.fromJson(dynamic json) {
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