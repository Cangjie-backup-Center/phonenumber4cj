// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import geocoder.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*
from std import collection.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(15091069727)
    var p: PhoneNumberToTimeZonesMapper = PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
    let str: String = PhoneNumberToTimeZonesMapper.getUnknownTimeZone()
    let arr: ArrayList<String> = p.getTimeZonesForGeographicalNumber(phone)
    for (res in arr) {
        if (res != "Etc/Unknown") {
            println(res)
            return 0
        }
    }
    return 1
}
