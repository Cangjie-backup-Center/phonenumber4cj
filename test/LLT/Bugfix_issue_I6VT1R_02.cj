// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from std import fs.*
from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parse("zz-15168316747", "CN")
    try {
        var reader: PrefixFileReader= PrefixFileReader("resources/86/86_en_carrier.txt")
        let res: String = reader.getCarrierDescriptionForNumber(phonenumber,"English","nihao","US")
    } catch(e: FSException) {
        println("元数据文件路径发生错误...")
    }
    return 0
}
