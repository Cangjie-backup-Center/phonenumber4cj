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
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.E164)
    println("PhoneNumberFormat.E164 ==> ${format1}")
    if (format1 != "+8619991822826") {
        return 1
    }
    return 0
}
