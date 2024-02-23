part of 'assignment_data_cubit.dart';


@immutable

sealed class AssignmentDataState {}


final class AssignmentDataInitial extends AssignmentDataState {}


final class AssignmentDataLoading extends AssignmentDataState {}


final class AssignmentDataLoaded extends AssignmentDataState {}


final class NoInternetState extends AssignmentDataState {}


final class FailureState extends AssignmentDataState {

  final String msg;


  FailureState(this.msg);

}

