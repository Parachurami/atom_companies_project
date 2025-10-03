// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  final int typeId = 0;

  @override
  CompanyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyModel(
      company_id: fields[0] as String,
      name: fields[1] as String,
      domain: fields[2] as String,
      review_count: fields[3] as String?,
      trust_score: fields[4] as String?,
      rating: fields[5] as int,
      categories: (fields[6] as List?)?.cast<CategoryModel>(),
      phone: fields[7] as String?,
      email: fields[8] as String?,
      website: fields[9] as String?,
      address: fields[10] as String?,
      city: fields[11] as String?,
      country: fields[12] as String?,
      about_company: fields[13] as String?,
      rating_distribution: (fields[14] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.company_id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.review_count)
      ..writeByte(4)
      ..write(obj.trust_score)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.website)
      ..writeByte(10)
      ..write(obj.address)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.country)
      ..writeByte(13)
      ..write(obj.about_company)
      ..writeByte(14)
      ..write(obj.rating_distribution);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
