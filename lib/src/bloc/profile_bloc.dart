import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/profile_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/subjects.dart';

class ProfileBlock {
  final ApiProvider apiProvider = ApiProvider();

  final _fetchProfile = PublishSubject<ProfileModel>();
  final _fetchGender = PublishSubject<ProfileModel>();
  final _fetchBirthday = PublishSubject<ProfileModel>();
  final _fetchPhoneNumber = PublishSubject<ProfileModel>();
  final _fetchFlName = PublishSubject<ProfileModel>();

  Stream<ProfileModel> get getProfile => _fetchProfile.stream;

  Stream<ProfileModel> get getGender => _fetchGender.stream;

  Stream<ProfileModel> get getBirthday => _fetchBirthday.stream;

  Stream<ProfileModel> get getFlName => _fetchFlName.stream;

  allProfile() async {
    HttpResult responseProfileDetail = await apiProvider.getProfile();
    if (responseProfileDetail.isSuccess) {
      ProfileModel profileModel =
          ProfileModel.fromJson(responseProfileDetail.result);
      _fetchProfile.sink.add(profileModel);
    }
  }

  allGender(String gender) async {
    HttpResult responseSetGender = await apiProvider.setGender(gender);
    if (responseSetGender.isSuccess) {
      ProfileModel profileModel =
          ProfileModel.fromJson(responseSetGender.result);
      _fetchGender.sink.add(profileModel);
    }
  }

  allBirthday(String bday) async {
    HttpResult responseSetBirthday = await apiProvider.setBirthday(bday);
    if (responseSetBirthday.isSuccess) {
      ProfileModel profileModel =
          ProfileModel.fromJson(responseSetBirthday.result);
      _fetchBirthday.sink.add(profileModel);
    }
  }

  allPhoneNumber(String number) async {
    HttpResult responsePhoneNumber = await apiProvider.setPhoneNumber(number);
    if (responsePhoneNumber.isSuccess) {
      ProfileModel profileModel =
          ProfileModel.fromJson(responsePhoneNumber.result);
      _fetchPhoneNumber.sink.add(profileModel);
    }
  }

  allFlName(String fn, String ln) async {
    HttpResult responseFlName = await apiProvider.setName(fn, ln);
    if (responseFlName.isSuccess) {
      ProfileModel profileModel = ProfileModel.fromJson(responseFlName.result);
      _fetchFlName.sink.add(profileModel);
    }
  }
}

final profileBlock = ProfileBlock();
