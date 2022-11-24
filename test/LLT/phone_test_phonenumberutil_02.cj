// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from serialization import serialization.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var pnu: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var pn: PhoneNumber = pnu.parse("8880044 66 77 88", "CN")
    var p2: PhoneNumber = pnu.parse("7990044 66 77 88", "CN")
    pnu.isNumberMatch(pn, p2)
    pnu.isNumberMatch("1234", "5678")
    pnu.isNumberMatch(pn, "4567")
    pnu.canBeInternationallyDialled(pn)
    pnu.isMobileNumberPortableRegion("CN")
    let str: String = PhoneNumberUtil.matchCountryCodeSource(CountryCodeSource.UNSPECIFIED)
    if (str.isEmpty()) {
        return 1
    }
    return 0
}
