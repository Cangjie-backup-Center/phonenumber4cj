// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import std.fs.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber = phonenumberUtil.parse("13298321931", "CN")
    var prefixFile: PrefixFileReader = PrefixFileReader("resources/86/86_en_geo.txt")
    var getRegion = prefixFile.getGeoDescriptionForNumber(phoneNumber,Chinese,"仓颉","US")               
    println(getRegion)
    return 0
}
