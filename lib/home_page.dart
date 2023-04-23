// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haalchaal/getLocation.dart';
import 'package:haalchaal/weatherData.dart';
import 'package:intl/intl.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    // var position = await GetPosition();
    data = await client.getData('44.34', '10.99');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: ((context, snapshot) {
        return Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.75,
                width: size.width,
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff955cd1),
                      Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.85],
                  ),
                ),
                child: Column(
                  children: [
                    Text('${data?.cityName}',
                        style: GoogleFonts.hubballi(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 35,
                        )),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      dateFormat,
                      style: GoogleFonts.montserrat(
                          color: Colors.white.withOpacity(0.9), fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    // Image.asset(
                    //   'assets/img/sun.png.png',
                    //   width: size.width * 0.4,
                    // ),
                    Image.network(
                      'https:${data?.icon}',
                      width: size.width * 0.36,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${data?.condition}',
                      style: GoogleFonts.hubballi(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w800,
                          fontSize: 45),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${data?.temp}°',
                      style: GoogleFonts.hubballi(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w800,
                          fontSize: 75),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/storm.png.png',
                                width: size.width * 0.15,
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.wind} km/h',
                                style: GoogleFonts.hubballi(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Wind',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/4005831.png',
                                width: size.width * 0.15,
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.humidity}',
                                style: GoogleFonts.hubballi(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Humidity',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/flag.png.png',
                                width: size.width * 0.15,
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.wind_dir}',
                                style: GoogleFonts.hubballi(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Wind Direction',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Gust',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.5),
                            //fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.gust} kp/m',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pressure',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.5),
                            //fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.pressure} hpa',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'UV',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.5),
                            //fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.uv}',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Precipitation',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.5),
                            //fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.pricipe} mm',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Wind',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.5),
                            //fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.wind} km/h',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Last Update',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.5),
                            //fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.last_update}',
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 63, 195, 67),
                            //fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        );
      }),
    ));
  }
}
