import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payoll/core/constants/color_constants.dart';
import 'package:payoll/core/constants/status_bar_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listServices = [
      "Pulsa & Data",
      "Uang Elektronik",
      "Games",
      "Air",
      "Listrik PLN",
      "Internet & TV Kabel",
      "Pendidikan",
      "Lainnya"
    ];

    final iconServices = [
      "pulsa_data.svg",
      "uang_elektronik.svg",
      "game.svg",
      "water.svg",
      "pln.svg",
      "wifi.svg",
      "education.svg",
      "other.svg",
    ];
    return Scaffold(
      backgroundColor: ColorConstants.primary500,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/home_vector.svg',
            width: 1.sw,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.05.sh),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang,',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'George Lee',
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/payoll_white_logo.png',
                      height: 48,
                      width: 48,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Stack(
                children: [
                  Positioned(
                    // top: 100,
                    top: 0.23.sh,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20))),
                      width: 1.sw,
                      // height: 1.sh,
                      child: Column(
                        children: [
                          SizedBox(height: 200),
                          Text('data'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.1), // Adjust color and opacity
                            offset: Offset(0, 3), // Only vertical shadow
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(-3, 0), // Left shadow
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(3, 0), // Right shadow
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: GridView.count(
                      padding: EdgeInsets.all(16.0),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                      children: List.generate(
                        listServices.length,
                        (i) {
                          return Column(
                            children: [
                              Container(
                                width: 0.15.sw,
                                height: 0.15.sw,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFAFAFA),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SvgPicture.asset(
                                    'assets/images/${iconServices[i]}',
                                  ),
                                ),
                              ),
                              Text(
                                listServices[i],
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.0),
                            Text(
                              'Belanja Makin Hemat!!!',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Dapetin diskon dan harga spesial nya di PayOll sekarang sebelum kehabisan!!!",
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 0.2.sh,
                          enableInfiniteScroll: false,
                          padEnds: false,
                        ),
                        items: [1, 2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: i == 1 ? 16.0 : 0.0, right: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/slide.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Riwayat Transaksi',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Lihat Semua',
                              style: TextStyle(
                                color: ColorConstants.primary500,
                                fontSize: 13.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 0.15.sw,
                                  height: 0.15.sw,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SvgPicture.asset(
                                      'assets/images/${iconServices[0]}',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pulsa & Data'),
                                    Text('Order Id: ***04d0'),
                                    Text('14 No 2022 - 06:30')
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16.0),
                              child: Column(
                                children: [
                                  Container(child: Text('Berhasil')),
                                  Text('Rp. 25.000')
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 64,
              width: 1.sw,
              color: Color(0xFFFDFDFD),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: ColorConstants.primary500,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Beranda',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConstants.primary500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(Icons.history_sharp)),
                      Text('Riwayat')
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(Icons.person_2_outlined)),
                      Text('Profil')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
