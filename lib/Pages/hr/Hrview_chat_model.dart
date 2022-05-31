class Hr_chatmodel {
  List<HrChatResult> result;

  Hr_chatmodel({
    this.result});

  Hr_chatmodel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(HrChatResult.fromJson(v));
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

class HrChatResult {
  String chatId;
  String date;
  String personName;
  String message;

  HrChatResult({
    this.chatId,
    this.date,
    this.personName,
    this.message});

  HrChatResult.fromJson(dynamic json) {
    chatId = json['chat_id'];
    date = json['date'];
    personName = json['person_name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['chat_id'] = chatId;
    map['date'] = date;
    map['person_name'] = personName;
    map['message'] = message;
    return map;
  }

}