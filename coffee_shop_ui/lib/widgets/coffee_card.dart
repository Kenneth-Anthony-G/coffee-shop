import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/screens/detail_screen.dart';
import 'package:coffee_shop/theme/app_color.dart';
import 'package:coffee_shop/theme/app_text.dart';
import 'package:coffee_shop/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(coffee: coffee),)),
      child: SizedBox(
        width: 220,
        child: Card(
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: AssetImage(coffee.image),
                          fit: BoxFit.cover,
                        ))),
                Text(coffee.name,style: AppText.medium,),
                Text(coffee.details,style: AppText.small.copyWith(color: Colors.white.withAlpha(150)),),
                Row(spacing: 4,
                  children: [
                    Text('\$',style: AppText.xl.copyWith(color: AppColor.second),),
                    Text(coffee.price,style: AppText.large,),
                    const Spacer(),
                    CustomButton(child: Icon(Icons.add), color: AppColor.second)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
