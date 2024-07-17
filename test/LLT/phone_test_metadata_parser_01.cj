// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.io.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var mp: MetadataParser = MetadataParser.newStrictParser()
    try {
        mp.parse(ArrayList<String>())
    } catch(e: IllegalArgumentException) {
        e.toString()
    }
    return 0
}
