part of 'update_profile_bloc.dart';

sealed class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends UpdateProfileEvent {
  const GetProfileEvent();
}

class SubmitUpdateProfileEvent extends UpdateProfileEvent {
  final UpdateProfileEntity data;

  const SubmitUpdateProfileEvent({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class DeleteAccountEvent extends UpdateProfileEvent {
  const DeleteAccountEvent();
}