import 'package:flutter/material.dart';

class GroceriesPage extends StatelessWidget {
  // Future<void> _delete(BuildContext context, Job job) async {
  //   try {
  //     final database = Provider.of<Database>(context, listen: false);
  //     await database.deleteJob(job);
  //   } on PlatformException catch (e) {
  //     PlatformExceptionAlertDialog(title: 'Failed to create job', exception: e)
  //         .show(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries'),
        centerTitle: true,
        actions: [
          IconButton(
            key: Key('addJobIconButton'),
            icon: Icon(Icons.add),
            // onPressed: () => EditJobPage.show(context, database: database),
          ),
        ],
      ),
      // body: _buildContent(context, database),
      // bottomNavigationBar: ,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _buildFab(
      //     context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Widget _buildContent(BuildContext context, Database database) {
  //   return StreamBuilder<List<Job>>(
  //     stream: database.jobsStream(),
  //     builder: (context, snapshot) {
  //       return ListItemsBuilder<Job>(
  //         snapshot: snapshot,
  //         itemBuilder: (context, job) => Dismissible(
  //           key: Key('job-${job.id}'),
  //           background: Container(
  //             color: Colors.red,
  //           ),
  //           direction: DismissDirection.endToStart,
  //           onDismissed: (_) => _delete(context, job),
  //           child: JobListTile(
  //             job: job,
  //             onTap: () => JobEntriesPage.show(
  //               context,
  //               job,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
