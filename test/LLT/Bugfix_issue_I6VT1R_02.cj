// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import std.fs.*
import phonenumber4cj.carrier.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parse("zz-15168316747", "CN")
    try {
        var reader: PrefixFileReader= PrefixFileReader("resources/86/86_en_carrier.txt")
        reader.getCarrierDescriptionForNumber(phonenumber,English,"nihao","US")
    } catch(e: FSException) {
        println("元数据文件路径发生错误...")
    }
    return 0
}
