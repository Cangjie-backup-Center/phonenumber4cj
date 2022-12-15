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
    var pf: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pf.setPattern("(\\d{3})(\\d{4})(\\d{4})")
    pf.setFormat("($1) $2-$3")
    var numberFormats: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    numberFormats.append(pf)
    var format5: String = phoneNumberUtil.formatByPattern(phoneNumber, PhoneNumberFormat.NATIONAL, numberFormats)
    println("format5 ==> ${format5}")
    if (format5 != "(199) 9182-2826") {
        return 1
    }

    //"+14255550100", "US"
    var phoneNumber4: PhoneNumber = PhoneNumber()
    phoneNumber4.setCountryCodes(1)
    phoneNumber4.setNationalNumbers(4255550100)
    var pf2: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pf2.setPattern("(\\d{2})(\\d{2})(\\d{6})")
    pf2.setFormat("($1) $2-$3")
    var numberFormats2: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    numberFormats2.append(pf2)
    var format6: String = phoneNumberUtil.formatByPattern(phoneNumber4, PhoneNumberFormat.NATIONAL, numberFormats2);
    var format7: String = phoneNumberUtil.formatByPattern(phoneNumber4, PhoneNumberFormat.INTERNATIONAL, numberFormats2);
    var format8: String = phoneNumberUtil.formatByPattern(phoneNumber4, PhoneNumberFormat.E164, numberFormats2);
    var format9: String = phoneNumberUtil.formatByPattern(phoneNumber4, PhoneNumberFormat.RFC3966, numberFormats2);
    println("format6 ==> " + format6)
    println("format7 ==> " + format7)
    println("format8 ==> " + format8)
    println("format9 ==> " + format9)
    if (format6 != "(42) 55-550100") {
        return 1
    }
    if (format7 != "+1 (42) 55-550100") {
        return 1
    }
    if (format8 != "+1(42) 55-550100") {
        return 1
    }
    if (format9 != "tel:+1-42-55-550100") {
        return 1
    }

    return 0
}
