abstract class CounterEvent {}

class AddContactEvent extends CounterEvent{
  AddContactEvent(this.map);

  Map<String, String> map;
}

class RemoveContactEvent extends CounterEvent{
  RemoveContactEvent(this.index);

  int index;
}