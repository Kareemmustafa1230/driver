import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/CompledtedOrderResponse.dart';
import 'package:mohamed/ui/ChackCode.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';
import 'package:mohamed/ui/ListOfCompletedOrders.dart';

class CompletedOrders extends StatelessWidget {
  static const String routeName = 'Completed-Orders';

  List<CompledtedData> completeData = [] ;

  CompletedOrders({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => HomeCurrentViewModel()..getComplte(),
       child:  Scaffold(
         appBar: AppBar(
           centerTitle: true,
           backgroundColor: const Color(0xFF7785DB),
           title: const Text('Completed Orders',
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.w500,
               color: Colors.white,
             ),
           ),
         ),
         body:BlocConsumer<HomeCurrentViewModel,CurrentState>(
           listener: (context, state) {
             if (state is CompleteSucessState) {
               completeData.addAll(state.compledtedOrderResponse.data as Iterable<CompledtedData>);
             }
           },
             builder: (context, state) {
               var cubit = HomeCurrentViewModel.get(context);
               if (state is CompleteLoadingState) {
                   return const Center(
                    child: CircularProgressIndicator(),
                     );
                  } else if (state is CompleteSucessState) {
                   return  Column(
                     children: [
                       SizedBox(height: size.height * 0.019),
                       Expanded(
                         child: ListView.builder(
                           itemBuilder: (context, index) {
                             return ListCompletedOrders(compledtedData: completeData[index],);
                           },
                           itemCount:completeData.length ,
                         ),
                       ),
                     ],
                   );
                 } else if (state is CompleteLoadingState) {
                   return CheckCode(text: 'Completed Orders');
                 } else {
                   return Scaffold(
                     body: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Text('Check Your Internet Connection.',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w400)),
                           SizedBox(height: size.height * 0.015),
                           Container(
                             width: 150,
                             height: 60,
                             decoration: BoxDecoration(
                               color: const Color(0xFF7785DB),
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: IconButton(
                               onPressed: () {
                                 cubit.getComplte();
                               },
                               icon: const Text('Try Again',
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500)),
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 }
             },
         ),
       ),
    );
  }
}