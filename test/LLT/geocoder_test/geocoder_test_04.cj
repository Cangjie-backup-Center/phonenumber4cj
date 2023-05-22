// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber4cj import geocoder.geocoding.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(1).setNationalNumbers(4156091789)
    var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
    let res: String = p.getDescriptionForValidNumber(phone, Language.China, "US")
    if (!res.isEmpty()) {
        println("指定语言发生错误....")
        return 0
    }
    return 1
}
