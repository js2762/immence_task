class Validation {

  static emailValidation(String value) {
    final RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    bool validateEmail(String email) {
      return emailRegex.hasMatch(email);
    }

    if (value.isEmpty) {
      //print('Please enter the E-mail');
      return 'E-mail is required';
    } else if (!validateEmail(value)) {
      //print('Enter valid E-mail');
      return 'Enter valid E-mail';
    }
  }

  static passwordValidation(String value) {
    if (value.isEmpty) {
      //print('First enter the password');
      return 'password is required';
    } else if (value.length < 8) {
      //print('password should contain atleast 8 character');
      return ('length should be atleast 8 character long');
    }
  }

  static nameValidation(String value) {
    if (value.isEmpty) {
      //print('Please enter the name');
      return 'Name is required';
    }
  }

  static numberValidation(String value) {
    if (value.isEmpty) {
      //print('first enter the number');
      return 'enter your number';
    } else if (value.length > 10 || value.length < 10) {
      //print('Please enter the valid number');
      return 'Please enter the valid number';
    }
  }

}