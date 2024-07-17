// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.geocoder.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import std.collection.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(15091069727)
    var p: PhoneNumberToTimeZonesMapper = PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
    PhoneNumberToTimeZonesMapper.getUnknownTimeZone()
    let arr: ArrayList<String> = p.getTimeZonesForGeographicalNumber(phone)
    for (res in arr) {
        if (res != "Etc/Unknown") {
            println(res)
            return 0
        }
    }
    return 1
}
