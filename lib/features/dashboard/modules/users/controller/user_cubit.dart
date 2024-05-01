import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/dashboard/modules/users/model/repo/firebase_data.dart';
import 'package:flutter_application_1/features/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:flutter_application_1/features/dashboard/modules/users/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading()) {
    init();
  }

  List<UserModel> users = [];
  Future<void> init() async {
    emit(UserLoading());
    // users = await (await DatabaseRepo.instance).fetch();
    users = (await FirebaseRepo.instance.fetch()).cast<UserModel>();
    if (users.isEmpty) {
      emit(UserEmpty());
    } else {
      emit(UserLoaded());
    }
  }
}