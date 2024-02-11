/// id : 2
/// product_name : "test rare product"
/// medicine_type : "Tablet"
/// availability_type : "rare"
/// selling_price : 20.99
/// retail_price : 25.99
/// is_discounted : false
/// selling_unit : "Box"
/// img : "/media/Product/images_2_1_DcFXbat.png"
/// company_name : "ACI Limited"
/// stock_status : false

class WishListModel {
  WishListModel({
      num? id, 
      String? productName, 
      String? medicineType, 
      String? availabilityType, 
      num? sellingPrice, 
      num? retailPrice, 
      bool? isDiscounted, 
      String? sellingUnit, 
      String? img, 
      String? companyName, 
      bool? stockStatus,}){
    _id = id;
    _productName = productName;
    _medicineType = medicineType;
    _availabilityType = availabilityType;
    _sellingPrice = sellingPrice;
    _retailPrice = retailPrice;
    _isDiscounted = isDiscounted;
    _sellingUnit = sellingUnit;
    _img = img;
    _companyName = companyName;
    _stockStatus = stockStatus;
}

  WishListModel.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _medicineType = json['medicine_type'];
    _availabilityType = json['availability_type'];
    _sellingPrice = json['selling_price'];
    _retailPrice = json['retail_price'];
    _isDiscounted = json['is_discounted'];
    _sellingUnit = json['selling_unit'];
    _img = json['img'];
    _companyName = json['company_name'];
    _stockStatus = json['stock_status'];
  }
  num? _id;
  String? _productName;
  String? _medicineType;
  String? _availabilityType;
  num? _sellingPrice;
  num? _retailPrice;
  bool? _isDiscounted;
  String? _sellingUnit;
  String? _img;
  String? _companyName;
  bool? _stockStatus;
WishListModel copyWith({  num? id,
  String? productName,
  String? medicineType,
  String? availabilityType,
  num? sellingPrice,
  num? retailPrice,
  bool? isDiscounted,
  String? sellingUnit,
  String? img,
  String? companyName,
  bool? stockStatus,
}) => WishListModel(  id: id ?? _id,
  productName: productName ?? _productName,
  medicineType: medicineType ?? _medicineType,
  availabilityType: availabilityType ?? _availabilityType,
  sellingPrice: sellingPrice ?? _sellingPrice,
  retailPrice: retailPrice ?? _retailPrice,
  isDiscounted: isDiscounted ?? _isDiscounted,
  sellingUnit: sellingUnit ?? _sellingUnit,
  img: img ?? _img,
  companyName: companyName ?? _companyName,
  stockStatus: stockStatus ?? _stockStatus,
);
  num? get id => _id;
  String? get productName => _productName;
  String? get medicineType => _medicineType;
  String? get availabilityType => _availabilityType;
  num? get sellingPrice => _sellingPrice;
  num? get retailPrice => _retailPrice;
  bool? get isDiscounted => _isDiscounted;
  String? get sellingUnit => _sellingUnit;
  String? get img => _img;
  String? get companyName => _companyName;
  bool? get stockStatus => _stockStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['medicine_type'] = _medicineType;
    map['availability_type'] = _availabilityType;
    map['selling_price'] = _sellingPrice;
    map['retail_price'] = _retailPrice;
    map['is_discounted'] = _isDiscounted;
    map['selling_unit'] = _sellingUnit;
    map['img'] = _img;
    map['company_name'] = _companyName;
    map['stock_status'] = _stockStatus;
    return map;
  }

}