import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

import '../Address_Screen/Address_Screen.dart';


class BuyConformScreen extends StatefulWidget {



  @override
  State<BuyConformScreen> createState() => _BuyConformScreenState();
}

class _BuyConformScreenState extends State<BuyConformScreen> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  OutlineInputBorder? border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    MediaQueryData size = MediaQuery.of(context);
    var caption2 = Theme.of(context).textTheme.caption;
    return Scaffold(
      appBar: AppBar(
        title: Text('Conform Buying'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15,15,15,0),
              child: Container(
                height: size.size.height * .17,
                width: size.size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text('Home',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text('AL Aiman Street',),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text('8 ,4 , 60',),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mobile: 01020248452'),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
                },
                  child: Text('Change Address',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                          ),
                  ),

                   ),
              ),
            ),
            MyStatefulWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: false,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Colors.blue,
                textColor: Colors.white,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.blue,
                ),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: const Text(
                    'Buy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'halter',
                      fontSize: 14,
                      package: 'flutter_credit_card',

                    ),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('valid!');
                  } else {
                    print('invalid!');
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
enum SingingCharacter { Cash, Credit }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.Cash;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Cash'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Cash,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Credit Card'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Credit,
            groupValue: _character,
            onChanged: (SingingCharacter? value)
            {
              setState(() {
                _character = value;
              });
            },

          ),
        ),
      ],
    );
  }
}
