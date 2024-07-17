// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.geocoder.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.*
import std.collection.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var number: PhoneNumber = phonenumberUtil.parse("312-8030095", "US")
    var p: PhoneNumberToTimeZonesMapper = PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
    let arr: ArrayList<String> = p.getTimeZonesForNumber(number)
    for (res in arr) {
        if (res != "Etc/Unknown") {
            println(res)
            return 0
        }
    }
    return 1
}
