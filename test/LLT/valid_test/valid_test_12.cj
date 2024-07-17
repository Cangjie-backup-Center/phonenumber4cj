// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import std.regex.*
import std.os.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("+1-4168765282", "US")
    var num = phoneNumber.getNationalNumbers()
    println("${num}")
    var isValid: Bool = phoneNumberUtil.isValidNumber(phoneNumber)
    println("${isValid}")
    if (isValid != true) {
        return 1
    }
    0
}

