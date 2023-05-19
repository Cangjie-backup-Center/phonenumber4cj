// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from std import fs.*
from phonenumber4cj import geocoder.geocoding.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parse("zz-15168316747", "CN")
    try {
        var reader: PrefixFileReader= PrefixFileReader("resources/86/86_en_geo.txt")
        let res: String = reader.getGeoDescriptionForNumber(phonenumber,English,"nihao","CN")
    } catch(e: FSException) {
        println("元数据文件路径发生错误...")
    }
    return 0
}
