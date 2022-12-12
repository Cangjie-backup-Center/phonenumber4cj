// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
from std import regex.*
from std import os.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber1: PhoneNumber = phoneNumberUtil.parse("15904582497", "CN")
    println(phoneNumber1.getNationalNumbers())
    println(phoneNumber1.getCountryCodes())
    var validNumber1: Bool = phoneNumberUtil.isValidNumber(phoneNumber1)
    println(validNumber1)
    if (validNumber1 != true) {
        return 1
    }

    var phoneNumber2: PhoneNumber = phoneNumberUtil.parse("15904582497", "US")
    println(phoneNumber2.getNationalNumbers())
    println(phoneNumber2.getCountryCodes())
    var validNumber2: Bool = phoneNumberUtil.isValidNumberForRegion(phoneNumber2, "US")
    println(validNumber2)
    if (validNumber2 != false) {
        return 1
    }

    var phoneNumber3: PhoneNumber = PhoneNumber()
    phoneNumber3.setNationalNumbers(15904582497i64)
    phoneNumber3.setCountryCodes(86)
    println(phoneNumber3.getNationalNumbers())
    println(phoneNumber3.getCountryCodes())
    var validNumber3: Bool = phoneNumberUtil.isValidNumberForRegion(phoneNumber3, "CN")
    println(validNumber3)
    if (validNumber3 != true) {
        return 1
    }

    var phoneNumber4: PhoneNumber = PhoneNumber()
    phoneNumber4.setNationalNumbers(15904582497i64)
    phoneNumber4.setCountryCodes(86)
    println(phoneNumber4.getNationalNumbers())
    println(phoneNumber4.getCountryCodes())
    var validNumber4: Bool = phoneNumberUtil.isValidNumberForRegion(phoneNumber4, "US")
    println(validNumber4)
    if (validNumber4 != false) {
        return 1
    }
    0
}

