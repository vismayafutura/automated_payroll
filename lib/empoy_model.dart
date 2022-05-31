//
// class empModel {
//   List<empResult> result;
//
//   empModel({
//     this.result});
//
//   empModel.fromJson(dynamic json) {
//     if (json['result'] != null) {
//       result = [];
//       json['result'].forEach((v) {
//         result.add(empResult.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     if (result != null) {
//       map['result'] = result.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class empResult {
//   String username;
//
//
//   empResult({
//     this.username,
//    });
//
//   empResult.fromJson(dynamic json) {
//     username = json['username'];
//
//   }
//
//   List<empResult> get result => null;
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['username'] = username;
//
//     return map;
//   }
//
// }
class empModel {
  List<empResult> result;

  empModel({this.result});

  empModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(empResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class empResult {
  String username;
  var latitude;
  var longitude;

  empResult({
    this.username,
  });

  empResult.fromJson(dynamic json) {
    username = json['username'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  List<empResult> get result => null;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['username'] = username;
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return map;
  }
}
