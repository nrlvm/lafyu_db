class AddressModel {
  AddressModel({
    this.id = 0,
    required this.name,
    required this.pNumber,
    required this.location,
  });

  int id;
  final String name;
  final String pNumber;
  final String location;

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": pNumber,
        "location": location,
      };
}
