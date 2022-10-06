import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_state_management_provider/add_contact_page.dart';
import 'package:flutter_application_flutter_state_management_provider/bloc/counter_bloc.dart';
import 'package:flutter_application_flutter_state_management_provider/bloc/counter_event.dart';
import 'package:flutter_application_flutter_state_management_provider/bloc/counter_state.dart';
import 'package:flutter_application_flutter_state_management_provider/common_tool/initial_size.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_app_bar.dart';
import 'package:flutter_application_flutter_state_management_provider/common_widget/my_fab.dart';
import 'package:flutter_application_flutter_state_management_provider/my_list_view_contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    InitialSize(this);

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: const Text('Contacts'),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return MyListViewContact(
              contactList: state.contactList,
            );
          },
        ),
      ),
      floatingActionButton: MyFAB(
        onTap: () async {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddContactPage(),
              ));
          if (result is Map<String, String>) {
            if (mounted){
              context.read<CounterBloc>().add(AddContactEvent(result));
            }
            // setState(() {});
          }
        },
        icon: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
