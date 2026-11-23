class UserDetail {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  final String companyName;
  final String catchPhrase;
  final String bs;

  UserDetail({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.companyName,
    required this.catchPhrase,
    required this.bs,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    final address = json['address'] as Map<String, dynamic>;
    final geo = address['geo'] as Map<String, dynamic>;
    final company = json['company'] as Map<String, dynamic>;

    return UserDetail(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      street: address['street'],
      suite: address['suite'],
      city: address['city'],
      zipcode: address['zipcode'],
      lat: geo['lat'],
      lng: geo['lng'],
      companyName: company['name'],
      catchPhrase: company['catchPhrase'],
      bs: company['bs'],
    );
  }
}