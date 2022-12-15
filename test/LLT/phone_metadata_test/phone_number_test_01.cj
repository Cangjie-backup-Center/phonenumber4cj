// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*

main() {
    if (CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN.toString() != "FROM_NUMBER_WITH_PLUS_SIGN") {
        return 1
    }
    if (CountryCodeSource.FROM_NUMBER_WITH_IDD.toString() != "FROM_NUMBER_WITH_IDD") {
        return 1
    }
    if (CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN.toString() != "FROM_NUMBER_WITHOUT_PLUS_SIGN") {
        return 1
    }
    if (CountryCodeSource.FROM_DEFAULT_COUNTRY.toString() != "FROM_DEFAULT_COUNTRY") {
        return 1
    }
    if (CountryCodeSource.UNSPECIFIED .toString() != "UNSPECIFIED") {
        return 1
    }
    var ph: PhoneNumber = PhoneNumber()
    ph.setItalianLeadingZeros(true)
    ph.setNumberOfLeadingZeros(2)
    try {
        ph.setRawInputs("")
    } catch (e: Exception) {
        if (e.toString() != "Exception: Null Pointer") {
            return 1
        }
    }
    ph.setRawInputs("{\\d}")
    ph.setCountryCodeSources(CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN)
    try {
        ph.setPreferredDomesticCarrierCodes("")
    } catch (e: Exception) {
        if (e.toString() != "Exception: Null Pointer") {
            return 1
        }
    }
    ph.setPreferredDomesticCarrierCodes("123456")
    ph.setExtensions("123")
    if (ph.toString() != "Country Code: 0 National Number: 0 Leading Zero(s): true Number of leading zeros: 2 Extension: 123 Country Code Source: FROM_NUMBER_WITH_PLUS_SIGN Preferred Domestic Carrier Code: 123456"){
        return 1
    }
    var phMerge = PhoneNumber().mergeFrom(ph)
    if (phMerge.toString() != phMerge.toString()) {
        return 1
    }
    0
}
