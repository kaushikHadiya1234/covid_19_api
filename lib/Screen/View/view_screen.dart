import 'package:covid_19/Screen/Model/covid_Model.dart';
import 'package:covid_19/Screen/Provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  CovidProvider? pf;
  CovidProvider? pt;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<CovidProvider>(context, listen: false);
    pt = Provider.of<CovidProvider>(context, listen: true);
    CovidModel data =ModalRoute.of(context)!.settings.arguments as CovidModel;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            child: Image.asset(
              'assets/images/bc.png',
              fit: BoxFit.fill,
              opacity: Animation.fromValueListenable(ValueNotifier(50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(alignment: Alignment.center,child: Text("${data.country}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.red[900]),),),
                SizedBox(height: 10),
                Custom('Cases', '${data.todayCases}'),
                SizedBox(height: 10),
                Custom('TodayCases', '${data.todayCases}'),
                SizedBox(height: 10),
                Custom('Deaths', '${data.deaths}'),
                SizedBox(height: 10),
                Custom('TodayDeaths', '${data.todayDeaths}'),
                SizedBox(height: 10),
                Custom('recovered', '${data.recovered}'),
                SizedBox(height: 10),
                Custom('TodayRecovered', '${data.todayRecovered}'),
                SizedBox(height: 10),
                Custom('Active', '${data.active}'),
                SizedBox(height: 10),
                Custom('Critical', '${data.critical}'),
                SizedBox(height: 10),
                Custom('CasesPerOneMillion', '${data.casesPerOneMillion}'),
                SizedBox(height: 10),
                Custom('DeathsPerOneMillion', '${data.deathsPerOneMillion}'),
                SizedBox(height: 10),
                Custom('Tests', '${data.tests}'),
                SizedBox(height: 10),
                Custom('Population', '${data.population}'),
                SizedBox(height: 10),
                Custom('continent', '${data.continent}'),
              ],
            ),
          )
        ],
      ),
    ));
  }
Widget Custom(String? name,String? value)
{
  return  Row(
    children: [
      Text("$name : ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.black),),
      Text("$value",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.teal),maxLines: 1,),
    ],
  );
}
}
