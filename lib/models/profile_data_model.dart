import 'dart:core';

class ProfileData {
  String firstName;
  String lastName;
  String email;
  String phoneNr;
  List<BusinessData> businesses;

  ProfileData(
      this.firstName, this.lastName, this.email, this.phoneNr, this.businesses);

  ProfileData.fromJson(Map<String, dynamic> parsedJson)
      : firstName = parsedJson['firstName'],
        lastName = parsedJson['lastName'],
        email = parsedJson['email'],
        phoneNr = parsedJson['phoneNr'],
        businesses = List<BusinessData>.from(
            parsedJson['businesses'].map((x) => BusinessData.fromJson(x)));

  Map<String, dynamic> toJson() => {};
}

class BusinessData {
  String name;
  String address;
  String vatNumber;
  String industryOfTrade;
  String beneficiary;
  int accountNumber;
  String swiftBic;

  BusinessData(this.name, this.address, this.vatNumber, this.industryOfTrade,
      this.beneficiary, this.accountNumber, this.swiftBic);

  BusinessData.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson["name"],
        address = parsedJson["address"] as String,
        vatNumber = parsedJson["vatNumber"] as String,
        industryOfTrade = parsedJson["industryOfTrade"] as String,
        beneficiary = parsedJson["beneficiary"] as String,
        accountNumber = parsedJson["accountNumber"] as int,
        swiftBic = parsedJson["swiftBic"] as String;
}
