// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*

main() {
    if (Language.English == Language.US) {
        println(Language.English.toString())
    }
    if (Language.English != Language.US) {
        println(Language.Chinese.toString())
    }
    0
}
