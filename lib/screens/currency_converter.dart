import 'package:currency_converter/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Currencyconverter extends StatefulWidget {
  @override
  _CurrencyconverterState createState() => _CurrencyconverterState();
}

class _CurrencyconverterState extends State<Currencyconverter> {
  TextEditingController textinput = TextEditingController();
  Currency currency;
  List<int> index = [];
  int selectedIndexFrom = 149;
  int selectedIndexTo = 66;
  double converted = -1.0;

  @override
  void initState() {
    super.initState();
    (() async {
      currency = await fetchcurrency();
      for (int i = 0; i < currency.code.length; i++) {
        index.add(i);
      }
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Currency Converter'),
        ),
        // backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                scale: 1.5,
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Amount :',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    child: TextFormField(
                      controller: textinput,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'FROM',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'TO',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton(
                      value: selectedIndexFrom,
                      onChanged: (int val) {
                        setState(() {
                          selectedIndexFrom = val;
                        });
                      },
                      items: index.map((int i) {
                        return DropdownMenuItem(
                          value: i,
                          child: Text(currency.code[i].substring(3)),
                        );
                      }).toList()),
                      
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                        onTap: () {
                          selectedIndexFrom =
                              selectedIndexFrom + selectedIndexTo;
                          selectedIndexTo = selectedIndexFrom - selectedIndexTo;
                          selectedIndexFrom =
                              selectedIndexFrom - selectedIndexTo;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.swap_horizontal_circle,
                          size: 40.0,
                          color: Colors.blue,
                        )),
                  ),
                  DropdownButton(
                      value: selectedIndexTo,
                      onChanged: (int val) {
                        setState(() {
                          selectedIndexTo = val;
                        });
                      },
                      items: index.map((int i) {
                        return DropdownMenuItem(
                          value: i,
                          child: Text(currency.code[i].substring(3)),
                        );
                      }).toList()),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: RaisedButton(
                  onPressed: () {
                    double from = currency.value[selectedIndexFrom].toDouble();
                    double to = currency.value[selectedIndexTo].toDouble();
                    converted = (to / from) * double.parse(textinput.text);
                    setState(() {});
                  },
                  color: Colors.yellowAccent,
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 16.0, color: Colors.black45),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              converted < 0
                  ? Container()
                  : Text('${converted.toStringAsFixed(6)}')
            ],
          ),
        ]));
  }
}
