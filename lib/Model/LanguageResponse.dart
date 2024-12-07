/// data : "Change Language succsfully"
/// status : "success"
/// message : "The current language is  Arabic"

class LanguageResponse {
  LanguageResponse({
      this.data, 
      this.status, 
      this.message,});

  LanguageResponse.fromJson(dynamic json) {
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