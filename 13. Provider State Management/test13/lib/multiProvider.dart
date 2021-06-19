import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test13/moneyProvideController.dart';
import 'package:test13/quantityProvideController.dart';

class MultiProvide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoneyProvideController>(
            create: (context) => MoneyProvideController()),
        ChangeNotifierProvider<QuantityProvideController>(
            create: (context) => QuantityProvideController()),
      ],
      child: Scaffold(
        floatingActionButton: Consumer<QuantityProvideController>(
          builder: (context, quantity, _) => Consumer<MoneyProvideController>(
            builder: (context, money, _) => FloatingActionButton(
              onPressed: () {
                if (money.balance >= 500) {
                  money.balance -= 500;
                  quantity.quantity += 1;
                }
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.add_shopping_cart_rounded),
            ),
          ),
        ),
        appBar: new AppBar(
          title: new Text("Multi Provider"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text("Balance"),
                  new Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<MoneyProvideController>(
                        builder: (context, money, _) => new Text(
                          money.balance.toString(),
                          style: new TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    height: 30,
                    width: 150,
                    margin: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green[100],
                        border: Border.all(color: Colors.green, width: 2)),
                  )
                ],
              ),
              new Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Consumer<QuantityProvideController>(
                    builder: (context, quantity, _) => new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Apple (500) x" + quantity.quantity.toString(),
                            style: new TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          new Text(
                            (500 * quantity.quantity).toString(),
                            style: new TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
                height: 30,
                margin: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 2)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
