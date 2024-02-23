import 'package:bloc/bloc.dart';


import 'package:internet_connection_checker/internet_connection_checker.dart';


import 'package:meta/meta.dart';


import 'package:my_cropdata_test/model/assignment_response_model.dart';


import 'package:my_cropdata_test/repository/api_repository.dart';


part 'assignment_data_state.dart';


class AssignmentDataCubit extends Cubit<AssignmentDataState> {

  var apiRepository = ApiRepository();


  List<Platforms> platform = [];


  AssignmentDataCubit() : super(AssignmentDataInitial()) {

    getFarmListData();

  }


  Future<void> getFarmListData() async {

    try {

      bool hasConnection = await InternetConnectionChecker().hasConnection;


      if (hasConnection) {

        emit(AssignmentDataLoading());


        var response = await apiRepository.callDataApi();


        if (response != null) {

          platform = response.data!.platforms!;


          emit(AssignmentDataLoaded());

        } else {

          emit(FailureState(response.message!));

        }

      } else {

        emit(NoInternetState());

      }

    } catch (e) {

      e.toString();

    }

  }

}

