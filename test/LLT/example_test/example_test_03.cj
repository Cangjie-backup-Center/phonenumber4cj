// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

main() {
    var compile: Regex = Regex("[0-9\\-]+")
    var compileCn: Regex = Regex("[\u{4E00}-\u{9FA5}\u{8FBD}-\u{9FBB}\u{FA0E}-\u{FA29}]+")
    var str: String = "倉頡..頡..123456..."
    var num: Int64 = compileCn.matcher(str).allCount()
    println(num)
    while (num > 0) {
        str = compileCn.matcher(str).replace(".")
        num--
    }
    println(str)
    var matcher: Option<MatchData> = compile.matcher(str).find(0)
    match (matcher) {
        case Some(x) =>
            println(x.matchPosition().start)
            println(x.matchPosition().end)
        case None => println("None")
    }
    return 0
}
