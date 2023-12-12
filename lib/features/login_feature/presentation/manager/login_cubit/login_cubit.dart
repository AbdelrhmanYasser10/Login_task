import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());


  static LoginCubit get(context)=>BlocProvider.of(context);

  void login({
  required String email,
  required String password,
  })async{
    emit(LoginLoading());
    // login and store result to the repository
    var result = await loginRepo.loginFn(email, password);
    result.fold((failure) {
      // Error
      emit(LoginError(failure.errMessage));

    }, (model) //model contain token and its type
    {
      emit(LoginSuccessfully(model.token));
    });
  }

}
