class AssignmentResponseModel {
  bool? status;
  Data? data;
  String? message;

  AssignmentResponseModel({this.status, this.data, this.message});

  AssignmentResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? title;
  String? description;
  List<Platforms>? platforms;

  Data({this.title, this.description, this.platforms});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms!.add(Platforms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (platforms != null) {
      data['platforms'] = platforms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Platforms {
  String? name;
  String? iconURL;
  String? description;

  Platforms({this.name, this.iconURL, this.description});

  Platforms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconURL = json['iconURL'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['iconURL'] = iconURL;
    data['description'] = description;
    return data;
  }
}
