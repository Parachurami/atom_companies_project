// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:atom_companies_app/app/data/models/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'company_model.g.dart';

@HiveType(typeId: 0)
class CompanyModel {
  @HiveField(0)
  final String company_id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String domain;
  @HiveField(3)
  final String? review_count;
  @HiveField(4)
  final String? trust_score;
  @HiveField(5)
  final dynamic rating;
  @HiveField(6)
  final List<CategoryModel>? categories;
  @HiveField(7)
  final String? phone;
  @HiveField(8)
  final String? email;
  @HiveField(9)
  final String? website;
  @HiveField(10)
  final String? address;
  @HiveField(11)
  final String? city;
  @HiveField(12)
  final String? country;
  @HiveField(13)
  final String? about_company;
  @HiveField(14)
  final Map<String, dynamic>? rating_distribution;
  @HiveField(15)
  final String? logo;
  CompanyModel({
    required this.company_id,
    required this.name,
    required this.domain,
    this.review_count,
    this.trust_score,
    required this.rating,
    this.categories,
    this.phone,
    this.email,
    this.website,
    this.address,
    this.city,
    this.country,
    this.about_company,
    this.rating_distribution,
    this.logo
  });

  CompanyModel copyWith({
    String? company_id,
    String? name,
    String? domain,
    String? review_count,
    String? trust_score,
    dynamic rating,
    List<CategoryModel>? categories,
    String? phone,
    String? email,
    String? website,
    String? address,
    String? city,
    String? country,
    String? about_company,
    Map<String, dynamic>? rating_distribution,
  }) {
    return CompanyModel(
      company_id: company_id ?? this.company_id,
      name: name ?? this.name,
      domain: domain ?? this.domain,
      review_count: review_count ?? this.review_count,
      trust_score: trust_score ?? this.trust_score,
      rating: rating ?? this.rating,
      categories: categories ?? this.categories,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      about_company: about_company ?? this.about_company,
      rating_distribution: rating_distribution ?? this.rating_distribution,
      logo: logo ?? logo
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'company_id': company_id,
      'name': name,
      'domain': domain,
      'review_count': review_count,
      'trust_score': trust_score,
      'rating': rating,
      'categories': categories?.map((x) => x.toMap()).toList(),
      'phone': phone,
      'email': email,
      'website': website,
      'address': address,
      'city': city,
      'country': country,
      'about_company': about_company,
      'rating_distribution': rating_distribution,
      'logo':logo
    };
  }

  factory CompanyModel.fromMap(dynamic map) {
    return CompanyModel(
      company_id: map['company_id'] as String,
      name: map['name'] as String,
      domain: map['domain'] as String,
      review_count: map['review_count']?.toString(),
      trust_score: map['trust_score']?.toString(),
      rating: map['rating'],
      categories: map['categories'] != null ? List<CategoryModel>.from((map['categories'] as List<dynamic>).map<CategoryModel?>((x) => CategoryModel.fromMap(x as Map<String,dynamic>),),) : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      about_company: map['about_company'] != null ? map['about_company'] as String : null,
      rating_distribution: map['rating_distribution'] != null ? Map<String, dynamic>.from((map['rating_distribution'] as Map<String, dynamic>)) : null,
      logo: map['logo'] != null ? map['logo'] as String : null
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyModel(company_id: $company_id, name: $name, domain: $domain, review_count: $review_count, trust_score: $trust_score, rating: $rating, categories: $categories, phone: $phone, email: $email, website: $website, address: $address, city: $city, country: $country, about_company: $about_company, rating_distribution: $rating_distribution)';
  }

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.company_id == company_id &&
      other.name == name &&
      other.domain == domain &&
      other.review_count == review_count &&
      other.trust_score == trust_score &&
      other.rating == rating &&
      listEquals(other.categories, categories) &&
      other.phone == phone &&
      other.email == email &&
      other.website == website &&
      other.address == address &&
      other.city == city &&
      other.country == country &&
      other.about_company == about_company &&
      mapEquals(other.rating_distribution, rating_distribution);
  }

  @override
  int get hashCode {
    return company_id.hashCode ^
      name.hashCode ^
      domain.hashCode ^
      review_count.hashCode ^
      trust_score.hashCode ^
      rating.hashCode ^
      categories.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      website.hashCode ^
      address.hashCode ^
      city.hashCode ^
      country.hashCode ^
      about_company.hashCode ^
      rating_distribution.hashCode;
  }
}
