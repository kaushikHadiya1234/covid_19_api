import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_19/Screen/Model/covid_Model.dart';
import 'package:covid_19/Screen/Provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CovidProvider? pf;
  CovidProvider? pt;
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<CovidProvider>(context, listen: false);
    pt = Provider.of<CovidProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            title: Text("Covid-19"),
            centerTitle: true,
            actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'search');
            }, icon: Icon(Icons.search))],
          ),
          body: FutureBuilder(
            future: pf!.Getdata(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("lose Conection"));
              } else if (snapshot.hasData) {
                pf!.getDataList(snapshot.data!);
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 23.h),
                  itemBuilder: (context, index) {
                    return Center(
                      child: InkWell(
                         onTap: () {
                           Navigator.pushNamed(context, 'view',arguments: pf!.list[index]);
                         },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 15.h,
                              width: 15.h,
                              // alignment: Alignment.center,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         "${pf!.list[index].countryInfo!.flag}"),
                                  //     fit: BoxFit.fill)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  progressIndicatorBuilder: (context, url, progress) => Center(
                                      child:Image.asset('assets/images/flag.png',width: 10.h,)
                                  ),
                                  imageUrl:'${pt!.list1[index].countryInfo!.flag}',fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${pf!.list[index].country}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: pf!.list.length,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
