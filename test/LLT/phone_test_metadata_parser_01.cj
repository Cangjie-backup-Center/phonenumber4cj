// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import io.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.inter.*

main() {
    var mp: MetadataParser = MetadataParser.newStrictParser()
    try {
        mp.parse(ArrayList<String>())
    } catch(e: IllegalArgumentException) {
        e.toString()
    }
    return 0
}
