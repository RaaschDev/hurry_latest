import 'package:flutter/material.dart';
import 'package:hurry/app/modules/payments/repositories/paymet_card_repository.dart';
import 'package:themes/themes.dart';

class CardPage extends StatelessWidget {
  final value;
  final reference;
  final motivo;
  final tId;
  final tType;
  final tQuantity;
  final wallet;
  final user;
  final eventId;

  CardPage({
    Key? key,
    required this.reference,
    required this.motivo,
    required this.value,
    required this.tId,
    required this.tType,
    required this.tQuantity,
    required this.wallet,
    required this.user,
    required this.eventId,
  }) : super(key: key);
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpMonthController = TextEditingController();
  TextEditingController cardExpYearController = TextEditingController();
  TextEditingController cardCvcController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Input(
            label: 'Numero do cartao',
            controller: cardNumberController,
            typekey: TextInputType.number,
            obscure: false,
            width: double.maxFinite,
            hint: 'Numero do cartao',
          ),
          SizedBox(
            height: 10,
          ),
          Input(
            label: 'Mes de Expiracao',
            controller: cardExpMonthController,
            typekey: TextInputType.number,
            obscure: false,
            width: double.maxFinite,
            hint: 'Mes de Expiracao',
          ),
          SizedBox(
            height: 10,
          ),
          Input(
            label: 'Ano de Expiracao',
            controller: cardExpYearController,
            typekey: TextInputType.number,
            obscure: false,
            width: double.maxFinite,
            hint: 'Ano de Expiracao',
          ),
          SizedBox(
            height: 10,
          ),
          Input(
            label: "CVC",
            controller: cardCvcController,
            typekey: TextInputType.number,
            obscure: false,
            width: double.maxFinite,
            hint: "CVC",
          ),
          SizedBox(
            height: 10,
          ),
          Input(
            label: "Nome no cartao",
            controller: cardNameController,
            typekey: TextInputType.number,
            obscure: false,
            width: double.maxFinite,
            hint: "Nome no cartao",
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            onPressed: () {
              PaymentCardRepository.payment(
                  reference: "$reference",
                  motivo: "$motivo",
                  value: value * 100,
                  cardNumber: "${cardNumberController.text}",
                  cardExpMonth: "${cardExpMonthController.text}",
                  cardExpYear: "${cardExpYearController.text}",
                  cardCvc: "${cardCvcController.text}",
                  cardName: "${cardNameController.text}",
                  tId: "$tId",
                  tQuantity: "$tQuantity",
                  tType: "$tType",
                  wallet: "$wallet",
                  user: "$user",
                  eventId: "$eventId");
            },
            height: 56,
            minWidth: double.maxFinite,
            color: Colors.orange[800],
            child: Text(
              'Complete',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
