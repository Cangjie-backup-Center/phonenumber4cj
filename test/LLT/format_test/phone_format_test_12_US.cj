// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("800-375-5283", "US")
    var format11: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "US", true)
    println("format11 ==> ${format11}")
    if (format11 != "+1 800-375-5283") {
        return 1
    }
    var format12: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "US", false)
    println("format12 ==> ${format12}")
    if (format12 != "+18003755283") {
        return 1
    }
    var format13: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "CN", true)
    println("format13 ==> ${format13}")
    if (format13 != "+1 800-375-5283") {
        return 1
    }
    var format14: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "CN", false)
    println("format14 ==> ${format14}")
    if (format14 != "+18003755283") {
       return 1
    }
    return 0
}
