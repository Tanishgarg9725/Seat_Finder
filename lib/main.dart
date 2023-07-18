

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: _structure(),debugShowCheckedModeBanner: false,));
  }
}


// ignore: camel_case_types, must_be_immutable
class _seats extends StatelessWidget {
   final int seatNo;

   _seats({required this.seatNo});


  // ignore: non_constant_identifier_names
  List<dynamic> Seats=[//This is a list repersenting all seats and vacant spaces 
  1, 2, 3, 0, 7,
 0, 0, 0, 0, 0,
 4, 5, 6, 0, 8,
 9, 10, 11, 0, 15,
 0, 0, 0, 0, 0,
 12, 13, 14, 0, 16,
 17, 18, 19, 0, 23,
 0, 0, 0, 0, 0,
 20, 21, 22, 0, 24,
 25, 26, 27, 0, 31,
 0, 0, 0, 0, 0,
 28, 29, 30, 0, 32,
 33, 34, 35, 0, 39,
 0, 0, 0, 0, 0,
 36, 37, 38, 0, 40,
 41, 42, 43, 0, 47,
 0, 0, 0, 0, 0,
 44, 45, 46, 0, 48,
 49, 50, 51, 0, 55,
 0, 0, 0, 0, 0,
 52, 53, 54, 0, 56,
 57, 58, 59, 0, 63,
 0, 0, 0, 0, 0,
 60, 61, 62, 0, 64];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Grid Widget
      body: GridView.builder(
        
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),// This is the count set for grid
        
        itemCount: Seats.length,
        
        itemBuilder: (context,index){
          String index1=Seats[index].toString();
          if (Seats[index]==0){
            
            return Padding(
              padding: const EdgeInsets.all(3),
              child: Container(decoration:const BoxDecoration(image: DecorationImage(image: AssetImage('assets/download.jpg')) ) 
             
               ),
            );
          }
          else if (Seats[index]==seatNo){
             return Padding(
              padding: const EdgeInsets.all(3),
               child: Container(decoration:const BoxDecoration(image: DecorationImage(image: AssetImage('assets/seat3Bg.png')) ) 
               ,child: Text(index1),
               ),
             );
          }
          
          else {return Padding(
            padding: const EdgeInsets.all(3),
            child: Container(decoration:const BoxDecoration(image: DecorationImage(image: AssetImage('assets/seat3.png'),))
            ,child: Text(index1),
            
            ),
          );
            }
        }
        ),
    );
  }
}






// ignore: camel_case_types
class _structure extends StatefulWidget {
  
  @override
  State<_structure> createState() => _structureState();
}

// ignore: camel_case_types
class _structureState extends State<_structure> {
  

  int seatNo = 0;
  TextEditingController seatNoController = TextEditingController();

  void updateSeatNo() {
    setState(() {
      seatNo = int.parse(seatNoController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    

    return  Scaffold(
      appBar: AppBar(title: const Text('Seat Finder'),),
      body:   Column(
          children: [

              // Search
              
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    
                    children: [
                     Expanded(
                      //TextFeild
                      child: TextField(
                        controller: seatNoController,
                        decoration:
                                       const InputDecoration(hintText: "Enter Seat no.",
                                                        fillColor:  Color.fromARGB(255, 36, 135, 240),
                                                        filled: true,
                                                        border:OutlineInputBorder()
                                                        ),
                                      textAlign: TextAlign.center,
                                      scrollPadding: const EdgeInsets.all(20),
      
                                      ),
                    ),
                  // search Icon
                  IconButton(
                    icon: const Icon(Icons.search),
                    
                    onPressed: () {
                      updateSeatNo();
                  },)
                    ],
                
                  ),
                ),
              //for Gap
              const SizedBox(height: 30,)
      
            //Seats
            ,Expanded(
              child: _seats(seatNo: seatNo),
              ),
          ],
        ),
      );
    
  }
}



