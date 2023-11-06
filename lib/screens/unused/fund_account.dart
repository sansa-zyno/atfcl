import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FundAccount extends StatefulWidget {
  const FundAccount({Key? key}) : super(key: key);

  @override
  State<FundAccount> createState() => _FundAccountState();
}

class _FundAccountState extends State<FundAccount> {
  bool expanded1 = false;
  bool expanded2 = false;
  TextEditingController amountController = TextEditingController();
  bool loading = false;
  String bankId = "";
  String countryId = "";
  String bankName = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: appColor2,
                    size: 20,
                  ),
                  Spacer(),
                  CustomText(
                    text: "Fund",
                    color: Colors.white,
                    size: 18,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //image: DecorationImage(image: AssetImage(stickers)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/images/cash-money.png",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            child: CustomText(
                          text: "Bank account",
                          color: appColor,
                          size: 16,
                          weight: FontWeight.bold,
                        )),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            height: expanded1 ? null : 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: ExpansionTile(
                              expandedAlignment: Alignment.centerLeft,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              onExpansionChanged: (x) {
                                expanded1 = x;
                                setState(() {});
                              },
                              title: Text("Account no",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              trailing:
                                  Icon(Icons.arrow_drop_down, color: appColor),
                              children: [],
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 283,
                            child: CustomText(
                              text: "Bank",
                              color: appColor,
                              size: 16,
                              weight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            height: expanded1 ? null : 58,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: ListTile(
                              title: Text(
                                  bankName.isEmpty ? "Select Bank" : bankName,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              trailing: IconButton(
                                onPressed: () async {
                                  /* if (appProvider.banks.isNotEmpty) {
                                    await showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(15),
                                                        topRight:
                                                            Radius.circular(
                                                                15))),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: "Select Bank",
                                                  color: appColor,
                                                  size: 16,
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context);
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    )),
                                              ],
                                            ),
                                            insetPadding: EdgeInsets.all(0),
                                            content: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                    children: List.generate(
                                                        appProvider
                                                            .banks.length,
                                                        (index) => ListTile(
                                                              onTap: () {
                                                                bankId = appProvider
                                                                        .banks[index]
                                                                    ["uid"];
                                                                countryId = appProvider.banks[index]
                                                                        [
                                                                        "country"]
                                                                    ["uid"];
                                                                bankName = appProvider
                                                                        .banks[index]
                                                                    [
                                                                    "bank_name"];
                                                                setState(
                                                                    () {});
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              leading: Text(
                                                                  "${index + 1}"),
                                                              title: Text(appProvider
                                                                          .banks[
                                                                      index]
                                                                  [
                                                                  "bank_name"]),
                                                            ))),
                                              ),
                                            )));
                                  } else {
                                    appProvider.getBanks();
                                  }*/
                                },
                                icon: Icon(Icons.arrow_drop_down,
                                    color: appColor),
                              ),
                            )),
                        /*Container(
                            child: CustomText(
                          text: "Deposit To",
                          color: appColor,
                          size: 16,
                          weight: FontWeight.bold,
                        )),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            height: expanded1 ? null : 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: ExpansionTile(
                              expandedAlignment: Alignment.centerLeft,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              onExpansionChanged: (x) {
                                expanded1 = x;
                                setState(() {});
                              },
                              title: Text("Select Account",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              trailing:
                                  Icon(Icons.arrow_drop_down, color: appColor),
                              children: [],
                            )),*/
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            child: CustomText(
                          text: "Amount",
                          color: appColor,
                          size: 16,
                          weight: FontWeight.bold,
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        CurvedTextField(
                          hint: "",
                          controller: amountController,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        loading
                            ? Container(
                                width: 283,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : GradientButton(
                                title: "Fund Wallet",
                                clrs: [appColor, appColor],
                                onpressed: () async {
                                  await fund();
                                },
                              )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  fund() async {
    /*loading = true;
    setState(() {});
    Response response = await HttpService.postRequest(
        Api.fund, {"amount": amountController.text},
        bearerToken: true, accessToken: appProvider.token);
    Map result = jsonDecode(response.body);
    log(result.toString());
    if (result["status"] == "Success") {
      amountController.text = "";
      changeScreenReplacement(
          context,
          FundEnterPin(
            validationUrl: result["data"]["url"],
          ));
      loading = false;
      setState(() {});
    } else {
      loading = false;
      setState(() {});
      AchievementView(
        context,
        color: Colors.red,
        icon: Icon(
          FontAwesomeIcons.bug,
          color: Colors.white,
        ),
        title: "Error",
        elevation: 20,
        subTitle: "Wallet not funded",
        isCircle: true,
      ).show();
    }*/
  }
}
