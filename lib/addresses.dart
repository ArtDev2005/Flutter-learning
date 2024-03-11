class Address{
  String city;
  String street;
  String house;
  int flat;
  Address(
    {
      required this.city,
      required this.street,
      required this.house,
      required this.flat,
    }
  );
  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      city: json["city"] as String,
      street: json["street"] as String,
      house: json["house"] as String,
      flat: json["flat"] as int,
    );

  }
}