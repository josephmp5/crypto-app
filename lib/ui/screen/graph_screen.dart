import 'package:emmi/constants/apiservice.dart';
import 'package:emmi/ui/component/appBar.dart';
import 'package:flutter/material.dart';
import 'package:emmi/ui/screen/detail_wallet.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class GraphScreen extends StatelessWidget {
  const GraphScreen({ Key? key }) : super(key: key);

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
     body: FutureBuilder(
         future: ApiService().getAllcrypto(),
         builder: (context, AsyncSnapshot snapshot) {
           if(snapshot.hasData) {
             return SfCartesianChart(
               title: ChartTitle(text: 'Emmi yako'),
              series: ApiService().getAllcrypto(),
              
          

             );
           }
           {
             return CircularProgressIndicator();
           }
         }
     ),


    );

    
  }
}