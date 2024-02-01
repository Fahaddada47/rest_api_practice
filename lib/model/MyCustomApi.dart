/// users : [{"id":1,"username":"john_doe","email":"john@example.com","profile":{"name":"John Doe","age":30,"gender":"male","address":{"street":"123 Main Street","city":"New York","zipcode":"10001"},"phone_numbers":[{"type":"home","number":"123-456-7890"},{"type":"work","number":"987-654-3210"}]},"posts":[{"id":101,"title":"Hello, World!","content":"This is my first post.","date":"2024-01-31"},{"id":102,"title":"Flutter Development","content":"Learning Flutter development.","date":"2024-02-05"}]},{"id":2,"username":"jane_smith","email":"jane@example.com","profile":{"name":"Jane Smith","age":25,"gender":"female","address":{"street":"456 Oak Street","city":"Los Angeles","zipcode":"90001"},"phone_numbers":[{"type":"home","number":"111-222-3333"},{"type":"cell","number":"444-555-6666"}]},"posts":[{"id":201,"title":"Travel Adventures","content":"Exploring the world.","date":"2024-03-10"}]}]

class MyCustomApi {
  MyCustomApi({
      List<Users>? users,}){
    _users = users;
}

  MyCustomApi.fromJson(dynamic json) {
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
  }
  List<Users>? _users;
MyCustomApi copyWith({  List<Users>? users,
}) => MyCustomApi(  users: users ?? _users,
);
  List<Users>? get users => _users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// username : "john_doe"
/// email : "john@example.com"
/// profile : {"name":"John Doe","age":30,"gender":"male","address":{"street":"123 Main Street","city":"New York","zipcode":"10001"},"phone_numbers":[{"type":"home","number":"123-456-7890"},{"type":"work","number":"987-654-3210"}]}
/// posts : [{"id":101,"title":"Hello, World!","content":"This is my first post.","date":"2024-01-31"},{"id":102,"title":"Flutter Development","content":"Learning Flutter development.","date":"2024-02-05"}]

class Users {
  Users({
      num? id,
      String? username,
      String? email,
      Profile? profile,
      List<Posts>? posts,}){
    _id = id;
    _username = username;
    _email = email;
    _profile = profile;
    _posts = posts;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    if (json['posts'] != null) {
      _posts = [];
      json['posts'].forEach((v) {
        _posts?.add(Posts.fromJson(v));
      });
    }
  }
  num? _id;
  String? _username;
  String? _email;
  Profile? _profile;
  List<Posts>? _posts;
Users copyWith({  num? id,
  String? username,
  String? email,
  Profile? profile,
  List<Posts>? posts,
}) => Users(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  profile: profile ?? _profile,
  posts: posts ?? _posts,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  Profile? get profile => _profile;
  List<Posts>? get posts => _posts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    if (_posts != null) {
      map['posts'] = _posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 101
/// title : "Hello, World!"
/// content : "This is my first post."
/// date : "2024-01-31"

class Posts {
  Posts({
      num? id,
      String? title,
      String? content,
      String? date,}){
    _id = id;
    _title = title;
    _content = content;
    _date = date;
}

  Posts.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _date = json['date'];
  }
  num? _id;
  String? _title;
  String? _content;
  String? _date;
Posts copyWith({  num? id,
  String? title,
  String? content,
  String? date,
}) => Posts(  id: id ?? _id,
  title: title ?? _title,
  content: content ?? _content,
  date: date ?? _date,
);
  num? get id => _id;
  String? get title => _title;
  String? get content => _content;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    map['date'] = _date;
    return map;
  }

}

/// name : "John Doe"
/// age : 30
/// gender : "male"
/// address : {"street":"123 Main Street","city":"New York","zipcode":"10001"}
/// phone_numbers : [{"type":"home","number":"123-456-7890"},{"type":"work","number":"987-654-3210"}]

class Profile {
  Profile({
      String? name,
      num? age,
      String? gender,
      Address? address,
      List<PhoneNumbers>? phoneNumbers,}){
    _name = name;
    _age = age;
    _gender = gender;
    _address = address;
    _phoneNumbers = phoneNumbers;
}

  Profile.fromJson(dynamic json) {
    _name = json['name'];
    _age = json['age'];
    _gender = json['gender'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['phone_numbers'] != null) {
      _phoneNumbers = [];
      json['phone_numbers'].forEach((v) {
        _phoneNumbers?.add(PhoneNumbers.fromJson(v));
      });
    }
  }
  String? _name;
  num? _age;
  String? _gender;
  Address? _address;
  List<PhoneNumbers>? _phoneNumbers;
Profile copyWith({  String? name,
  num? age,
  String? gender,
  Address? address,
  List<PhoneNumbers>? phoneNumbers,
}) => Profile(  name: name ?? _name,
  age: age ?? _age,
  gender: gender ?? _gender,
  address: address ?? _address,
  phoneNumbers: phoneNumbers ?? _phoneNumbers,
);
  String? get name => _name;
  num? get age => _age;
  String? get gender => _gender;
  Address? get address => _address;
  List<PhoneNumbers>? get phoneNumbers => _phoneNumbers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['age'] = _age;
    map['gender'] = _gender;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_phoneNumbers != null) {
      map['phone_numbers'] = _phoneNumbers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "home"
/// number : "123-456-7890"

class PhoneNumbers {
  PhoneNumbers({
      String? type,
      String? number,}){
    _type = type;
    _number = number;
}

  PhoneNumbers.fromJson(dynamic json) {
    _type = json['type'];
    _number = json['number'];
  }
  String? _type;
  String? _number;
PhoneNumbers copyWith({  String? type,
  String? number,
}) => PhoneNumbers(  type: type ?? _type,
  number: number ?? _number,
);
  String? get type => _type;
  String? get number => _number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['number'] = _number;
    return map;
  }

}

/// street : "123 Main Street"
/// city : "New York"
/// zipcode : "10001"

class Address {
  Address({
      String? street,
      String? city,
      String? zipcode,}){
    _street = street;
    _city = city;
    _zipcode = zipcode;
}

  Address.fromJson(dynamic json) {
    _street = json['street'];
    _city = json['city'];
    _zipcode = json['zipcode'];
  }
  String? _street;
  String? _city;
  String? _zipcode;
Address copyWith({  String? street,
  String? city,
  String? zipcode,
}) => Address(  street: street ?? _street,
  city: city ?? _city,
  zipcode: zipcode ?? _zipcode,
);
  String? get street => _street;
  String? get city => _city;
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['city'] = _city;
    map['zipcode'] = _zipcode;
    return map;
  }

}