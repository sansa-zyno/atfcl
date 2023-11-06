import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class IDVerification extends StatefulWidget {
  const IDVerification({Key? key}) : super(key: key);

  @override
  State<IDVerification> createState() => _IDVerificationState();
}

class _IDVerificationState extends State<IDVerification> {
  //TextEditingController idController = TextEditingController();
  TextEditingController bvnSsnController = TextEditingController();
  PlatformFile? file;
  bool expanded = false;
  String issuedDate = "";
  String expiryDate = "";

  bool a = false;
  bool b = false;
  bool c = false;
  String docType = "Select Document Type";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appColor,
                    size: 20,
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Identity Verification",
                  weight: FontWeight.bold,
                  size: 18,
                ),
                SizedBox(
                  height: 8,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: "Document Type",
                    size: 16,
                    color: appColor,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: expanded ? null : 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: ExpansionTile(
                        expandedAlignment: Alignment.centerLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        onExpansionChanged: (x) {
                          expanded = x;
                          setState(() {});
                        },
                        title: Text(docType,
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        trailing: Icon(Icons.arrow_drop_down, color: appColor),
                        children: [
                          InkWell(
                              onTap: () {
                                a = true;
                                b = false;
                                c = false;
                                docType = "National Id";
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: a ? appColor : Colors.transparent),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  child: Row(
                                    children: [
                                      Text("National Id",
                                          style: TextStyle(
                                              color: a
                                                  ? Colors.white
                                                  : Colors.black)),
                                    ],
                                  ))),
                          InkWell(
                              onTap: () {
                                a = false;
                                b = true;
                                c = false;
                                docType = "International Passport";
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: b ? appColor : Colors.transparent),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  child: Row(
                                    children: [
                                      Text("International Passport",
                                          style: TextStyle(
                                              color: b
                                                  ? Colors.white
                                                  : Colors.black)),
                                    ],
                                  ))),
                          InkWell(
                              onTap: () {
                                a = false;
                                b = false;
                                c = true;
                                docType = "Driver's License";
                                setState(() {});
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: c ? appColor : Colors.transparent),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  child: Row(
                                    children: [
                                      Text("Driver's License",
                                          style: TextStyle(
                                              color: c
                                                  ? Colors.white
                                                  : Colors.black)),
                                    ],
                                  ))),
                        ],
                      )),
                  /* SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: "ID Number",
                    color: appColor,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CurvedTextField(
                    hint: "",
                    controller: idController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 283,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Date Issued",
                              color: appColor,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now());
                                if (date != null) {
                                  issuedDate =
                                      "${date.year}-${date.month}-${date.day}";
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(0.3),
                                          blurRadius: 10,
                                          offset: Offset(2, 2))
                                    ]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.date_range),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CustomText(text: issuedDate)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Expiry Date",
                              color: appColor,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now());
                                if (date != null) {
                                  expiryDate =
                                      "${date.year}-${date.month}-${date.day}";
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(0.3),
                                          blurRadius: 10,
                                          offset: Offset(2, 2))
                                    ]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.date_range),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CustomText(text: expiryDate)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),*/
                  SizedBox(
                    height: 30,
                  ),
                  file == null
                      ? InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              file = result.files.single;
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: appColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                CustomText(
                                  text: "Upload Document",
                                  size: 16,
                                  color: appColor,
                                )
                              ],
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 25),
                              child: Text(
                                file!.name,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                    onTap: () {
                                      file = null;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )))
                          ],
                        ),
                  SizedBox(
                    height: 100,
                  ),
                  loading
                      ? Container(
                          width: 283,
                          child: Center(child: CircularProgressIndicator()))
                      : GradientButton(
                          title: "Verify",
                          textClr: Colors.white,
                          clrs: [appColor, appColor],
                          onpressed: () async {
                            /* loading = true;
                            setState(() {});
                            Response response =
                                await HttpService.postRequest(
                                    Api.kyc,
                                    {
                                      "name": val.toLowerCase(),
                                      "id_number":
                                          bvnSsnController.text
                                    },
                                    bearerToken: true,
                                    accessToken: appProvider.token);
                            Map result = jsonDecode(response.body);
                            log(result.toString());
                            if (result["status"]) {
                              if (file != null) {
                                try {
                                  dio.Response response =
                                      await HttpService.postWithFiles(
                                          Api.docVerification, {
                                    "attachment":
                                        dio.MultipartFile.fromBytes(
                                            File(file!.path!)
                                                .readAsBytesSync(),
                                            filename: file!.name),
                                    "name": file!.name
                                  });
                                  log(response.data.toString());
                                } catch (e) {
                                  log("Error verifying documents");
                                }
                              }
                
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth
                                      .instance.currentUser!.uid)
                                  .update({
                                "isKycDone": true,
                              });
                              loading = false;
                              setState(() {});
                              userController.getCurrentUserInfo();
                              AchievementView(
                                context,
                                color: Colors.green,
                                icon: Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: "Successfull !",
                                elevation: 20,
                                subTitle: result["message"],
                                isCircle: true,
                              ).show();
                              Navigator.pop(context);
                            } else {
                              loading = false;
                              setState(() {});
                              Get.defaultDialog(
                                  title: "Error",
                                  middleText: result["message"]);
                            }*/
                          },
                        ),
                  /*SizedBox(
                    height: 8,
                  ),
                  Container(
                      width: 283,
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Step 2 of 2",
                        color: appColor,
                      ))*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
