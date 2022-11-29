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
    pf.setPattern("(\\d{3})(\\d{4})(\\d{4})")
    pf.setFormat("($1) $2-$3")
    var numberFormats: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    numberFormats.append(pf)
    var format5: String = phoneNumberUtil.formatByPattern(phoneNumber, PhoneNumberFormat.RFC3966, numberFormats)
    println("format5 ==> ${format5}")
    if (format5 != "tel:+86-199-9182-2826") {
        return 1
    }
    return 0
}