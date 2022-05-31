class User_chatmodel {
  List<ChatResult> result;

  User_chatmodel({
      this.result});

  User_chatmodel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(ChatResult.fromJson(v));
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

class ChatResult {
  String chatId;
  String date;
  String personName;
  String message;
 String replay;
  ChatResult({
      this.chatId, 
      this.date, 
      this.personName, 
      this.message,
      this.replay});

  ChatResult.fromJson(dynamic json) {
    chatId = json['chat_id'];
    date = json['date'];
    personName = json['person_name'];
    message = json['message'];
    replay= json['replay'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['chat_id'] = chatId;
    map['date'] = date;
    map['person_name'] = personName;
    map['message'] = message;
    map['replay'] = replay;
    return map;
  }

}