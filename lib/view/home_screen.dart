import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cropdata_test/cubit/assignment_data_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: BlocConsumer<AssignmentDataCubit, AssignmentDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<AssignmentDataCubit>();
          return Container(
            margin: const EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: cubit.platform.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: Text(
                        index.toString(),
                        style:
                            const TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(
                        cubit.platform[index].name!,
                      ));
                }),
          );
        },
      ),
    );
  }
}
