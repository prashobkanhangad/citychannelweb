class Shortnewsmodel {
  String? uid;
  String shortnewsimgurl;
  String? shortnewstitle;

  Shortnewsmodel({this.uid,required this.shortnewsimgurl, this.shortnewstitle});

//recieving data from server

  factory Shortnewsmodel.fromMap(map) => Shortnewsmodel(
        uid: map['uid'],
        shortnewsimgurl: map['shortnewsimgurl'],
        shortnewstitle: map['shortnewstitle'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'shortnewsimgurl': shortnewsimgurl,
      'shortnewstitle': shortnewstitle,
    };
  }
}
