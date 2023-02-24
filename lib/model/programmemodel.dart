class programmemodel {
  String? uid;
  String? programmeimageurl;
  String? programmetitle;
  String? programmeyoutubeurl;

  programmemodel(
      {this.uid,
      required this.programmeimageurl,
      this.programmetitle,
      this.programmeyoutubeurl});

//recieving data from server

  factory programmemodel.fromMap(map) => programmemodel(
        uid: map['uid'],
        programmeimageurl: map['programmeimageurl'],
        programmetitle: map['programmetitle'],
        programmeyoutubeurl: map['programmeyoutubeurl'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'programmeimageurl': programmeimageurl,
      'programmetitle': programmetitle,
      'programmeyoutubeurl': programmeyoutubeurl,
    };
  }
}
