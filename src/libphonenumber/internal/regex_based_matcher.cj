package libphonenumber.internal

from std import regex.*
import libphonenumber.inter.*

public class RegexBasedMatcher <: MatcherApi {
    public static func create(): MatcherApi {
        return RegexBasedMatcher()
    }

    private let regexCache: RegexCache = RegexCache(100)

    private init() {}

    public func matchNationalNumber(number: String, numberDesc: PhonemetadataPhoneNumberDesc, allowPrefixMatch: Bool): Bool {
        return true
    }

    private static func matchFunc(number: String, pattern: Regex, allowPrefixMatch: Bool): Bool {
        return true
    }
}
