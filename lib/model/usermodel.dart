class Usermodel {
  String uid;
  String? email;
  String? firstname;
  String? secondname;
  String? image;

  Usermodel({this.uid='', this.email, this.firstname, this.secondname,this.image});

  // receiving  data from server
  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['first name'],
      secondname: map['second name'],
      image:map['image']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'first name': firstname,
      'second name': secondname,
      'image':image
    };
  }
}
