// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format17: String = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phoneNumber, "CN")
    var format18: String = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phoneNumber, "US")
    println("format17 ==> ${format17}")
    println("format18 ==> ${format18}")
    if (format17 != "199 9182 2826") {
        return 1
    }
    if (format18 != "011 86 199 9182 2826") {
        return 1
    }

    //"010-68688866", "CN"
    var phoneNumber5: PhoneNumber = PhoneNumber()
    phoneNumber5.setCountryCodes(86)
    phoneNumber5.setNationalNumbers(1068688866)
    var format19: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber5, "CN")
    var format20: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber5, "US")
    println("format19 ==> ${format19}")
    if (format19 != "010 6868 8866") {
        return 1
    }
    println("format20 ==> ${format20}")
    if (format20 != "011 86 10 6868 8866") {
        return 1
    }

    //"+1-213-282-3146", "US"
    var phoneNumber6: PhoneNumber = PhoneNumber()
    phoneNumber6.setCountryCodes(1)
    phoneNumber6.setNationalNumbers(2132823146)
    var format21: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber6, "CN")
    var format22: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber6, "US")
    println("format21 ==> ${format21}")
    if (format21 != "00 1 213-282-3146") {
        return 1
    }
    println("format22 ==> ${format22}")
    if (format22 != "1 (213) 282-3146") {
        return 1
    }
    return 0
}
