package libphonenumber.internal

from std import regex.*
import libphonenumber.inter.*

public class RegexBasedMatcher <: MatcherApi {
    public static func create(): MatcherApi {
        return RegexBasedMatcher()
    }

    private let regexCache: RegexCache = RegexCache()

    private init() {}

    public func matchNationalNumber(number: String, numberDesc: PhonemetadataPhoneNumberDesc, allowPrefixMatch: Bool): Bool {
        var nationalNumberPattern: String = numberDesc.getNationalNumberPattern()
        if (nationalNumberPattern.size == 0) {
            return false
        }
        return matchFunc(number, regexCache.getPatternForRegex(nationalNumberPattern), allowPrefixMatch)
    }

    private static func matchFunc(number: String, pattern: Regex, allowPrefixMatch: Bool): Bool {
        var mc: Matcher = pattern.matcher(number)
        if (findResult(mc.find())) {
            if (findResult(mc.fullMatch())) {
                return true
            }
            return allowPrefixMatch
        }
        return false
    }

    static func findResult(find: Option<MatchData>): Bool{
        return match (find) {
            case Some(x) => true
            case None => false
        }
    }
}
