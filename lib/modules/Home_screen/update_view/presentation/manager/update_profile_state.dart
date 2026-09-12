part of 'update_profile_bloc.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  @override
  List<Object?> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {
  const UpdateProfileInitial();
}

class GetProfileLoading extends UpdateProfileState {
  const GetProfileLoading();
}

class GetProfileSuccess extends UpdateProfileState {
  final UpdateProfileEntity data;

  const GetProfileSuccess({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class UpdateProfileLoading extends UpdateProfileState {
  const UpdateProfileLoading();
}

class UpdateProfileSuccess extends UpdateProfileState {
  const UpdateProfileSuccess();
}

class UpdateProfileError extends UpdateProfileState {
  final String message;

  const UpdateProfileError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class DeleteAccountLoading extends UpdateProfileState {
  const DeleteAccountLoading();
}

class DeleteAccountSuccess extends UpdateProfileState {
  const DeleteAccountSuccess();
}

class DeleteAccountError extends UpdateProfileState {
  final String message;

  const DeleteAccountError(this.message);

  @override
  List<Object?> get props => [message];
}
