import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.coins,
    required this.profile,
  });

  final Coins coins;
  final Profile profile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        coins: Coins.fromJson(json["coins"]),
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "coins": coins.toJson(),
        "profile": profile.toJson(),
      };
}

class Coins {
  Coins({
    required this.totalEarned,
    required this.totalSpent,
    required this.earnHistory,
    required this.spentHistory,
  });

  final int totalEarned;
  final int totalSpent;
  final List<History> earnHistory;
  final List<History> spentHistory;

  factory Coins.fromJson(Map<String, dynamic> json) => Coins(
        totalEarned: json["total_earned"],
        totalSpent: json["total_spent"],
        earnHistory: List<History>.from(
            json["earn_history"].map((x) => History.fromJson(x))),
        spentHistory: List<History>.from(
            json["spent_history"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_earned": totalEarned,
        "total_spent": totalSpent,
        "earn_history": List<dynamic>.from(earnHistory.map((x) => x.toJson())),
        "spent_history":
            List<dynamic>.from(spentHistory.map((x) => x.toJson())),
      };
}

class History {
  History({
    required this.time,
    required this.value,
  });

  final int time;
  final int value;

  factory History.fromJson(Map<String, dynamic> json) => History(
        time: json["time"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "value": value,
      };
}

class Profile {
  Profile({
    required this.image,
    required this.uid,
    required this.phone,
    required this.name,
    required this.location,
    required this.email,
  });

  final String image;
  final String uid;
  final String phone;
  final String name;
  final Location location;
  final String email;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        image: json["image"],
        uid: json["uid"],
        phone: json["phone"],
        name: json["name"],
        location: Location.fromJson(json["location"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "uid": uid,
        "phone": phone,
        "name": name,
        "location": location.toJson(),
        "email": email,
      };
}

class Location {
  Location({
    required this.address,
    required this.coordinates,
  });

  final String address;
  final GeoPoint coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "coordinates": coordinates,
      };
}
