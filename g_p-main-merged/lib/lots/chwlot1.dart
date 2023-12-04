import 'package:flutter/material.dart';
import 'package:g_p/format/LotLayout.dart';
import 'package:flexible/flexible.dart';
import 'package:g_p/pages/dataTesting.dart';
import 'package:get_it/get_it.dart';




class chwlot1 extends StatelessWidget {
   chwlot1({required this.booleanParkingDataList});

   ParkingLot? parkingLot = ParkingLot(
     lotName: "Default Lot",
     lotURL: "https://example.com/default-lot.jpg",
     totalStalls: 0,
     parkingStalls: [],
   );

   Future<ParkingLot> futureParkingLot = ParkingLot().setupDetailed();

   double imageHeight = 1080;
   double imageWidth = 1920;
   int rotation = 0;

   int countAvailable = 0;
   int countOccupied = 0;

   
   List<bool> booleanParkingDataList = [];



   @override
 Widget build(BuildContext context) {


     if (MediaQuery.of(context).orientation == Orientation.portrait ){
       rotation = 0;
     }else{
       rotation = 1;
     }

     for (bool value in booleanParkingDataList) {
      if (value) {
        // true
        countAvailable++;
      } else {
        countOccupied++;
      }
     }


    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('CHW lot1')
      ),
       //

       
       body: SafeArea(
                child: Column(

                  children: [


                   Container(
                     child: FutureBuilder<ParkingLot>(
                       future: futureParkingLot,
                       builder: (context, snapshot) {
                         if (snapshot.connectionState == ConnectionState.waiting) {
                           return CircularProgressIndicator();
                         } else if (snapshot.hasData) {
                           parkingLot = snapshot.data;
                           return Container(
decoration: BoxDecoration(
  border: Border.all(width: 4,),
  borderRadius: BorderRadius.circular(12),
),
                             child: FittedBox(
                               fit: BoxFit.fitHeight,
                               child:RotatedBox(
                                 quarterTurns: rotation,
                                 child: CustomPaint(size: Size(imageWidth, imageHeight),
                                   child: Image.network(parkingLot!.lotURL),// Set the size as per your image dimensions
                                   foregroundPainter: RectanglePainter(
                                     parkingLot!.parkingStalls,
                                     imageWidth,
                                     imageHeight,
                                     booleanParkingDataList,
                                   ),
                                 ),
                               ),
                             ),
                           );
                         } else {
                           return Text('Error: ${snapshot.error}');
                         }
                       },
                     ),
                   ),
                   SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 8),
                                  child: Text(
                                    'Parking Lot Availability',
                                    style: TextStyle(
                                      fontSize: 22,
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),








                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 8),
                                  child: Text(
                                    'Available: ',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    '$countAvailable',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF5AEF39),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    'Occupied: ',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    '$countOccupied',
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFEF393C),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    'Handicapped:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Text(
                                    ' 5',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                  ),
                )
    
                );
       
                
       
  }
}



class RectanglePainter extends CustomPainter {
  final List<ParkingStalls> parkingStalls;
  final double imageWidth;
  final double imageHeight;
  final List<bool> booleanParkingDataList; // List of availability statuses




  RectanglePainter(this.parkingStalls,  this.imageWidth, this.imageHeight, this.booleanParkingDataList);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < parkingStalls.length; i++) {
      final paint = Paint()
        ..style = PaintingStyle.fill;

      final paint2 = Paint()
        ..color = Colors.black87
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0;


      final x = ((parkingStalls[i].x + 2) / imageWidth) * size.width;
      final y = ((parkingStalls[i].y + 2) / imageHeight) * size.height;
      final x2 = (parkingStalls[i].x / imageWidth) * size.width;
      final y2 = (parkingStalls[i].y / imageHeight) * size.height;

      final rect = Rect.fromPoints(Offset(x, y), Offset(x + 27, y + 76));
      final rect2 = Rect.fromPoints(Offset(x2, y2), Offset(x2 + 30, y2 + 80));

      paint.color = booleanParkingDataList[i] ? Colors.green : Colors.red;
      canvas.drawRect(rect, paint);
      canvas.drawRect(rect2, paint2);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}