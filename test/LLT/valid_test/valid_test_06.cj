// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import std.regex.*

main() {
    try {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber: PhoneNumber = phoneNumberUtil.parse("[13894083992]", "CN")
        var num = phoneNumber.getNationalNumbers()
        var isValid: Bool = phoneNumberUtil.isValidNumber(phoneNumber)
        if (isValid != true) {
            return 1
        }
        if (num != 13894083992) {
            return 1
        }
    } catch (e: Exception){
        return 1
    }
    0
}

