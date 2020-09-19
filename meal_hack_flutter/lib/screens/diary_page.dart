import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
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
