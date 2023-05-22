// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("800-375-5283", "US")
    var format15: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber, "CN")
    var format16: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber, "US")
    println("format15 ==> ${format15}")
    if (format15 != "00 1 800-375-5283") {
        return 1
    }
    println("format16 ==> ${format16}")
    if (format16 != "1 (800) 375-5283") {
        return 1
    }
    //"010-68688866", "CN"
    var phoneNumber5: PhoneNumber = PhoneNumber()
    phoneNumber5.setCountryCodes(86)
    phoneNumber5.setNationalNumbers(1068688866)
    var format17: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber5, "CN")
    var format18: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber5, "US")
    println("format17 ==> ${format17}")
    if (format17 != "010 6868 8866") {
        return 1
    }
    println("format18 ==> ${format18}")
    if (format18 != "011 86 10 6868 8866") {
        return 1
    }
    return 0
}
