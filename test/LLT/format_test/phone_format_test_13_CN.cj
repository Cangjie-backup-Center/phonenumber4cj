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
    var format15: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber, "CN");
    var format16: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber, "US");
    println("format15 ==> ${format15}")
    if (format15 != "199 9182 2826") {
        return 1
    }
    println("format16 ==> ${format16}")
    if (format16 != "011 86 199 9182 2826") {
        return 1
    }
    return 0
}
