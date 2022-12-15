// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format9: String = phoneNumberUtil.formatNationalNumberWithCarrierCode(phoneNumber, "38438")
    println("format9 ==> " + format9);
    if (format9 != "38438 199 9182 2826"){
        return 1
    }

    //"+14255550100", "US"
    var phoneNumber4: PhoneNumber = PhoneNumber()
    phoneNumber4.setCountryCodes(1)
    phoneNumber4.setNationalNumbers(4255550100)
    var format10: String = phoneNumberUtil.formatNationalNumberWithCarrierCode(phoneNumber4, "38438")
    println("format10 ==> " + format10)
    if (format10 != "(425) 555-0100") {
        return 1
    }

    //"00-1-213-282-3146", "US"
    var phoneNumber5: PhoneNumber = PhoneNumber()
    phoneNumber5.setCountryCodes(1)
    phoneNumber5.setNationalNumbers(12132823146)
    phoneNumber5.setItalianLeadingZeros(true)
    phoneNumber5.setNumberOfLeadingZeros(2)
    var format11: String = phoneNumberUtil.formatNationalNumberWithCarrierCode(phoneNumber5, "38438")
    println("format11 ==> " + format11)
    if (format11 != "0012132823146") {
        return 1
    }

    //"+881 7 311 10007", "001"
    var phoneNumber6: PhoneNumber = PhoneNumber()
    phoneNumber6.setCountryCodes(881)
    phoneNumber6.setNationalNumbers(731110007)
    var format12: String = phoneNumberUtil.formatNationalNumberWithCarrierCode(phoneNumber6, "001")
    println("format12 ==> " + format12)
    if (format12 != "7 311 10007") {
        return 1
    }

    return 0
}
