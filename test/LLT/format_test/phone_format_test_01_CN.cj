// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.NATIONAL)
    if ("199 9182 2826" != format1) {
        return 1
    }

    //"0086-18717619089", "CN"
    var phoneNumber2: PhoneNumber = PhoneNumber()
    phoneNumber2.setCountryCodes(86)
    phoneNumber2.setNationalNumbers(18717619089)
    var format2: String = phoneNumberUtil.format(phoneNumber2, PhoneNumberFormat.NATIONAL)
    var format3: String = phoneNumberUtil.format(phoneNumber2, PhoneNumberFormat.INTERNATIONAL)
    var format4: String = phoneNumberUtil.format(phoneNumber2, PhoneNumberFormat.E164)
    var format5: String = phoneNumberUtil.format(phoneNumber2, PhoneNumberFormat.RFC3966)
    println("format2 ==> ${format2}")
    println("format3 ==> ${format3}")
    println("format4 ==> ${format4}")
    println("format5 ==> ${format5}")
    if (format2 != "187 1761 9089") {
        return 1
    }
    if (format3 != "+86 187 1761 9089") {
        return 1
    }
    if (format4 != "+8618717619089") {
        return 1
    }
    if (format5 != "+86-187-1761-9089") {
        return 1
    }

    //"9524198", "CN"
    var phoneNumber3: PhoneNumber = PhoneNumber()
    phoneNumber3.setCountryCodes(86)
    phoneNumber3.setNationalNumbers(9524198)
    var format6: String = phoneNumberUtil.format(phoneNumber3, PhoneNumberFormat.NATIONAL)
    var format7: String = phoneNumberUtil.format(phoneNumber3, PhoneNumberFormat.INTERNATIONAL)
    var format8: String = phoneNumberUtil.format(phoneNumber3, PhoneNumberFormat.E164)
    var format9: String = phoneNumberUtil.format(phoneNumber3, PhoneNumberFormat.RFC3966)
    println("format6 ==> ${format6}")
    println("format7 ==> ${format7}")
    println("format8 ==> ${format8}")
    println("format9 ==> ${format9}")
    if (format6 != "952 4198") {
        return 1
    }
    if (format7 != "+86 9524198") {
        return 1
    }
    if (format8 != "+869524198") {
        return 1
    }
    if (format9 != "+86-9524198") {
        return 1
    }

    //"+14255550100", "US"
    var phoneNumber4: PhoneNumber = PhoneNumber()
    phoneNumber4.setCountryCodes(1)
    phoneNumber4.setNationalNumbers(4255550100)
    var format10: String = phoneNumberUtil.format(phoneNumber4, PhoneNumberFormat.NATIONAL)
    var format11: String = phoneNumberUtil.format(phoneNumber4, PhoneNumberFormat.INTERNATIONAL)
    var format12: String = phoneNumberUtil.format(phoneNumber4, PhoneNumberFormat.E164)
    var format13: String = phoneNumberUtil.format(phoneNumber4, PhoneNumberFormat.RFC3966)
    println("format10 ==> ${format10}")
    println("format11 ==> ${format11}")
    println("format12 ==> ${format12}")
    println("format13 ==> ${format13}")
    if (format10 != "(425) 555-0100") {
        return 1
    }
    if (format11 != "+1 425-555-0100") {
        return 1
    }
    if (format12 != "+14255550100") {
        return 1
    }
    if (format13 != "+1-425-555-0100") {
        return 1
    }

    //"00-1-213-282-3146", "US"
    var phoneNumber5: PhoneNumber = PhoneNumber()
    phoneNumber5.setCountryCodes(1)
    phoneNumber5.setNationalNumbers(12132823146)
    phoneNumber5.setItalianLeadingZeros(true)
    phoneNumber5.setNumberOfLeadingZeros(2)
    var format14: String = phoneNumberUtil.format(phoneNumber5, PhoneNumberFormat.NATIONAL)
    var format15: String = phoneNumberUtil.format(phoneNumber5, PhoneNumberFormat.INTERNATIONAL)
    var format16: String = phoneNumberUtil.format(phoneNumber5, PhoneNumberFormat.E164)
    var format17: String = phoneNumberUtil.format(phoneNumber5, PhoneNumberFormat.RFC3966)
    println("format14 ==> ${format14}")
    println("format15 ==> ${format15}")
    println("format16 ==> ${format16}")
    println("format17 ==> ${format17}")
    if (format14 != "0012132823146") {
        return 1
    }
    if (format15 != "+1 0012132823146") {
        return 1
    }
    if (format16 != "+10012132823146") {
        return 1
    }
    if (format17 != "+1-0012132823146") {
        return 1
    }

    //"+1-213-282-3146", "US"
    var phoneNumber6: PhoneNumber = PhoneNumber()
    phoneNumber6.setCountryCodes(1)
    phoneNumber6.setNationalNumbers(2132823146)
    var format18: String = phoneNumberUtil.format(phoneNumber6, PhoneNumberFormat.NATIONAL)
    var format19: String = phoneNumberUtil.format(phoneNumber6, PhoneNumberFormat.INTERNATIONAL)
    var format20: String = phoneNumberUtil.format(phoneNumber6, PhoneNumberFormat.E164)
    var format21: String = phoneNumberUtil.format(phoneNumber6, PhoneNumberFormat.RFC3966)
    println("format18 ==> ${format18}")
    println("format19 ==> ${format19}")
    println("format20 ==> ${format20}")
    println("format21 ==> ${format21}")
    if (format18 != "(213) 282-3146") {
        return 1
    }
    if (format19 != "+1 213-282-3146") {
        return 1
    }
    if (format20 != "+12132823146") {
        return 1
    }
    if (format21 != "+1-213-282-3146") {
        return 1
    }

    //"11111111111", "CN"
    var phoneNumber7: PhoneNumber = PhoneNumber()
    phoneNumber7.setCountryCodes(86)
    phoneNumber7.setNationalNumbers(11111111111)
    var format22: String = phoneNumberUtil.format(phoneNumber7, PhoneNumberFormat.NATIONAL)
    var format23: String = phoneNumberUtil.format(phoneNumber7, PhoneNumberFormat.INTERNATIONAL)
    var format24: String = phoneNumberUtil.format(phoneNumber7, PhoneNumberFormat.E164)
    var format25: String = phoneNumberUtil.format(phoneNumber7, PhoneNumberFormat.RFC3966)
    println("format22 ==> ${format22}")
    println("format23 ==> ${format23}")
    println("format24 ==> ${format24}")
    println("format25 ==> ${format25}")
    if (format22 != "11111111111") {
        return 1
    }
    if (format23 != "+86 11111111111") {
        return 1
    }
    if (format24 != "+8611111111111") {
        return 1
    }
    if (format25 != "+86-11111111111") {
        return 1
    }

    //"1871761908", "CN"
    var phoneNumber8: PhoneNumber = PhoneNumber()
    phoneNumber8.setCountryCodes(86)
    phoneNumber8.setNationalNumbers(1871761908)
    var format26: String = phoneNumberUtil.format(phoneNumber8, PhoneNumberFormat.NATIONAL)
    var format27: String = phoneNumberUtil.format(phoneNumber8, PhoneNumberFormat.INTERNATIONAL)
    var format28: String = phoneNumberUtil.format(phoneNumber8, PhoneNumberFormat.E164)
    var format29: String = phoneNumberUtil.format(phoneNumber8, PhoneNumberFormat.RFC3966)
    println("format26 ==> ${format26}")
    println("format27 ==> ${format27}")
    println("format28 ==> ${format28}")
    println("format29 ==> ${format29}")
    if (format26 != "1871761908") {
        return 1
    }
    if (format27 != "+86 1871761908") {
        return 1
    }
    if (format28 != "+861871761908") {
        return 1
    }
    if (format29 != "+86-1871761908") {
        return 1
    }
    return 0
}
