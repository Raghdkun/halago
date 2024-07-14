import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  final IconData icon1 ; 
  final IconData icon2 ; 
  final IconData icon3 ; 
  final IconData icon4 ; 
  final IconData icon5 ; 
  final IconData icon6 ; 
  final IconData icon7 ; 
  final String name1 ; 
  final String name2 ; 
  final String name3 ; 
  final String name4 ; 
  final String name5 ; 
  final String name6 ; 
  final String name7 ; 
  final void Function()? onTap1 ; 
  final void Function()? onTap2 ; 
  final void Function()? onTap3 ; 
  final void Function()? onTap4 ; 
  final void Function()? onTap5 ; 
  final void Function()? onTap6 ; 
  final void Function()? onTap7 ; 




  const DrawerPage({super.key, required this.icon1, required this.icon2, required this.icon3, required this.icon4, required this.icon5, required this.icon6, required this.icon7, required this.name1, required this.name2, required this.name3, required this.name4, required this.name5, required this.name6, required this.name7, this.onTap1, this.onTap2, this.onTap3, this.onTap4, this.onTap5, this.onTap6, this.onTap7});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 2.9,
                  // width: Get.width,
                ),
                InkWell(
                  onTap: onTap1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon1), 
                        //FontAwesomeIcons.house
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          name1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25,), 
                InkWell(
                  onTap: onTap2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon2),
                        //FontAwesomeIcons.wallet
                      ),
                      
                      Expanded(
                        flex: 3,
                        child: Text(
                          name2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25,), 
                InkWell(
                  onTap: onTap3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon3),
                        //FontAwesomeIcons.clockRotateLeft
                      ),
                      
                      Expanded(
                        flex: 3,
                        child: Text(
                          name3,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                 SizedBox(height: 25,), 
                InkWell(
                  onTap:onTap4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon4),
                        //FontAwesomeIcons.bell
                      ),
                      
                      Expanded(
                        flex: 3,
                        child: Text(
                          name4,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                 SizedBox(height: 25,), 
                InkWell(
                  onTap:onTap5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon5),
                        //FontAwesomeIcons.gift
                      ),
                      
                      Expanded(
                        flex: 3,
                        child: Text(
                          name5,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                 SizedBox(height: 25,), 
                InkWell(
                  onTap: onTap6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon6),
                        //FontAwesomeIcons.arrowUpRightDots
                      ),
                      
                      Expanded(
                        flex: 3,
                        child: Text(
                          name6,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                 SizedBox(height: 25,), 
                InkWell(
                  onTap:onTap7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon7),
                        // FontAwesomeIcons.arrowRightFromBracket
                      ),
                      
                      Expanded(
                        flex: 3,
                        child: Text(
                          name7,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          );
  }
}