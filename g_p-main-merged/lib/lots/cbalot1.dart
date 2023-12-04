import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



class cbalot1 extends StatelessWidget {
   int countAvailable = 10; // Replace with your actual count
  int countOccupied = 5; // Replace with your actual count






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('CBA lot1')
      ),

      
       body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                 
                  children: [
                    
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                      child: FittedBox(
                        child: Image.network(
                          'https://storage.googleapis.com/getparked/CBA%20lot1.jpg',
                          fit: BoxFit.none,
                          height: 600,
                        ),
                      ),
                    ),
                    

                    Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Parking Lot Availability',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 1,
                  ),
                ),
                
                buildAvailabilityRow('Available:', countAvailable, Color(0xFF5AEF39)),
                buildAvailabilityRow('Occupied:', countOccupied, Color(0xFFEF393C)),
                buildAvailabilityRow('Handicapped:', 5, Colors.blueGrey),
              ],
            ),
          ),
        ),






                    
                  
                  ],
                  ),
                )
              
            );
  }
}

Widget buildAvailabilityRow(String label, int count, Color textColor) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
          child: Text(
            '$count',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
