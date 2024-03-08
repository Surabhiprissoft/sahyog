

class AppValidation {
  //for sign up screen validation
  static String? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return 'Email address is required.';
    }
    else if (!RegExp(r'^([a-zA-Z0-9]){1,}([._-]){0,1}([a-zA-Z0-9]){1,}@([a-zA-Z0-9-]){1,}([.]){1}([a-zA-Z]){2,}$')
        .hasMatch(email!.trim())) {
      return "Please enter valid email address";

    }
    return null;
  }
  static String? validateResetEmailMobile(String email) {
    if (email.trim().isEmpty) {
      return 'Email address or Mobile number is required.';
    }
    else if (!RegExp(r'^((([a-zA-Z0-9]){1,}([._-]){0,1}([a-zA-Z0-9]){1,}@([a-zA-Z0-9-]){1,}([.]){1}([a-zA-Z]){2,})|(([0-9]){3}[-\\s]?([0-9]){3}[-\\s]?([0-9]){4}))$')
        .hasMatch(email!.trim())) {
      return "Please enter valid email or Mobile number";

    }
    return null;
  }
  static String? validateMobileNumber(String value) {
    // Regular expression for mobile number validation
    final regex = RegExp(r'^[0-9]{3}[-\s]?[0-9]{3}[-\s]?[0-9]{4}$');

    if (value.trim().isEmpty) {
      return 'Mobile number is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid mobile number (e.g., 123-456-7890).';
    }

    return null; // Mobile number is valid
  }

  static String? validatePrimaryMobileNumber(String value) {
    // Regular expression for mobile number validation
    final regex = RegExp(r'^[0-9]{3}[-\s]?[0-9]{3}[-\s]?[0-9]{4}$');

    if (value.trim().isEmpty) {
      return 'Primary Mobile number is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid mobile number (e.g., 123-456-7890).';
    }

    return null; // Mobile number is valid
  }

  static String? validateSecondaryMobileNumber(String value) {
    // Regular expression for mobile number validation
    final regex = RegExp(r'^[0-9]{3}[-\s]?[0-9]{3}[-\s]?[0-9]{4}$');

    if (value.trim().isEmpty) {
      return 'Secondary Mobile number is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid mobile number (e.g., 123-456-7890).';
    }

    return null; // Mobile number is valid
  }

  static String? validateHomeMobileNumber(String value) {
    // Regular expression for mobile number validation
    final regex = RegExp(r'^[0-9]{3}[-\s]?[0-9]{3}[-\s]?[0-9]{4}$');

      if (!regex.hasMatch(value)) {
      return 'Please enter a valid mobile number (e.g., 123-456-7890).';
    }

    return null; // Mobile number is valid
  }

  static String? validatePassword(String value) {
    // Regular expression for password validation
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])(.{7,15})$');
    if (value!.trim().isEmpty) {
      return 'Password is required';
    }
    else if(value.trim().length < 7){
      return 'Password must be 7 characters long';
    }
    else if (!regex.hasMatch(value)) {
      return 'Invalid password';
    }
    return null;
  }

  static String? confirmPassword(String cpassword, String password) {
    if (cpassword.isEmpty) {
      return "Confirm password is required";
    } else if (cpassword != password) {
      return 'Password and Confirm Password does not match';
    }
    return null;
  }

  static String? validateFirstName(String value) {
    // Regular expression for name validation (only alphabets)
    final regex = RegExp(r'^[A-Za-z]+$');

    if (value.trim().isEmpty) {
      return 'First name is required.';
    } else if (!regex.hasMatch(value)) {
      return 'First name can only contain alphabets.';
    } else if (value.trim().length < 2) {
      return 'First name must be at least 2 characters long.';
    }

    return null; // First name is valid
  }

  static String? validateLastName(String value) {
    // Regular expression for name validation (only alphabets)
    final regex = RegExp(r'^[A-Za-z]+$');

    if (value.trim().isEmpty) {
      return 'Last name is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Last name can only contain alphabets.';
    } else if (value.trim().length < 2) {
      return 'Last name must be at least 2 characters long.';
    }

    return null; // Last name is valid
  }

  static String? validateOTP(String value) {
    // Regular expression for 6-digit numeric code
    final regex = RegExp(r'^[0-9]{6}$');

    if (value.trim().isEmpty) {
      return 'OTP is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid 6-digit OTP.';
    }

    return null; // OTP is valid
  }

  static String? validateHomeAddress(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    if (value!.trim().isEmpty || value.trim() == null) {
      return 'Home address is required';
    }

    return null;
  }

  static String? validateWorkAddress(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    if (value!.trim().isEmpty || value.trim() == null) {
      return 'Work address is required';
    }

    return null;
  }

////////////////////////////////////////////////////////
  static String? validateTextInput(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    if (value!.trim().isEmpty || value.trim() == null) {
      return 'Please enter mandatory field';
    } /*else if (!RegExp("[a-zA-Z^]").hasMatch(value.trim())) {
      return 'Please enter only alphabet';
    }*/

    return null;
  }

  static String? validateBookTextInput(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    print("check");
    if (value!.trim().isEmpty) {
      print("check1");
      return 'Please enter mandatory field';
    } else if (!RegExp("[a-zA-Z^]").hasMatch(value.trim())) {
      return 'Please enter only alphabet';
    }

    return null;
  }

  static String? validateBookDescriptionTextInput(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    print("check");
    if (value!.trim().isEmpty || value.trim() == null) {
      return 'Please enter mandatory field';
    } else if (!RegExp("[a-zA-Z^]").hasMatch(value.trim())) {
      return 'Please enter only alphabet';
    }

    return null;
  }

  static String? validateDeniedTextInput(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    print("check"+value.toString());
    if (value!.trim().isEmpty || value.trim() == null) {
      return 'Please enter mandatory field';
    } else if (!RegExp("[a-zA-Z^]").hasMatch(value.trim())) {
      return 'Please enter only alphabet';
    }

    return null;
  }


  static String? validateBookcodeTextInput(String? value) {
    // r'[^A-Za-z0-9().,;?]'), ' '
    print("check");
    if (value!.trim().isEmpty) {
      print("check1");
      return 'Enter mandatory field';
    } else if (!RegExp("[a-zA-Z^]").hasMatch(value.trim())) {
      return 'Enter only alphabet';
    }

    return null;
  }

  static String? validateforMobile(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter mandatory field';
    } else if (value.length < 10 || value.length>10) {
      return 'Please enter valid number';
    } else if (!RegExp("[0-9]").hasMatch(value)) {
      return 'Enter only numbers';
    }

    return null;
  }

  static String? validateforOnlyDigit(String? value) {
    int val= int.parse(value!);
    if (value!.trim().isEmpty) {
      return 'Enter mandatory field';
    } else if (val < 1) {
      return 'Copies should be greater than zero';
    } else if (!RegExp("[0-9]").hasMatch(value)) {
      return 'Enter only numbers';
    }

    return null;
  }

  static String? validateforrequiredfield(String? value,String?message){
    if(value!.trim().isEmpty){
      return message!+" is required";
    }
    else
      {
        return null;
      }

  }
}
