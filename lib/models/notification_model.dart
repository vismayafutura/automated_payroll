class NotificationModel {
  List<NChatResult> result;

  NotificationModel({this.result});

  NotificationModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(NChatResult.fromJson(v));
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

class NChatResult {
  String notId;
  String date;
  String messege;

  NChatResult({
    this.notId,
    this.date,
    this.messege,
  });

  NChatResult.fromJson(dynamic json) {
    notId = json['not_id'];
    date = json['date'];
    messege = json['messege'];
  }

  List<NChatResult> get result => null;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['not_id'] = notId;
    map['date'] = date;
    map['messege'] = messege;
    return map;
  }
}
