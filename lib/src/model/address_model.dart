class AddressModel {
  AddressModel({
    this.id = 0,
    required this.city,
    required this.pNumber,
    required this.location,
  });

  int id;
  final String city;
  final String pNumber;
  final String location;

  Map<String, dynamic> toJson() => {
        "name": city,
        "phone_number": pNumber,
        "location": location,
      };
}
