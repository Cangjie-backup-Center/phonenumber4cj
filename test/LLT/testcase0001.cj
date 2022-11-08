// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import collection.*

main() {
    var metaData: ArrayList<String> =ArrayList<String>()
    for (i in 0..99){
        metaData.append(i.toString())
    }
    var data: Iterator<String> =  metaData.iterator()
    var a= Option.Some("")
    while(a != Option<String>.None){
        a = data.next()
        println(a)
    }
    0
}


