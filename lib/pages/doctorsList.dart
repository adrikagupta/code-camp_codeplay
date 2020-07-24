import 'package:flutter/material.dart';
import 'package:foster/models/personModel.dart';
import 'package:foster/services/getPlaceService.dart';

class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  String personId;
  List<PersonDetail>doctors;

  @override
  void initState() { 
    super.initState();
    if(doctors==null){
      LocationService.get().getNearbyDoctors().then((data){
        this.setState(() {
          doctors = data;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Nearby doctors"),
      ),
      body: createList(),
    );
  }

  Widget createList(){
    if(doctors==null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    else{
      return ListView(
        children: doctors.map((ele){
          return Card(
            child: ListTile(
              title: Text(ele.name),
              leading: Image.network(ele.icon),
              subtitle: Text(ele.vicinity),
              onTap: (){
                personId = ele.id;
                
              },
            ),
          );
        }).toList(),
      );
    }
  }
}