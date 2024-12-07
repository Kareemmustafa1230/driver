/// data : [{"id":1,"code":"39800","created_at":"14/11/2023"},{"id":3,"code":"59364","created_at":"14/11/2023"},{"id":6,"code":"22544","created_at":"15/11/2023"}]
/// status : "success"
/// message : "Get Product Successfully"

class IncompleteOrderResponse {
  IncompleteOrderResponse({
      this.data, 
      this.status, 
      this.message,});

  IncompleteOrderResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(IncompleteData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<IncompleteData>? data;
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

/// id : 1
/// code : "39800"
/// created_at : "14/11/2023"

class IncompleteData {
  IncompleteData({
      this.id, 
      this.code, 
      this.createdAt,});

  IncompleteData.fromJson(dynamic json) {
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