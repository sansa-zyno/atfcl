import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/edit_profile.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  late AppProvider appProvider;
  Future getUsername() async {
    username = await LocalStorage().getString("username");
    setState(() {});
    return username;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: appProvider.profileDetails == null
            ? Center(child: CircularProgressIndicator())
            : Column(
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
                        text: "Profile",
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          changeScreen(
                              context,
                              EditProfile(
                                profileDetails: appProvider.profileDetails!,
                              ));
                        },
                        child: CustomText(
                          text: "Edit",
                          size: 16,
                          color: appColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: appProvider.imageUrl.startsWith("https")
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
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Username",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text: username,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 16,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "First Name",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text:
                                      appProvider.profileDetails!["firstname"],
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 16,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Last Name",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text: appProvider.profileDetails!["lastname"],
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 16,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Email",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text: appProvider.profileDetails!["email"],
                                  fontFamily: GoogleFonts.dmSans().fontFamily,
                                  size: 16,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Phone Number",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text: appProvider.profileDetails!["phone"],
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 16,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Date Of Birth",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text: appProvider.profileDetails!["dob"],
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 16,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "BVN",
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 15,
                                ),
                                CustomText(
                                  text: "XXXXXXXXXXXXXXXX",
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  size: 16,
                                )
                              ],
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
}
