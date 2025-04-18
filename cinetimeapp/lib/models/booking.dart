class Booking {
  int? id;
  String name;
  String email;
  String phone;
  int tickets;
  String postalCode;
  String cardNumber;
  String cvv;
  String expiryDate;

  Booking({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.tickets,
    required this.postalCode,
    required this.cardNumber,
    required this.cvv,
    required this.expiryDate,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'name': name,
      'email': email,
      'phone': phone,
      'tickets': tickets,
      'postalCode': postalCode,
      'cardNumber': cardNumber,
      'cvv': cvv,
      'expiryDate': expiryDate,
    };
    if (id != null) map['id'] = id as Object;
    return map;
  }

  static Booking fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      tickets: map['tickets'],
      postalCode: map['postalCode'],
      cardNumber: map['cardNumber'],
      cvv: map['cvv'],
      expiryDate: map['expiryDate'],
    );
  }
}
