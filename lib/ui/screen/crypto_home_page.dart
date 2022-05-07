import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:emmi/ui/component.dart';
import 'package:emmi/ui/screen/detail_wallet.dart';
import 'package:emmi/constants/apiservice.dart';


class CryptoHomePage extends StatefulWidget {
  CryptoHomePage({Key? key,required }) : super(key: key);

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: Icon(Icons.notes, color: Colors.black54),
              title: 'Wallets',
              right: Icon(Icons.account_balance_wallet, color: Colors.black54)),
        ),
      ),
     body: RefreshIndicator(
       onRefresh: () {
         setState(() {});

         return ApiService().getAllcrypto();
       },
       child: FutureBuilder(
         future: ApiService().getAllcrypto(),
         builder: (context, AsyncSnapshot snapshot) {
           if(snapshot.hasData) {
             return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (context,index) => Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      _listCryptoItem(
                        iconUrl:'${snapshot.data[index]["image"]}',    
                        myCrypto: '${snapshot.data[index]["name"]}',
                        myBalance: '\$ ${snapshot.data[index]["current_price"]}',
                        myProfit: '\$ ${snapshot.data[index]["high_24h"]}',
                        precent: snapshot.data[index]["price_change_percentage_24h"],
                      ),
                    ],
                  ),
                ),
              ),
                    
           
               ),
               
               );
           }else {
             return Center(
               child: CircularProgressIndicator(),
               
             );
           }
     
         },
         ),
     ),
      
       
       
      
    );
  }

  Widget _listCryptoItem(
      {String? iconUrl,
      double precent = 0,
      String? myCrypto,
      myBalance,
      myProfit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              '$iconUrl',
              width: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '$myCrypto',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '$myProfit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$myBalance',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  precent >= 0 ? '+ $precent %' : '$precent %',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: precent >= 0 ? Colors.green : Colors.pink,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
