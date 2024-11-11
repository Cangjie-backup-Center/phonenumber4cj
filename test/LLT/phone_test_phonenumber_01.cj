// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import serialization.serialization.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var pn1: PhoneNumber = PhoneNumber()
    let dm: DataModel = pn1.serialize()
    var pn: PhoneNumber = PhoneNumber.deserialize(dm)
    pn.setCountryCodes(1).setNationalNumbers(2).setExtensions("exten").setItalianLeadingZeros(true)
    pn.setNumberOfLeadingZeros(3).setRawInputs("raw").setCountryCodeSources(CountryCodeSource.FROM_DEFAULT_COUNTRY)
    pn.setPreferredDomesticCarrierCodes("predom").clearPreferredDomesticCarrierCodes()
    println(pn.getCountryCodes())
    pn.clear()
    var pn2: PhoneNumber = PhoneNumber()
    pn.mergeFrom(pn2)
    pn.hashCode()
    pn.toString()
    pn.exactlySameAs(pn2)

    var pnm: PhoneNumberMatch = PhoneNumberMatch(0, "str", pn)
    var pnm2: PhoneNumberMatch = PhoneNumberMatch(0, "str", PhoneNumber())
    pnm.getNumber()
    pnm.getStart()
    pnm.getEnd()
    pnm.getRawString()
    pnm.toString()
    println(pnm.equals(pnm2))
    if (pn.equals(pn2)) {
        return 0
    } else {
        return 1
    }
}
