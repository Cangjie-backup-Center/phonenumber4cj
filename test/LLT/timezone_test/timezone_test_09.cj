// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber4cj import geocoder.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.*
from std import collection.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var number: PhoneNumber = phonenumberUtil.parse("haha312-80---30095", "US")
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
