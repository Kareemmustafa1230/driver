/// data : ""
/// status : "success"
/// message : "Accept Order Successfully"

class AcceptResponse {
  AcceptResponse({
      this.data, 
      this.status, 
      this.message,});

  AcceptResponse.fromJson(dynamic json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }
  String? data;
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}