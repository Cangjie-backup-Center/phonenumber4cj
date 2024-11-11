// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var pf: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pf.setPattern("(\\d{3})(\\d{4})(\\d{4})")
    pf.setFormat("($1) $2-$3")
    var numberFormats: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    numberFormats.append(pf)
    var format5: String = phoneNumberUtil.formatByPattern(phoneNumber, PhoneNumberFormat.E164, numberFormats)
    println("format5 ==> ${format5}")
    if (format5 != "+86(199) 9182-2826") {
        return 1
    }
    return 0
}
