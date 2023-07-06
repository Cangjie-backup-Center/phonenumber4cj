// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*
from std import regex.*

main() {
    try {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phoneNumberUtil.parse("+86_25_95566cangjie18717619089", "CN")
    } catch (e: Exception) {
        if (e.toString() != "Error type: NOT_A_NUMBER. The string supplied did not seem to be a phone number.") {
            return 1
        }
    }
    0
}

