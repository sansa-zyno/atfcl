// import 'package:velocity_x/velocity_x.dart';

class Api {
  static String get baseUrl {
    return "https://assurancefinancecompany.com/app";
  }

  static const login = "/login.php";
  static const accountType = "/accounttype.php";
  static const subAccount = "/subaccount.php";
  static const register = "/register.php";
  static const dashboard = "/accountdashb.php";
  static const userAccounts = "/useraccounts.php";
  static const getBankDetailsOfAccountNo = "/getbankdetailswithanum.php";
  static const transactions = "/transactions.php";
  static const sendToWallet = "/sendmoneylocally.php";
  static const getProfilePics = "/getprofilepics.php";
  static const profilePics = "/changeprofilepics.php";
  static const profile = "/profilescreen.php";
  static const editProfile = "/editprofile.php";
  static const changePassword = "/changepassword.php";
  static const forgotPassword = "/forgotpassword.php";
  static const fundAccount = "/fundaccount.php";
}
