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
    var pf: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pf.setPattern("(\\d{3})(\\d{3})(\\d{6})")
    pf.setFormat("*$1* $2-$3")
    var pf2: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pf2.setPattern("(\\d{4})(\\d{4})(\\d{3})")
    pf2.setFormat("*$1* $2-$3")
    var pf3: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pf3.setPattern("(\\d{3})(\\d{4})(\\d{4})")
    pf3.setFormat("*$1* $2-$3")
    var numberFormats: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    numberFormats.append(pf)
    numberFormats.append(pf2)
    numberFormats.append(pf3)
    var format5: String = phoneNumberUtil.formatByPattern(phoneNumber, PhoneNumberFormat.NATIONAL, numberFormats)
    println("format5 ==> ${format5}")
    if (format5 != "*1999* 1822-826") {
        return 1
    }
    return 0
}