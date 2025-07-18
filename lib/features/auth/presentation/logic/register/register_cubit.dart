import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/features/auth/domain/usecases/register_usecase.dart';
import 'package:wink/features/auth/presentation/logic/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  Future<void> register(RegisterParams params) async {
    emit(state.copyWith(status: RegisterStatus.loading));

    final result = await sl<RegisterUsecase>().call(param: params);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: RegisterStatus.failure,
          message: error.toString(), // Handle error appropriately
        ));
      },
      (success) {
        emit(state.copyWith(
          status: RegisterStatus.success,
          message: "El usuario fue registrado correctamente"
          //message: "تم إنشاء حسابك بنجاح", // Adjust based on response
        ));
      },
    );
  }
}
