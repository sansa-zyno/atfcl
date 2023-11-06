import 'dart:convert';
import 'dart:io';
import 'package:achievement_view/achievement_view.dart';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, MultipartFile;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final Map profileDetails;
  EditProfile({required this.profileDetails, super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  XFile? image;
  String? username;
  String dob = "";
  late AppProvider appProvider;
  bool loading = false;

  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController emailController;
  late TextEditingController phonenoController;
  late TextEditingController dobController;

  getUsername() async {
    username = await LocalStorage().getString("username");
  }

  uploadImage(BuildContext context) async {
    appProvider = Provider.of<AppProvider>(context, listen: false);
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Response res = await HttpService.postWithFiles(Api.profilePics, {
        "username": username,
        "image": MultipartFile.fromBytes(File(image!.path).readAsBytesSync(),
            filename: image!.name)
      });
      final result = jsonDecode(res.data);
      if (result["Status"] == "succcess") {
        appProvider.getImage(username!);
        setState(() {});
        AchievementView(
          color: Color(0xFF072A6C),
          icon: Image.asset("assets/images/hand_up.png"),
          title: "Success!",
          elevation: 20,
          subTitle: "Profile picture uploaded successfully",
          isCircle: true,
        ).show(context);
      } else {
        AchievementView(
          color: Colors.red,
          icon: Icon(
            Icons.bug_report,
            color: Colors.white,
          ),
          title: "Failed!",
          elevation: 20,
          subTitle: "Profile picture upload failed",
          isCircle: true,
        ).show(context);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appProvider = Provider.of<AppProvider>(context, listen: false);
    getUsername();
    firstnameController =
        TextEditingController(text: widget.profileDetails["firstname"]);
    lastnameController =
        TextEditingController(text: widget.profileDetails["lastname"]);
    emailController =
        TextEditingController(text: widget.profileDetails["email"]);
    phonenoController =
        TextEditingController(text: widget.profileDetails["phone"]);
    dob = widget.profileDetails["dob"];
  }

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    size: 20,
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Edit Profile",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            uploadImage(context);
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child:
                                      appProvider.imageUrl.startsWith("https")
                                          ? Image.network(
                                              appProvider.imageUrl,
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${appurl}/${appProvider.imageUrl}",
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: Icon(
                                    Icons.edit,
                                    size: 30,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "First Name",
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        size: 16,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        controller: firstnameController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Last Name",
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        size: 16,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        controller: lastnameController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Email",
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        size: 16,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Phone Number",
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        size: 16,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        controller: phonenoController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Date Of Birth",
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        size: 16,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());
                          if (date != null) {
                            dob = "${date.year}-${date.month}-${date.day}";
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [CustomText(text: dob)],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      loading
                          ? Center(child: CircularProgressIndicator())
                          : GradientButton(
                              title: "Continue",
                              clrs: [appColor, appColor],
                              onpressed: () {
                                updateProfile();
                              },
                            ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateProfile() async {
    loading = true;
    setState(() {});
    try {
      Response response = await HttpService.post(Api.editProfile, {
        "username": username,
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "email": emailController.text,
        "phone": phonenoController.text,
        "dob": dob
      });
      Map res = jsonDecode(response.data);
      if (res["Status"] == "succcess") {
        appProvider.getProFileDetails(username!);
        AchievementView(
          color: Color(0xFF072A6C),
          icon: Image.asset(
            "assets/images/hand_up.png",
          ),
          title: "Success!",
          elevation: 20,
          subTitle: "Profile uploaded successfully",
          isCircle: true,
        ).show(context);
        Navigator.pop(context);
      } else {
        showDialog(
            context: context,
            builder: (ctx) => ShowDialogWidget(
                  titleText: res["Report"],
                  subText:
                      "Please make sure you have input the datas correctly",
                ));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => ShowDialogWidget(
                titleText: "Error",
                subText: "Please check your internet connection and try again",
              ));
    }
    loading = false;
    setState(() {});
  }
}
