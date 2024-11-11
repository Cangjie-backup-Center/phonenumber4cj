// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("tel:253-0000;phone-context=www.google.com", "US")
    var format15: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber, "CN");
    var format16: String = phoneNumberUtil.formatOutOfCountryCallingNumber(phoneNumber, "US");
    println("format15 ==> ${format15}")
    if (format15 != "00 1 2530000") {
        return 1
    }
    println("format16 ==> ${format16}")
    if (format16 != "1 253-0000") {
        return 1
    }
    return 0
}
