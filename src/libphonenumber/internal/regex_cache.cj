package libphonenumber.internal

from std import collection.*
from std import regex.*

public open class RegexCache {
    private var cache: HashMap<String, Regex> = HashMap<String, Regex>()

    public init(size: Int32) {}

    public open func getPatternForRegex(regex: String): Regex {
        return Regex("")
    }

    open func containsRegex(regex: String): Bool {
        return true
    }
}
