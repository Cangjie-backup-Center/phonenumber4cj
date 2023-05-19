// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*
from std import regex.*
from std import os.*

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

