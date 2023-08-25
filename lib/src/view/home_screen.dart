import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_scheduler/src/view/schedule_screen.dart';
import 'package:weekly_scheduler/src/view_model/schedule_provider.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<ScheduleProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Home Screen',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16
        ),),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (myModel.message=="Hi Jose you areavailable in ")
              const Text('Please schedule your week',style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),) else Text(myModel.message,style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
              width: MediaQuery.of(context).size.width/1.2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: MediaQuery
                          .of(context)
                          .size
                          .width * (32 / 428),
                        vertical: MediaQuery
                            .of(context)
                            .size
                            .width * (8 / 428),
                      )
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: myModel.message=="Hi Jose you areavailable in "? const Text('Schedule',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,

                ),
                ):const Text('Edit Schedule',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,

                ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ScheduleScreen()
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
