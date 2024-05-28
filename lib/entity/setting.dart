import 'package:chatgpt_desktop/entity/api_setting.dart';
import 'package:chatgpt_desktop/entity/profile_setting.dart';

class Setting {
  ProfileSetting profileSetting;
  ApiSetting apiSetting;
  Setting({
    required this.profileSetting,
    required this.apiSetting,
  });

  // toJson
  Map<String, dynamic> toJson() => {
    'profileSetting': profileSetting.toJson(),
    'apiSetting': apiSetting.toJson(),
  };

  // fromJson
  static Setting fromJson(Map<String, dynamic> json) {
    return Setting(
      profileSetting: ProfileSetting.fromJson(json['profileSetting']),
      apiSetting: ApiSetting.fromJson(json['apiSetting']),
    );
  }
}