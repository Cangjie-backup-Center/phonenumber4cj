// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from std import fs.*
from phonenumber import geocoder.geocoding.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber = phonenumberUtil.parse("18717619089", "CN")
    var prefixFile: PrefixFileReader = PrefixFileReader("resources/86/86_en_geo.txt")
    var getRegion: String = prefixFile.getGeoDescriptionForNumber(phoneNumber, English, "仓颉", "CN")
    println(getRegion)
    return 0
}
