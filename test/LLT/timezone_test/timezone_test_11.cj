// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from std import fs.*
from phonenumber import geocoder.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.*
from std import collection.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parse("zz-15168316747", "CN")
    try {
        var reader: PrefixFileReader= PrefixFileReader("resources/tz/map_data.txt")
        let res: ArrayList<String> = reader.lookupTimeZonesForNumber(phonenumber)
        for (r in res) {
            println(r)
        }
    } catch(e: FSException) {
        println("元数据文件路径发生错误...")
    }
    return 0
}
