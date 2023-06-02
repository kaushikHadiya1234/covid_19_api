import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_19/Screen/Provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CovidProvider? pf;
  CovidProvider? pt;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<CovidProvider>(context, listen: false);
    pt = Provider.of<CovidProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  pf!.searchFilter(value);
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child:
              Consumer<CovidProvider>(
                builder: (context, provider, child) => ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'view',arguments: pf!.list1[index]);
                      },
                      child: ListTile(
                        leading: SizedBox(width:50,child: Image.network("${provider.list1[index].countryInfo!.flag}",)),
                        // leading: CachedNetworkImage(
                        //   progressIndicatorBuilder: (context, url, progress) => Center(
                        //     child:Image.asset('assets/images/flag.png')
                        //   ),
                        //   imageUrl:'${provider.list1[index].countryInfo!.flag}',width: 50,),
                        title: Text("${provider.list1[index].country!}"),
                      ),
                    );
                  },
                  itemCount: provider.list1.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
