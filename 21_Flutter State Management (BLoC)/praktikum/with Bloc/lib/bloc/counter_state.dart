abstract class CounterState {
  List<Map<String,String>> contactList = [];
}

class InitialState extends CounterState {

  InitialState(){
    super.contactList = [
      { 
        'name' : 'Anton',
        'number': '012345678901',
      },
      { 
        'name' : 'Budi',
        'number': '012345678902',
      },
    ];
  }
}

class LoadingState extends CounterState{

  LoadingState(this.newList){
    super.contactList = newList;
  }
  List<Map<String,String>> newList;

}


class LoadedState extends CounterState{}
class FailedState extends CounterState{}
