// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DbUser _$DbUserFromJson(Map<String, dynamic> json) => DbUser(
      json['userUid'] as String,
    );

Map<String, dynamic> _$DbUserToJson(DbUser instance) => <String, dynamic>{
      'userUid': instance.userUid,
    };

DbMeal _$DbMealFromJson(Map<String, dynamic> json) => DbMeal(
      $enumDecode(_$DbFoodChoiceEnumMap, json['foodChoice']),
      $enumDecode(_$DbMeatPortionEnumMap, json['meatPortion']),
    );

Map<String, dynamic> _$DbMealToJson(DbMeal instance) => <String, dynamic>{
      'foodChoice': _$DbFoodChoiceEnumMap[instance.foodChoice],
      'meatPortion': _$DbMeatPortionEnumMap[instance.meatPortion],
    };

const _$DbFoodChoiceEnumMap = {
  DbFoodChoice.Vegetarian: 'Vegetarian',
  DbFoodChoice.PigPoultryFish: 'PigPoultryFish',
  DbFoodChoice.BeefLambMutton: 'BeefLambMutton',
};

const _$DbMeatPortionEnumMap = {
  DbMeatPortion.empty: 'empty',
  DbMeatPortion.small: 'small',
  DbMeatPortion.normal: 'normal',
  DbMeatPortion.big: 'big',
};

DbDailyActivities _$DbDailyActivitiesFromJson(Map<String, dynamic> json) =>
    DbDailyActivities(
      DbMeal.fromJson(json['breakfast'] as Map<String, dynamic>),
      DbMeal.fromJson(json['lunch'] as Map<String, dynamic>),
      DbMeal.fromJson(json['dinner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DbDailyActivitiesToJson(DbDailyActivities instance) =>
    <String, dynamic>{
      'breakfast': instance.breakfast.toJson(),
      'lunch': instance.lunch.toJson(),
      'dinner': instance.dinner.toJson(),
    };
