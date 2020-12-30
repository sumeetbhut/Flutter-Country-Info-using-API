import 'package:country_info/utils/color-utils.dart';
import 'package:flutter/material.dart';
import 'package:country_info/model/CountryResponse.dart';
import 'package:country_info/theme/style.dart';
import 'package:country_info/ui/homescreen/home-bloc.dart';
import 'package:country_info/ui/detailscreen/detailscreen.dart';
import 'package:country_info/utils/image_utils.dart';
import 'package:country_info/utils/shared-pref-utils.dart';
import 'package:country_info/utils/EnterExitRoute.dart';
import 'package:country_info/widgets/custom_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc _bloc;
  bool isLoading = true;
  bool isSearch = false;
  List<CountryResponse> chatDataList = new List();
  List<CountryResponse> chatDataListSearch = new List();
  TextEditingController _textController = TextEditingController();

  String userId;
  String type;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  @override
  void initState() {
    super.initState();
    _bloc = HomeScreenBloc();

    _bloc.countryList();

    _bloc.subject.listen((value) {
      if (value != null) {
        chatDataList.clear();
        chatDataListSearch.clear();
        for (CountryResponse chat in value) {
          setState(() {
            chatDataList.add(chat);
            chatDataListSearch.add(chat);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  onItemChanged(String value) {
    chatDataListSearch.clear();
    setState(() {
      chatDataListSearch = chatDataList
          .where((string) =>
              string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget listTile(CountryResponse chatData, int index, int length) {
      return Container(
        padding: EdgeInsets.all(5),
        /* decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 4,
                spreadRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(12)),*/
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: chatData.name != null && chatData.flag.isNotEmpty
                          ? NetworkImage('https://flagcdn.com/w320/' +
                              chatData.alpha2Code.toLowerCase() +
                              '.png')
                          : AssetImage(ImageUtils.noProfileImage),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatData.name,
                    style: chatNameStyle,
                  ),
                  Text(
                    chatData.capital,
                    style: chatEmailStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffeef2f5),
      appBar: AppBar(
        title: Text("Country"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorUtils.appColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorUtils.appColor, width: 2.0),
                ),
                border: UnderlineInputBorder(
                    borderRadius:BorderRadius.circular(15.0)),
                hintText: 'Search Country...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return _bloc.countryList();
              },
              child: isLoading
                      ? CustomProgressIndicator(isLoading)
                      : chatDataListSearch != null && chatDataListSearch.length > 0
                          ? Expanded(
                              child: new ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                color: Colors.grey,
                              ),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(10),
                              itemCount: chatDataListSearch.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      print(
                                          'country' + chatDataListSearch[index].name);

                                      String textToSend = chatDataListSearch[index]
                                          .alpha2Code
                                          .toLowerCase();
                                      SharedPrefUtils.setString(
                                          SharedPrefUtils.contryName,
                                          textToSend);
                                     /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailScreen(),
                                          ));*/

                                      Navigator.push(context,
                                          EnterExitRoute(exitPage: HomeScreen(), enterPage: DetailScreen()));
                                    },
                                    child: listTile(chatDataListSearch[index], index,
                                        chatDataListSearch.length));
                              },
                            ))
                          : Center(
                              child: Text('No Country(s) Available'),
                            ),
            ),
          ),
        ],
      ),
    );
  }
}
