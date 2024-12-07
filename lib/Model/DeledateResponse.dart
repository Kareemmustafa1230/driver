/// data : [{"id":6,"name":"Rahim Perkins","username":"fedajemo","email":"gafer@mailinator.com","phone":"+1 (947) 127-3733"},{"id":7,"name":"Darrel Acosta","username":"begeqipuq","email":"rygi@mailinator.com","phone":"+1 (524) 213-2535"},{"id":8,"name":"Keane Talley","username":"gibugy","email":"pusix@mailinator.com","phone":"+1 (972) 312-8888"},{"id":9,"name":"Jordan Franks","username":"negac","email":"qysenetyz@mailinator.com","phone":"+1 (353) 703-1149"},{"id":10,"name":"Zenaida Cote","username":"jocytux","email":"luna@mailinator.com","phone":"+1 (139) 895-6467"}]
/// status : "success"
/// message : "Get Product Successfully"

class DeledateResponse {
  DeledateResponse({
      this.data, 
      this.status, 
      this.message,});

  DeledateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DeledateData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<DeledateData>? data;
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

/// id : 6
/// name : "Rahim Perkins"
/// username : "fedajemo"
/// email : "gafer@mailinator.com"
/// phone : "+1 (947) 127-3733"

class DeledateData {
  DeledateData({
      this.id, 
      this.name, 
      this.username, 
      this.email, 
      this.phone,});

  DeledateData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}