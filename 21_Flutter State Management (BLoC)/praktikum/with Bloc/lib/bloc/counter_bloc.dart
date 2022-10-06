
import 'package:flutter_application_flutter_state_management_provider/bloc/counter_event.dart';
import 'package:flutter_application_flutter_state_management_provider/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {


    on<AddContactEvent>(
      (event, emit) {
        List<Map<String, String>> tempList = state.contactList;
        tempList.add(event.map);
        emit(LoadingState(tempList));
      }
    );

    on<RemoveContactEvent>(
      (event, emit) {
        List<Map<String, String>> tempList = state.contactList;
        tempList.removeAt(event.index);
        emit(LoadingState(tempList));
      }
    );
  }
}
