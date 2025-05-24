import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/widgets/coffee_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget buildCoffeeType({required String typeName, required int index,VoidCallback? onTap}) {
    bool isSelected = index == selectedCoffeeIndex;
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                typeName,
                style: AppText.large.copyWith(color: isSelected ? AppColor.second : Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
            if (isSelected)
              Icon(
                CupertinoIcons.circle_fill,
                color: AppColor.second,
                size: 10,
              )
          ],
        ),
      ),
    );
  }
  int selectedCoffeeIndex = 0;

  void onCoffeeTypeTap(int i){
    setState(() {
      selectedCoffeeIndex = i;
    });
  }


  @override
  Widget build(BuildContext context) {

    List<String> coffeeType = [ 'Cappucino', 'Black', 'Latte',];

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Card(
                    color: Color.lerp(AppColor.first, Colors.white, 0.1)!,
                    child:  Icon(Icons.widgets)
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Card(
                    color: AppColor.second,
                    child: Icon(Icons.person),
                  ),
                )
              ],
            ),
            Text(
              'Find the best\ncoffee for you',
              style: AppText.xxl,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                hintText: 'Find your coffee...',
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  String name = coffeeType[index];
                  return buildCoffeeType(typeName: name,index: index,onTap:()=> onCoffeeTypeTap(index));
                },
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffees.length,
                itemBuilder: (context, index) {
                  Coffee c = coffees[index];
                  return CoffeeCard(coffee : c);
                },
              ),
            ),
            Text('Special for you',style: AppText.large,),
            SizedBox(
              height: 120,
              child:
              Card(
                child: Container(
                  margin: EdgeInsets.all(9),
                  child: Row(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/latte.jpg',
                            width: 160,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '5 Coffee Beans You Must Try!',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppText.large, // facultatif
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            )
          ],
        ),
      ),
    ));

  }

}
