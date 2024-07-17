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
        var phoneNumber: PhoneNumber = phoneNumberUtil.parse("13A894083992", "CN")
        phoneNumber.getNationalNumbers()
    } catch (e: Exception){
        if (e.toString() != "Error type: NOT_A_NUMBER. The string supplied did not seem to be a phone number.") {
            return 1
        }
    }
    0
}

