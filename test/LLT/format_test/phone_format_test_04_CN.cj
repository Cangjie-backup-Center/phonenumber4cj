// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.RFC3966)
    println("PhoneNumberFormat.RFC3966 ==> ${format1}")
    if (format1 != "+86-199-9182-2826") {
        return 1
    }
    return 0
}
