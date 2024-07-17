// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.geocoder.geocoding.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(1).setNationalNumbers(2083559135)
    var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
    let res: String = p.getDescriptionForNumber(phone, Language.English)
    if (!res.isEmpty()) {
        println(res)
        return 0
    }
    return 1
}
