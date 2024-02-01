/// Data : {"Education":{"schoolID":101,"waiverAmount":55000},"HigherEducation":{"universityID":102,"tuitionFee":60000},"Transportation":{"Photos":[{"carPicture":"\"https://example.com/car1\"","driverPicture":"\"https://example.com/driver1\""}],"PhotosAlternate":[{"carPicture":"\"https://example.com/car2\"","driverPicture":"\"https://example.com/driver2\""}],"PhotosAlternate2":[{"carPicture":"\"https://example.com/car3\"","driverPicture":"\"https://example.com/driver3\""}],"DriveID":103,"TravelDistance":"30 miles"},"UserID":1,"UserFullName":"\"Jane Doe\"","UserEmailAddress":"\"jane.doe@example.com\"","UserHomeAddress":"\"789 Maple St, City\""}

class MyApiModel {
  MyApiModel({
      Data? data,}){
    _data = data;
}

  MyApiModel.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }
  Data? _data;
MyApiModel copyWith({  Data? data,
}) => MyApiModel(  data: data ?? _data,
);
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    return map;
  }

}

/// Education : {"schoolID":101,"waiverAmount":55000}
/// HigherEducation : {"universityID":102,"tuitionFee":60000}
/// Transportation : {"Photos":[{"carPicture":"\"https://example.com/car1\"","driverPicture":"\"https://example.com/driver1\""}],"PhotosAlternate":[{"carPicture":"\"https://example.com/car2\"","driverPicture":"\"https://example.com/driver2\""}],"PhotosAlternate2":[{"carPicture":"\"https://example.com/car3\"","driverPicture":"\"https://example.com/driver3\""}],"DriveID":103,"TravelDistance":"30 miles"}
/// UserID : 1
/// UserFullName : "\"Jane Doe\""
/// UserEmailAddress : "\"jane.doe@example.com\""
/// UserHomeAddress : "\"789 Maple St, City\""

class Data {
  Data({
      Education? education, 
      HigherEducation? higherEducation, 
      Transportation? transportation, 
      num? userID, 
      String? userFullName, 
      String? userEmailAddress, 
      String? userHomeAddress,}){
    _education = education;
    _higherEducation = higherEducation;
    _transportation = transportation;
    _userID = userID;
    _userFullName = userFullName;
    _userEmailAddress = userEmailAddress;
    _userHomeAddress = userHomeAddress;
}

  Data.fromJson(dynamic json) {
    _education = json['Education'] != null ? Education.fromJson(json['Education']) : null;
    _higherEducation = json['HigherEducation'] != null ? HigherEducation.fromJson(json['HigherEducation']) : null;
    _transportation = json['Transportation'] != null ? Transportation.fromJson(json['Transportation']) : null;
    _userID = json['UserID'];
    _userFullName = json['UserFullName'];
    _userEmailAddress = json['UserEmailAddress'];
    _userHomeAddress = json['UserHomeAddress'];
  }
  Education? _education;
  HigherEducation? _higherEducation;
  Transportation? _transportation;
  num? _userID;
  String? _userFullName;
  String? _userEmailAddress;
  String? _userHomeAddress;
Data copyWith({  Education? education,
  HigherEducation? higherEducation,
  Transportation? transportation,
  num? userID,
  String? userFullName,
  String? userEmailAddress,
  String? userHomeAddress,
}) => Data(  education: education ?? _education,
  higherEducation: higherEducation ?? _higherEducation,
  transportation: transportation ?? _transportation,
  userID: userID ?? _userID,
  userFullName: userFullName ?? _userFullName,
  userEmailAddress: userEmailAddress ?? _userEmailAddress,
  userHomeAddress: userHomeAddress ?? _userHomeAddress,
);
  Education? get education => _education;
  HigherEducation? get higherEducation => _higherEducation;
  Transportation? get transportation => _transportation;
  num? get userID => _userID;
  String? get userFullName => _userFullName;
  String? get userEmailAddress => _userEmailAddress;
  String? get userHomeAddress => _userHomeAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_education != null) {
      map['Education'] = _education?.toJson();
    }
    if (_higherEducation != null) {
      map['HigherEducation'] = _higherEducation?.toJson();
    }
    if (_transportation != null) {
      map['Transportation'] = _transportation?.toJson();
    }
    map['UserID'] = _userID;
    map['UserFullName'] = _userFullName;
    map['UserEmailAddress'] = _userEmailAddress;
    map['UserHomeAddress'] = _userHomeAddress;
    return map;
  }

}

/// Photos : [{"carPicture":"\"https://example.com/car1\"","driverPicture":"\"https://example.com/driver1\""}]
/// PhotosAlternate : [{"carPicture":"\"https://example.com/car2\"","driverPicture":"\"https://example.com/driver2\""}]
/// PhotosAlternate2 : [{"carPicture":"\"https://example.com/car3\"","driverPicture":"\"https://example.com/driver3\""}]
/// DriveID : 103
/// TravelDistance : "30 miles"

class Transportation {
  Transportation({
      List<Photos>? photos, 
      List<PhotosAlternate>? photosAlternate, 
      List<PhotosAlternate2>? photosAlternate2, 
      num? driveID, 
      String? travelDistance,}){
    _photos = photos;
    _photosAlternate = photosAlternate;
    _photosAlternate2 = photosAlternate2;
    _driveID = driveID;
    _travelDistance = travelDistance;
}

  Transportation.fromJson(dynamic json) {
    if (json['Photos'] != null) {
      _photos = [];
      json['Photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
    if (json['PhotosAlternate'] != null) {
      _photosAlternate = [];
      json['PhotosAlternate'].forEach((v) {
        _photosAlternate?.add(PhotosAlternate.fromJson(v));
      });
    }
    if (json['PhotosAlternate2'] != null) {
      _photosAlternate2 = [];
      json['PhotosAlternate2'].forEach((v) {
        _photosAlternate2?.add(PhotosAlternate2.fromJson(v));
      });
    }
    _driveID = json['DriveID'];
    _travelDistance = json['TravelDistance'];
  }
  List<Photos>? _photos;
  List<PhotosAlternate>? _photosAlternate;
  List<PhotosAlternate2>? _photosAlternate2;
  num? _driveID;
  String? _travelDistance;
Transportation copyWith({  List<Photos>? photos,
  List<PhotosAlternate>? photosAlternate,
  List<PhotosAlternate2>? photosAlternate2,
  num? driveID,
  String? travelDistance,
}) => Transportation(  photos: photos ?? _photos,
  photosAlternate: photosAlternate ?? _photosAlternate,
  photosAlternate2: photosAlternate2 ?? _photosAlternate2,
  driveID: driveID ?? _driveID,
  travelDistance: travelDistance ?? _travelDistance,
);
  List<Photos>? get photos => _photos;
  List<PhotosAlternate>? get photosAlternate => _photosAlternate;
  List<PhotosAlternate2>? get photosAlternate2 => _photosAlternate2;
  num? get driveID => _driveID;
  String? get travelDistance => _travelDistance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_photos != null) {
      map['Photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    if (_photosAlternate != null) {
      map['PhotosAlternate'] = _photosAlternate?.map((v) => v.toJson()).toList();
    }
    if (_photosAlternate2 != null) {
      map['PhotosAlternate2'] = _photosAlternate2?.map((v) => v.toJson()).toList();
    }
    map['DriveID'] = _driveID;
    map['TravelDistance'] = _travelDistance;
    return map;
  }

}

/// carPicture : "\"https://example.com/car3\""
/// driverPicture : "\"https://example.com/driver3\""

class PhotosAlternate2 {
  PhotosAlternate2({
      String? carPicture, 
      String? driverPicture,}){
    _carPicture = carPicture;
    _driverPicture = driverPicture;
}

  PhotosAlternate2.fromJson(dynamic json) {
    _carPicture = json['carPicture'];
    _driverPicture = json['driverPicture'];
  }
  String? _carPicture;
  String? _driverPicture;
PhotosAlternate2 copyWith({  String? carPicture,
  String? driverPicture,
}) => PhotosAlternate2(  carPicture: carPicture ?? _carPicture,
  driverPicture: driverPicture ?? _driverPicture,
);
  String? get carPicture => _carPicture;
  String? get driverPicture => _driverPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carPicture'] = _carPicture;
    map['driverPicture'] = _driverPicture;
    return map;
  }

}

/// carPicture : "\"https://example.com/car2\""
/// driverPicture : "\"https://example.com/driver2\""

class PhotosAlternate {
  PhotosAlternate({
      String? carPicture, 
      String? driverPicture,}){
    _carPicture = carPicture;
    _driverPicture = driverPicture;
}

  PhotosAlternate.fromJson(dynamic json) {
    _carPicture = json['carPicture'];
    _driverPicture = json['driverPicture'];
  }
  String? _carPicture;
  String? _driverPicture;
PhotosAlternate copyWith({  String? carPicture,
  String? driverPicture,
}) => PhotosAlternate(  carPicture: carPicture ?? _carPicture,
  driverPicture: driverPicture ?? _driverPicture,
);
  String? get carPicture => _carPicture;
  String? get driverPicture => _driverPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carPicture'] = _carPicture;
    map['driverPicture'] = _driverPicture;
    return map;
  }

}

/// carPicture : "\"https://example.com/car1\""
/// driverPicture : "\"https://example.com/driver1\""

class Photos {
  Photos({
      String? carPicture, 
      String? driverPicture,}){
    _carPicture = carPicture;
    _driverPicture = driverPicture;
}

  Photos.fromJson(dynamic json) {
    _carPicture = json['carPicture'];
    _driverPicture = json['driverPicture'];
  }
  String? _carPicture;
  String? _driverPicture;
Photos copyWith({  String? carPicture,
  String? driverPicture,
}) => Photos(  carPicture: carPicture ?? _carPicture,
  driverPicture: driverPicture ?? _driverPicture,
);
  String? get carPicture => _carPicture;
  String? get driverPicture => _driverPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carPicture'] = _carPicture;
    map['driverPicture'] = _driverPicture;
    return map;
  }

}

/// universityID : 102
/// tuitionFee : 60000

class HigherEducation {
  HigherEducation({
      num? universityID, 
      num? tuitionFee,}){
    _universityID = universityID;
    _tuitionFee = tuitionFee;
}

  HigherEducation.fromJson(dynamic json) {
    _universityID = json['universityID'];
    _tuitionFee = json['tuitionFee'];
  }
  num? _universityID;
  num? _tuitionFee;
HigherEducation copyWith({  num? universityID,
  num? tuitionFee,
}) => HigherEducation(  universityID: universityID ?? _universityID,
  tuitionFee: tuitionFee ?? _tuitionFee,
);
  num? get universityID => _universityID;
  num? get tuitionFee => _tuitionFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['universityID'] = _universityID;
    map['tuitionFee'] = _tuitionFee;
    return map;
  }

}

/// schoolID : 101
/// waiverAmount : 55000

class Education {
  Education({
      num? schoolID, 
      num? waiverAmount,}){
    _schoolID = schoolID;
    _waiverAmount = waiverAmount;
}

  Education.fromJson(dynamic json) {
    _schoolID = json['schoolID'];
    _waiverAmount = json['waiverAmount'];
  }
  num? _schoolID;
  num? _waiverAmount;
Education copyWith({  num? schoolID,
  num? waiverAmount,
}) => Education(  schoolID: schoolID ?? _schoolID,
  waiverAmount: waiverAmount ?? _waiverAmount,
);
  num? get schoolID => _schoolID;
  num? get waiverAmount => _waiverAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schoolID'] = _schoolID;
    map['waiverAmount'] = _waiverAmount;
    return map;
  }

}