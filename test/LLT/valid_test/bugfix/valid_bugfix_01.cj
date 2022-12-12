// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
from std import regex.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    try {
        var phoneNumber1: PhoneNumber = phoneNumberUtil.parse("0086_18717619089", "CN")
    } catch (e: Exception) {
        if (e.toString() != "Error type: NOT_A_NUMBER. The string supplied did not seem to be a phone number.") {
            return 1
        }
    }
    try {
        var phoneNumber2: PhoneNumber = phoneNumberUtil.parse("仓颉+86_25_95566 *%12qwe", "CN")
    } catch (e: Exception) {
        if (e.toString() != "Error type: NOT_A_NUMBER. The string supplied did not seem to be a phone number.") {
            return 1
        }
    }
    try {
        var phoneNumber3: PhoneNumber = phoneNumberUtil.parse("+86_25_95566cangjie18717619089", "CN")
    } catch (e: Exception) {
        if (e.toString() != "Error type: NOT_A_NUMBER. The string supplied did not seem to be a phone number.") {
            return 1
        }
    }
    try {
        var phoneNumber4: PhoneNumber = phoneNumberUtil.parse("[18739756070]", "CN")
        if (phoneNumber4.getNationalNumbers() != 18739756070) {
            return 1
        }
    } catch (e: Exception) {
        return 1
    }
    0
}