// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import std.fs.*
import phonenumber4cj.geocoder.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.*
import std.collection.*

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
