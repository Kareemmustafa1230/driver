/// token : "100|RCSmq6FtobGcZybqatZn3KruezUkEmFcmDBPUComa170011f"
/// name : "Mohamed Abd Elrahman Mansour"
/// status : "Success"
/// message : "Hello Admin again"

class LogingResponse {
  LogingResponse({
      this.token, 
      this.name, 
      this.status, 
      this.message,});

  LogingResponse.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    status = json['status'];
    message = json['message'];
  }
  String? token;
  String? name;
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}