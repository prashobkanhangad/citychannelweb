class videosectiomodel {
  String? uid;
  String youtubeviddeourl;
  String? youtubevideodescription;

  videosectiomodel({this.uid,required this.youtubeviddeourl, this.youtubevideodescription});

//recieving data from server

  factory videosectiomodel.fromMap(map) => videosectiomodel(
        uid: map['uid'],
        youtubeviddeourl: map['youtubeviddeourl'],
        youtubevideodescription: map['youtubevideodescription'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'youtubeviddeourl': youtubeviddeourl,
      'youtubevideodescription': youtubevideodescription,
    };
  }
}
