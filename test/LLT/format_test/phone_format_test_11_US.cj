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
    var preferredDomesticCarrierCode: String = phoneNumber.getPreferredDomesticCarrierCodes()
    println("preferredDomesticCarrierCode ==> ${preferredDomesticCarrierCode}")
    phoneNumber.setPreferredDomesticCarrierCodes("1111")
    var format10: String = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phoneNumber, "38438")
    println("format10 ==> " + format10)
    if (format10 != "253-0000"){
        return 1
    }
    return 0
}
