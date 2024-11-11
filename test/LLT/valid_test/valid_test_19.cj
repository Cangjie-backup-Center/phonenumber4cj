// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import std.regex.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("02595566", "CN")
    var num = phoneNumber.getNationalNumbers()
    println("${num}")
    var isValid1: Bool = phoneNumberUtil.isValidNumber(phoneNumber)
    println("${isValid1}")
    if (isValid1 != true) {
        return 1
    }
    var isValid2: Bool = phoneNumberUtil.isValidNumberForRegion(phoneNumber, "US")
    println("${isValid2}")
    if (isValid2 != false) {
        return 1
    }
    0
}

