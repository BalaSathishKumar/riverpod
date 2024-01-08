import 'package:flutter/material.dart';
import 'package:ofcriverpod/constants/colors.dart';

import '../database/user_db.dart';
import '../models/userReponseModel.dart';

class DetailTab3 extends StatefulWidget {
  const DetailTab3({Key? key}) : super(key: key);

  @override
  State<DetailTab3> createState() => _DetailTab3State();
}

class _DetailTab3State extends State<DetailTab3> {
  Future<List<userResonseModel>>? futureUsers;
  final userDB = UserDB();

  @override
  void initState() {
    super.initState();
    fetchUserDB();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.white,
      body:  Container(

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18),
              Text("These are Sql data."),
              FutureBuilder<List<userResonseModel>>(
                  future: futureUsers,
                  builder: (context,snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }else {

                      if(snapshot.data != null){
                        final users = snapshot.data!;
                        return users.isEmpty ? Center(child: Text("No Users")) :
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: users.length ?? 0,
                            itemBuilder: (context, index) {
                              print('users[index]::: ${users[index].name}');
                                return Padding(
                                padding: const EdgeInsets.all(5),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  title: Text(users[index].name),
                                  subtitle: Text(users[index].stars),
                                ),
                              );
                            });
                      }else{
                        return Center(child: Text("No Users"));
                      }
                    }
                  }),
            ],
          ),
        ),
      )
    );
  }

  void fetchUserDB() {
    setState(() {
      futureUsers = userDB.fetchAll();
      print('db data fetched ${futureUsers}');
    });
  }
}
