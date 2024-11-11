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
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.RFC3966)
    println("PhoneNumberFormat.RFC3966 ==> ${format1}")
    if (format1 != "+1-2530000") {
        return 1
    }
    return 0
}
