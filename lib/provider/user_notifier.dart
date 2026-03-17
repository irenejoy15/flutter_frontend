import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/user_details_model.dart';

class UserNotifier extends Notifier<UserDetailsModel>{
  @override
  
  UserDetailsModel build() {
    return UserDetailsModel(fullName: '', email: '', userId: '', state: '', city: '', locality: '', idToken: '');
  }

  void setUserDetails(UserDetailsModel user) {
    state = user;
  }

}

final userProvider = NotifierProvider<UserNotifier, UserDetailsModel?>((){
  return UserNotifier();
});