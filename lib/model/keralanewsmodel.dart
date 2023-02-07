class keralanewsmodel {
  String? uid;
  String? keralaimageurl;
  String? keralanewstitle;
  String? keralanewsdescription;

  keralanewsmodel(
      {this.uid,
      required this.keralaimageurl,
      this.keralanewstitle,
      this.keralanewsdescription});

//recieving data from server

  factory keralanewsmodel.fromMap(map) => keralanewsmodel(
        uid: map['uid'],
        keralaimageurl: map['keralaimageurl'],
        keralanewstitle: map['keralanewstitle'],
        keralanewsdescription: map['keralanewsdescription'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'keralaimageurl': keralaimageurl,
      'keralanewstitle': keralanewstitle,
      'keralanewsdescription': keralanewsdescription,
    };
  }
}
