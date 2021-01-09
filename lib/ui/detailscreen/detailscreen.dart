import 'package:flutter/material.dart';
import 'package:country_info/model/CountryResponse.dart';
import 'package:country_info/ui/detailscreen/detail-bloc.dart';
import 'package:country_info/utils/string-utils.dart';
import 'package:country_info/widgets/custom_progress_indicator.dart';
import 'package:country_info/theme/style.dart';
import 'package:country_info/utils/image_utils.dart';
import 'package:country_info/utils/color-utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_info/utils/shared-pref-utils.dart';

class DetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  DetailScreenBloc _bloc;
  bool isLoading = true;
  CountryResponse countryResponse = new CountryResponse();

  @override
  void initState() {
    super.initState();
    _bloc = DetailScreenBloc();

    _bloc.countryDetail('');

    _bloc.subject.listen((value) {
      if (value != null) {
        countryResponse = value;
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget listTile(CountryResponse chatData, int index, int length) {
      return Container(
        padding: EdgeInsets.all(5),
      );
    }

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 2;

    return Scaffold(
        backgroundColor: Color(0xffeef2f5),
        appBar: AppBar(
          centerTitle: false,
          title: Text(StringUtils.articleScreen),
        ),
        body: Builder(
            builder: (context) => isLoading
                ? CustomProgressIndicator(isLoading)
                : countryResponse != null
                    ? SingleChildScrollView(
                        child: Stack(children: <Widget>[
                        new Container(
                                margin: EdgeInsets.only(
                                    left: 0.0,
                                    right: 0.0,
                                    bottom: 10.0,
                                    top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          bottom: 10.0,
                                          top: 10.0),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Container(
                                              color: ColorUtils.appColor,
                                              height: 50.0,
                                              width: 50.0,
                                              child: Center(
                                                  child: Text(
                                                countryResponse.alpha2Code,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24),
                                                textAlign: TextAlign.center,
                                              )),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10.0,
                                                right: 0.0,
                                                bottom: 0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  countryResponse.name,
                                                  style: headerNameStyle,
                                                ),
                                                Text(
                                                  countryResponse.capital,
                                                  style: smallNameStyle,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        child: Divider(color: Colors.grey)),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 16.0,
                                          bottom: 16.0),
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          image: DecorationImage(
                                              image: countryResponse.name !=
                                                          null &&
                                                      countryResponse
                                                          .flag.isNotEmpty
                                                  ? NetworkImage(
                                                      'https://flagcdn.com/w320/' +
                                                          countryResponse
                                                              .alpha2Code
                                                              .toLowerCase() +
                                                          '.png')
                                                  : AssetImage(ImageUtils
                                                      .noProfileImage),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        child: Divider(color: Colors.grey)),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10.0,
                                              top: 16.0,
                                              bottom: 16.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: ColorUtils.appColor,
                                            size: 30.0,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20.0,
                                              right: 0.0,
                                              bottom: 0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Region',
                                                style: chatNameStyle,
                                              ),
                                              Text(
                                                countryResponse.region,
                                                style: smallNameStyle,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10.0,
                                              top: 16.0,
                                              bottom: 16.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: ColorUtils.appColor,
                                            size: 30.0,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20.0,
                                              right: 0.0,
                                              bottom: 0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sub-region',
                                                style: chatNameStyle,
                                              ),
                                              Text(
                                                countryResponse.subregion,
                                                style: smallNameStyle,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10.0,
                                              top: 10.0,
                                              bottom: 16.0),
                                          child: Icon(
                                            Icons.location_city,
                                            color: ColorUtils.appColor,
                                            size: 30.0,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20.0,
                                              right: 0.0,
                                              bottom: 0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Capital',
                                                style: chatNameStyle,
                                              ),
                                              Text(
                                                countryResponse.capital,
                                                style: smallNameStyle,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        child: Divider(color: Colors.grey)),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      margin: EdgeInsets.only(
                                          top: 20.0, right: 0.0, bottom: 0.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                          border: Border.all(
                                              width: 3,
                                              color: Colors.green,
                                              style: BorderStyle.solid)),
                                      child: Center(child: Text("Language")),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 20.0,
                                          left: 10.0,
                                          right: 0.0,
                                          bottom: 0.0),
                                      child: GridView.count(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2.0,
                                        mainAxisSpacing: 2.0,
                                        childAspectRatio:
                                            (itemWidth / itemHeight),
                                        controller: new ScrollController(
                                            keepScrollOffset: false),
                                        children: countryResponse.languages
                                            .map((value) {
                                          return Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorUtils.appColor,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: ColorUtils.appColor,
                                                    spreadRadius: 3),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  value.nativeName,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            bottom: 0.0),
                                        child: Divider(color: Colors.grey)),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      margin: EdgeInsets.only(
                                          top: 20.0, right: 0.0, bottom: 0.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                          border: Border.all(
                                              width: 3,
                                              color: Colors.green,
                                              style: BorderStyle.solid)),
                                      child: Center(
                                          child: Text("Border Countries")),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 20.0,
                                          left: 10.0,
                                          right: 0.0,
                                          bottom: 0.0),
                                      height: 90.0,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount:
                                              countryResponse.borders.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                behavior:
                                                    HitTestBehavior.translucent,
                                                onTap: () {
                                                  String textToSend =
                                                      countryResponse
                                                          .borders[index]
                                                          .toLowerCase();
                                                  SharedPrefUtils.setString(
                                                      SharedPrefUtils
                                                          .contryName,
                                                      textToSend);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(),
                                                      ));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: Card(
                                                    color: Colors.blue,
                                                    child: Container(
                                                      child: SvgPicture.network(
                                                        'https://restcountries.eu/data/' +
                                                            countryResponse
                                                                .borders[index]
                                                                .toLowerCase() +
                                                            '.svg',
                                                        placeholderBuilder: (BuildContext
                                                                context) =>
                                                            Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        30.0),
                                                                child:
                                                                    const CircularProgressIndicator()),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                      ]))
                    : Center(
                        child: Text('No Country(s) Available'),
                      )));
  }
}
