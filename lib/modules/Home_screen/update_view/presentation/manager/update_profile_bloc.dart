import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/Network/api_results.dart';
import '../../../../layout/profile/presentation/manager/profile_bloc.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/data_source/update_profile_data_source_interface.dart';
import '../../data/repository_implementation/update_profile_repository_imp.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../../domain/repository/update_profile_repository.dart';
import '../../domain/use_case/delete_account_use_case.dart';
import '../../domain/use_case/get_profile_use_case.dart';
import '../../domain/use_case/update_profile_use_case.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';
class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {

  UpdateProfileBloc() : super(const UpdateProfileInitial()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<SubmitUpdateProfileEvent>(_onUpdateProfileEvent);
    on<DeleteAccountEvent>(_onDeleteAccountEvent);
  }

  FutureOr<void> _onGetProfileEvent(
      GetProfileEvent event,
      Emitter<UpdateProfileState> emit,
      ) async {
    emit(const GetProfileLoading());

    final result = await GetIt.I<GetProfileUseCase>().execute();

    switch (result) {
      case SuccessRequest():
        emit(
          GetProfileSuccess(
            data: result.data,
          ),
        );

      case FailureRequest():
        emit(
          UpdateProfileError(
            message: result.exception.message ?? 'Unknown error',
          ),
        );
    }
  }

  FutureOr<void> _onUpdateProfileEvent(
      SubmitUpdateProfileEvent event,
      Emitter<UpdateProfileState> emit,
      ) async {
    emit(const UpdateProfileLoading());

    final result = await GetIt.I<UpdateProfileUseCase>().execute(
      data: event.data,
    );

    switch (result) {
      case SuccessRequest():
        emit(const UpdateProfileSuccess());

        add(const GetProfileEvent());

        GetIt.I<ProfileBloc>().add(
           GetProfileDataEvent(),
        );
      case FailureRequest():
        emit(
          UpdateProfileError(
            message: result.exception.message ?? 'Update failed',
          ),
        );
    }
  }

  FutureOr<void> _onDeleteAccountEvent(
      DeleteAccountEvent event,
      Emitter<UpdateProfileState> emit,
      ) async {
    emit(const DeleteAccountLoading());

    final result = await GetIt.I<DeleteAccountUseCase>().execute();

    switch (result) {
      case SuccessRequest():
        emit(const DeleteAccountSuccess());

      case FailureRequest():
        emit(
          DeleteAccountError(
            result.exception.message ?? 'Delete failed',
          ),
        );
    }
  }
}