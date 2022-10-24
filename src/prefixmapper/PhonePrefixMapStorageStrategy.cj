package prefixmapper

from std import collection.*

abstract class PhonePrefixMapStorageStrategy {

    protected var numOfEntries: Int64 = 0
    protected let possibleLengths: HashSet<Int64> = HashSet<Int64>()

    public func getPrefix(index: Int64): Int64

    public func getDescription(index: Int64): String

    public func readFromSortedMap(sortedPhonePrefixMap: HashMap<Int64, String>): Unit

    public func getNumOfEntries(): Int64 {
        return numOfEntries
    }

    public func getPossibleLengths(): HashSet<Int64> {
        return possibleLengths
    }

    public func toString(): String {
        var output: StringBuilder = StringBuilder()
        var numOfEntries: Int64 = getNumOfEntries()
        for (i in(0..numOfEntries)) {
            output.append(getPrefix(i))
                .append("|")
                .append(getDescription(i))
                .append("\n")
        }
        return output.toString()
    }
}
