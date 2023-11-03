import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/users_auth.dart';
import 'package:giltezy_2ndproject/service/edit_user_profile.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  @override
  Widget build(BuildContext context) {
    // Initially selected value

    bool isBlocked = false; // Initially not blocked

    final userdata = ref.watch(userprovider);
    return userdata.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final userdetiles = data[index].data() as Map<String, dynamic>;
              final username = userdetiles['user'];
              final userimage = userdetiles['user_image'];
              final useremail = userdetiles['user_email'];
              isBlocked = userdetiles['isBlocked'] ?? false;
              return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, .9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      leading: Container(
                          padding: const EdgeInsets.only(right: 12.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(userimage),
                            backgroundColor: Colors.white,
                          )),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          // const Text(
                          //   "blocked",
                          //   style: TextStyle(
                          //       color: Colors.red, fontWeight: FontWeight.w800),
                          // ),
                        ],
                      ),
                      subtitle: Text(useremail,
                          style: TextStyle(color: Colors.white)),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isBlocked ? Colors.green : Colors.red,
                        ),
                        onPressed: () {
                          updateBlockStatus(data[index].id, !isBlocked);
                          setState(() {
                            isBlocked = !isBlocked;
                          });
                        },
                        child: Text(isBlocked ? 'Unblock' : 'Block'),
                      ),
                    ),
                  ));
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(" is errror");
      },
      loading: () {
        return CircularProgressIndicator();
      },
    );
  }
}
