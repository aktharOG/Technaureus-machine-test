// To parse this JSON data, do
//
//     final matchesModel = matchesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'matches_model.g.dart';

MatchesModel matchesModelFromJson(String str) => MatchesModel.fromJson(json.decode(str));

String matchesModelToJson(MatchesModel data) => json.encode(data.toJson());

@JsonSerializable()
class MatchesModel {
    @JsonKey(name: "resp_code")
    final int? respCode;
    @JsonKey(name: "data")
    final List<Datum>? data;
    @JsonKey(name: "message")
    final String? message;

    MatchesModel({
        this.respCode,
        this.data,
        this.message,
    });

    factory MatchesModel.fromJson(Map<String, dynamic> json) => _$MatchesModelFromJson(json);

    Map<String, dynamic> toJson() => _$MatchesModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "user")
    final User? user;
    @JsonKey(name: "current_user")
    final int? currentUser;
    @JsonKey(name: "customer_uid")
    final String? customerUid;
    @JsonKey(name: "profile_creation_for")
    final String? profileCreationFor;
    @JsonKey(name: "dob")
    final DateTime? dob;
    @JsonKey(name: "gender")
    final String? gender;
    @JsonKey(name: "fair")
    final String? fair;
    @JsonKey(name: "profile_video")
    final dynamic profileVideo;
    @JsonKey(name: "address")
    final dynamic address;
    @JsonKey(name: "corporation")
    final dynamic corporation;
    @JsonKey(name: "ward_number")
    final dynamic wardNumber;
    @JsonKey(name: "document_type")
    final dynamic documentType;
    @JsonKey(name: "document_number")
    final dynamic documentNumber;
    @JsonKey(name: "document_file")
    final dynamic documentFile;
    @JsonKey(name: "height")
    final int? height;
    @JsonKey(name: "weight")
    final int? weight;
    @JsonKey(name: "social_media_account")
    final String? socialMediaAccount;
    @JsonKey(name: "physically_challenged")
    final String? physicallyChallenged;
    @JsonKey(name: "about_family")
    final String? aboutFamily;
    @JsonKey(name: "citizenship")
    final dynamic citizenship;
    @JsonKey(name: "ancestral_origin")
    final dynamic ancestralOrigin;
    @JsonKey(name: "annual_income")
    final String? annualIncome;
    @JsonKey(name: "college_name")
    final dynamic collegeName;
    @JsonKey(name: "is_prime")
    final bool? isPrime;
    @JsonKey(name: "interest_in_intercast")
    final bool? interestInIntercast;
    @JsonKey(name: "latitude")
    final dynamic latitude;
    @JsonKey(name: "longitude")
    final dynamic longitude;
    @JsonKey(name: "location")
    final dynamic location;
    @JsonKey(name: "tell_us_about_you")
    final String? tellUsAboutYou;
    @JsonKey(name: "horoscope")
    final dynamic horoscope;
    @JsonKey(name: "horoscope_birth_date")
    final dynamic horoscopeBirthDate;
    @JsonKey(name: "horoscope_birth_time")
    final dynamic horoscopeBirthTime;
    @JsonKey(name: "place_of_birth")
    final String? placeOfBirth;
    @JsonKey(name: "star")
    final String? star;
    @JsonKey(name: "raasi")
    final String? raasi;
    @JsonKey(name: "completed_pages")
    final String? completedPages;
    @JsonKey(name: "created_date")
    final DateTime? createdDate;
    @JsonKey(name: "created_time")
    final String? createdTime;
    @JsonKey(name: "modified_date")
    final DateTime? modifiedDate;
    @JsonKey(name: "modified_time")
    final String? modifiedTime;
    @JsonKey(name: "flag")
    final bool? flag;
    @JsonKey(name: "is_verified")
    final bool? isVerified;
    @JsonKey(name: "device_id")
    final dynamic deviceId;
    @JsonKey(name: "deactivate_options")
    final dynamic deactivateOptions;
    @JsonKey(name: "deactivated_date")
    final dynamic deactivatedDate;
    @JsonKey(name: "last_seen")
    final DateTime? lastSeen;
    @JsonKey(name: "religion")
    final int? religion;
    @JsonKey(name: "caste")
    final int? caste;
    @JsonKey(name: "sub_caste")
    final int? subCaste;
    @JsonKey(name: "education")
    final dynamic education;
    @JsonKey(name: "employed_in")
    final dynamic employedIn;
    @JsonKey(name: "occupation")
    final dynamic occupation;
    @JsonKey(name: "work_country")
    final dynamic workCountry;
    @JsonKey(name: "work_state")
    final dynamic workState;
    @JsonKey(name: "work_city")
    final dynamic workCity;
    @JsonKey(name: "country")
    final int? country;
    @JsonKey(name: "state")
    final int? state;
    @JsonKey(name: "city")
    final int? city;
    @JsonKey(name: "mother_toungue")
    final dynamic motherToungue;
    @JsonKey(name: "physical_status")
    final dynamic physicalStatus;
    @JsonKey(name: "body_type")
    final dynamic bodyType;
    @JsonKey(name: "eating_habit")
    final dynamic eatingHabit;
    @JsonKey(name: "drinking_habit")
    final dynamic drinkingHabit;
    @JsonKey(name: "smoking_habit")
    final dynamic smokingHabit;
    @JsonKey(name: "family_value")
    final dynamic familyValue;
    @JsonKey(name: "family_type")
    final dynamic familyType;
    @JsonKey(name: "family_status")
    final dynamic familyStatus;
    @JsonKey(name: "marital_status")
    final dynamic maritalStatus;
    @JsonKey(name: "father_employement")
    final dynamic fatherEmployement;
    @JsonKey(name: "mother_employement")
    final dynamic motherEmployement;
    @JsonKey(name: "father_occupation")
    final dynamic fatherOccupation;
    @JsonKey(name: "mother_occupation")
    final dynamic motherOccupation;
    @JsonKey(name: "father_education")
    final dynamic fatherEducation;
    @JsonKey(name: "mother_education")
    final dynamic motherEducation;
    @JsonKey(name: "interest_category")
    final List<dynamic>? interestCategory;
    @JsonKey(name: "interests")
    final List<dynamic>? interests;
    @JsonKey(name: "interest_status")
    final InterestStatus? interestStatus;
    @JsonKey(name: "short_listed")
    final bool? shortListed;

    Datum({
        this.id,
        this.user,
        this.currentUser,
        this.customerUid,
        this.profileCreationFor,
        this.dob,
        this.gender,
        this.fair,
        this.profileVideo,
        this.address,
        this.corporation,
        this.wardNumber,
        this.documentType,
        this.documentNumber,
        this.documentFile,
        this.height,
        this.weight,
        this.socialMediaAccount,
        this.physicallyChallenged,
        this.aboutFamily,
        this.citizenship,
        this.ancestralOrigin,
        this.annualIncome,
        this.collegeName,
        this.isPrime,
        this.interestInIntercast,
        this.latitude,
        this.longitude,
        this.location,
        this.tellUsAboutYou,
        this.horoscope,
        this.horoscopeBirthDate,
        this.horoscopeBirthTime,
        this.placeOfBirth,
        this.star,
        this.raasi,
        this.completedPages,
        this.createdDate,
        this.createdTime,
        this.modifiedDate,
        this.modifiedTime,
        this.flag,
        this.isVerified,
        this.deviceId,
        this.deactivateOptions,
        this.deactivatedDate,
        this.lastSeen,
        this.religion,
        this.caste,
        this.subCaste,
        this.education,
        this.employedIn,
        this.occupation,
        this.workCountry,
        this.workState,
        this.workCity,
        this.country,
        this.state,
        this.city,
        this.motherToungue,
        this.physicalStatus,
        this.bodyType,
        this.eatingHabit,
        this.drinkingHabit,
        this.smokingHabit,
        this.familyValue,
        this.familyType,
        this.familyStatus,
        this.maritalStatus,
        this.fatherEmployement,
        this.motherEmployement,
        this.fatherOccupation,
        this.motherOccupation,
        this.fatherEducation,
        this.motherEducation,
        this.interestCategory,
        this.interests,
        this.interestStatus,
        this.shortListed,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class InterestStatus {
    InterestStatus();

    factory InterestStatus.fromJson(Map<String, dynamic> json) => _$InterestStatusFromJson(json);

    Map<String, dynamic> toJson() => _$InterestStatusToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "username")
    final String? username;
    @JsonKey(name: "first_name")
    final String? firstName;
    @JsonKey(name: "last_name")
    final String? lastName;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "phone")
    final String? phone;
    @JsonKey(name: "country_code")
    final dynamic countryCode;

    User({
        this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.countryCode,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
