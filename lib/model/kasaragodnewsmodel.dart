class kasaragodnewsmodel {
  String? uid;
  String? kasaragodimageurl;
  String? kasaragodnewstitle;
  String? kasaragodnewsdescription;

  kasaragodnewsmodel(
      {this.uid,
      required this.kasaragodimageurl,
      this.kasaragodnewstitle,
      this.kasaragodnewsdescription});

//recieving data from server

  factory kasaragodnewsmodel.fromMap(map) => kasaragodnewsmodel(
        uid: map['uid'],
        kasaragodimageurl: map['kasaragodimageurl'],
        kasaragodnewstitle: map['kasaragodnewstitle'],
        kasaragodnewsdescription: map['kasaragodnewsdescription'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'kasaragodimageurl': kasaragodimageurl,
      'kasaragodnewstitle': kasaragodnewstitle,
      'kasaragodnewsdescription': kasaragodnewsdescription,
    };
  }
}
