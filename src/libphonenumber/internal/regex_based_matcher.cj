package libphonenumber.internal

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
        var matcher: Matcher = pattern.matcher(number)
        if (!(lookingAt(matcher.matchStart()))){
            return false
        } else {
            if (findAllResult(matcher.findAll())) {
                return true
            } else {
                return allowPrefixMatch
            }
        }
    }

    static func lookingAt(matchData: Option<MatchData>): Bool {
        return match (matchData) {
            case Some(x) => true
            case None => false
        }
    }

    static func findAllResult(matchData: Option<Array<MatchData>>): Bool {
        return match (matchData) {
            case Some(x) => true
            case None => false
        }
    }
}
