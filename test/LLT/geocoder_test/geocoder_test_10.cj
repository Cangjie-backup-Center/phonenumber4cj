// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber4cj import geocoder.geocoding.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var number: PhoneNumber = phonenumberUtil.parse("13298321931", "US")
    var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
    let res: String = p.getDescriptionForValidNumber(number, Language.English, "CN")
    if (res.isEmpty()) {
        return 0
    }
    return 1
}
