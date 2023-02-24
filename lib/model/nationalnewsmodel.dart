class nationalnewsmodel {
  String? uid;
  String? nationalimageurl;
  String? nationalnewstitle;
  String? nationalnewsdescription;

  nationalnewsmodel(
      {this.uid,
      required this.nationalimageurl,
      this.nationalnewstitle,
      this.nationalnewsdescription});

//recieving data from server

  factory nationalnewsmodel.fromMap(map) => nationalnewsmodel(
        uid: map['uid'],
        nationalimageurl: map['nationalimageurl'],
        nationalnewstitle: map['nationalnewstitle'],
        nationalnewsdescription: map['nationalnewsdescription'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nationalimageurl': nationalimageurl,
      'nationalnewstitle': nationalnewstitle,
      'nationalnewsdescription': nationalnewsdescription,
    };
  }
}
