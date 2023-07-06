package libphonenumber
from std import collection.*
from std import unicode.*

class PhoneNumberMatcher <: Iterator<PhoneNumberMatch> {

    private let phoneUtil: PhoneNumberUtil
    private var text: String
    private let preferredRegion: String
    private let leniency: Leniency
    private var maxTries: Int64
    private var searchIndex: Int32 = 0
    static let openingParens: String = "(\\[（［"
    static let closingParens: String = ")\\]）］"
    static let nonParens: String = "[^" + openingParens + closingParens + "]"
    static let leadClassChars: String = openingParens + PhoneNumberUtil.PLUS_CHARS
    static let leadClass: String = "[" + leadClassChars + "]"
    static let bracketPairLimit: String = limits(0, 3)
    static let leadLimit: String = limits(0, 2)
    static let digitBlockLimit: Int32 = PhoneNumberUtil.MAX_LENGTH_FOR_NSN + PhoneNumberUtil.MAX_LENGTH_COUNTRY_CODE
    static let blockLimit: String = limits(0, digitBlockLimit)
    static let punctuationLimit: String = limits(0, 4)
    static let digitSequence: String = "0-9\u{FF10}-\u{FF19}\u{0660}-\u{0669}\u{06F0}-\u{06F9}" + limits(1, digitBlockLimit)
    static let punctuation: String = "[" + PhoneNumberUtil.VALID_PUNCTUATION + "]" + punctuationLimit
    private static let LEAD_CLASS: Regex = Regex(leadClass)
    private static let TIME_STAMPS: Regex = Regex("[12]\\d{3}[-/]?[01]\\d[-/]?[0-3]\\d +[0-2]\\d$")
    private static let TIME_STAMPS_SUFFIX: Regex = Regex(":[0-5]\\d")
    private static let SLASH_SEPARATED_DATES: Regex = Regex("(?:(?:[0-3]?\\d/[01]?\\d)|(?:[01]?\\d/[0-3]?\\d))/(?:[12]\\d)?\\d{2}")
    private static let PUB_PAGES: Regex = Regex("\\d{1,5}-+\\d{1,5}\\s{0,4}\\(\\d{1,4}")
    //private static let REGEX: Regex = Regex("(?:" + leadClass + punctuation + ")" + leadLimit + digitSequence + "(?:" + punctuation + digitSequence + ")" + blockLimit
        //+ "(?:" + PhoneNumberUtil.EXTN_PATTERNS_FOR_MATCHING + ")?")
    private static let REGEX: Regex = Regex("[0-9\\-]+")
    private static let MATCHING_BRACKETS: Regex = Regex("(?:[" + openingParens + "])?" + "(?:" + nonParens + "+" + "[" + closingParens + "])?" +
    nonParens + "+" + "(?:[" + openingParens + "]" + nonParens + "+[" + closingParens + "])" + bracketPairLimit + nonParens + "*")
    private var state: State = State.NOT_READY
    private var lastMatch: Option<PhoneNumberMatch> = Option<PhoneNumberMatch>.None

    init(util: PhoneNumberUtil, text: String, country: String, leniency: Leniency, maxTries: Int64) {
        if (maxTries < 0) {
            throw IllegalArgumentException()
        }
        this.phoneUtil = util
        this.text = text
        this.preferredRegion = country
        this.leniency = leniency
        this.maxTries = maxTries
    }

    private static let r1 = Regex("/+(.*)")
    private static let r2 = Regex("(\\([^(]*)")
    private static let r3 = Regex("(?:\\p{Z}-|-\\p{Z})\\p{Z}*(.+)")
    private static let r4 = Regex("[‒-―－]\\p{Z}*(.+)")
    private static let r5 = Regex("\\.+\\p{Z}*([^.]+)")
    private static let r6 = Regex("\\p{Z}+(\\P{Z}+)")
    private static let INNER_MATCHES: ArrayList<Regex> = ArrayList<Regex>([r1, r2, r3, r4, r5, r6])

    private static func limits(lower: Int32, upper: Int32): String {
        if ((lower < 0) || (upper <= 0) || (upper < lower)) {
            throw IllegalArgumentException()
        }
        return "{" + "${lower}" + "," + "${upper}" + "}"
    }

    public func iterator(): Iterator<PhoneNumberMatch> {
        return this
    }

    func hasNext(): Bool {
        if (state == State.NOT_READY) {
            lastMatch = find(searchIndex)
            if (let None = lastMatch) {
                state = State.DONE
            } else {
                searchIndex = Int32(lastMatch.getOrThrow().getEnd())
                state = State.READY
            }
        }
        return state == State.READY
    }

    public func next(): Option<PhoneNumberMatch> {
        hasNext()
        var result: Option<PhoneNumberMatch> = lastMatch
        lastMatch = None
        state = State.NOT_READY
        return result
    }

    static func findRes(matchData: Option<MatchData>): Bool {
        if (let None = matchData) {
            return false
        }
        return true
    }

    private func find(index: Int32): Option<PhoneNumberMatch> {
        this.text = transCn(text)
        var mc: Matcher = REGEX.matcher(text)
        var i: Int64 = Int64(index)
        var mcMatch = mc.find(i)
        while (maxTries > 0) {
            if (findRes(mcMatch)) {
                var start: Int64 = mcMatch.getOrThrow().matchPosition().start
                var end: Int64 = mcMatch.getOrThrow().matchPosition().end
                var candidate: String = String.fromUtf8(text.toUtf8Array()[start..end])
                candidate = trimAfterFirstMatch(PhoneNumberUtil.SECOND_NUMBER_START_PATTERN, candidate)
                var m: Option<PhoneNumberMatch> = extractMatch(candidate, start)
                if (let Some(v) = m) {
                    v.toString()
                    return m
                }
                i = start + candidate.size
                maxTries = maxTries - 1
                if (i == text.size) {
                    break
                }
                mcMatch = mc.find(i)
            }
        }
        return Option<PhoneNumberMatch>.None
    }

    private func transCn (text: String): String {
        var tranStr = text
        var compileCn: Regex = Regex("[\u{4e00}-\u{9fa5}]")
        var num: Int64 = compileCn.matcher(text).allCount()
        while (num > 0) {
            tranStr = compileCn.matcher(tranStr).replace(".")
            num --
        }
        return tranStr
    }

    private func extractMatch(candidate: String, offset: Int64): Option<PhoneNumberMatch> {
        match (SLASH_SEPARATED_DATES.matcher(candidate).find()) {
            case Some(v) => 
                v.matchStr()
                return Option<PhoneNumberMatch>.None
            case None => ()
        }
        match (TIME_STAMPS.matcher(candidate).find()) {
            case Some(v) => 
                var followingText: String = text[(offset + candidate.size)..]
                let m: Option<MatchData> = TIME_STAMPS_SUFFIX.matcher(followingText).matchStart()
                v.matchStr()
                match (m) {
                    case Some(k) => 
                        k.matchStr()
                        return Option<PhoneNumberMatch>.None
                    case None => ()
                }
            case None => ()
        }
        var m: Option<PhoneNumberMatch> = parseAndVerify(candidate, offset)
        match (m) {
            case Some(k) =>
                k.toString()
                return m
            case None => ()
        }
        return extractInnerMatch(candidate, offset)
    }

    private func extractInnerMatch(candidate: String, offset: Int64): Option<PhoneNumberMatch> {
        for (i in INNER_MATCHES) {
            var groupMatcher: Matcher = i.matcher(candidate)
            var isFirstMatch: Bool = true
            var gMatch = groupMatcher.find()
            while (findRes(gMatch) && maxTries > 0) {
                if (isFirstMatch) {
                    var group: String = trimAfterFirstMatch(PhoneNumberUtil.UNWANTED_END_CHAR_PATTERN, candidate[..gMatch.getOrThrow().matchPosition().start])
                    var m: Option<PhoneNumberMatch> = parseAndVerify(group, offset)
                    if (let Some(v) = m) {
                        v.toString()
                        return m
                    }
                    maxTries = maxTries -1
                    isFirstMatch = false
                }
                var group: String = trimAfterFirstMatch(PhoneNumberUtil.UNWANTED_END_CHAR_PATTERN, gMatch.getOrThrow().matchStr(1))
                var n: Option<PhoneNumberMatch> = parseAndVerify(group, (offset + gMatch.getOrThrow().matchPosition(1).start))
                if (let Some(v) = n) {
                    v.toString()
                    return n
                }
                maxTries = maxTries -1
            }
        }
        return Option<PhoneNumberMatch>.None
    }

    private func parseAndVerify(candidate: String, offset: Int64): Option<PhoneNumberMatch> {
        try {
            match (MATCHING_BRACKETS.matcher(candidate).fullMatch()) {
                case Some(v) => 
                    v.matchStr()
                    ()
                case None =>
                    return Option<PhoneNumberMatch>.None
            }
            match (PUB_PAGES.matcher(candidate).find()) {
                case Some(k) => 
                    k.matchStr()
                    return Option<PhoneNumberMatch>.None
                case None => ()
            }
            if (offset > 0) {
                match (LEAD_CLASS.matcher(candidate).matchStart()) {
                    case Some(v) => 
                        v.matchStr()
                        ()
                    case None =>
                        var previousChar: Char = text[offset - 1]
                        if (isInvalidPunctuationSymbol(previousChar)) {
                            return Option<PhoneNumberMatch>.None
                        }
                        if (isLatinLetter(previousChar)) {
                            return Option<PhoneNumberMatch>.None
                        }
                }
                var lastCharIndex: Int64 = offset + candidate.size
                if (lastCharIndex < text.size) {
                    var nextChar: Char = text[lastCharIndex]
                    if (isInvalidPunctuationSymbol(nextChar)) {
                        return Option<PhoneNumberMatch>.None
                    }
                    if (isLatinLetter(nextChar)) {
                        return Option<PhoneNumberMatch>.None
                    }
                }
            }
            var number: PhoneNumber = phoneUtil.parseAndKeepRawInput(candidate, preferredRegion)
            if (leniency.verify(number, candidate, phoneUtil)) {
                number.clearCountryCodeSources()
                number.clearRawInputs()
                number.clearPreferredDomesticCarrierCodes()
                return PhoneNumberMatch(offset, candidate, number)
            }
        } catch (e: NumberParseException) {

        }
        return Option<PhoneNumberMatch>.None
    }

    static func isLatinLetter(letter: Char): Bool {
        if (!letter.isLetter()) {
            return false
        }
        return true
    }

    private static func isInvalidPunctuationSymbol(character: Char): Bool {
        return character == '%'
    }

    private static func trimAfterFirstMatch(r: Regex, candidate: String): String {
        var trailingCharsMatcher: Matcher = r.matcher(candidate)
        match (trailingCharsMatcher.find()) {
            case Some(v) =>
                var str: String = candidate[..v.matchPosition().start]
                return str
            case None => return candidate
        }
    }

    static func containsOnlyValidXChars(number: PhoneNumber, candidate: String, util: PhoneNumberUtil): Bool {
        
        var index: Int32 = 0
        for (index in 0..candidate.size -1) {
            var charAtIndex: Char = candidate[index]
            if (charAtIndex == 'x' || charAtIndex == 'X') {
                var charAtNextIndex: Char = candidate[index + 1]
                if (charAtNextIndex == 'x' || charAtNextIndex == 'X') {
                    var indexes = index + 1
                    if (util.isNumberMatch(number, candidate.substring(indexes)) != MatchType.NSN_MATCH) {
                        return false
                    }
                } else if (!PhoneNumberUtil.normalizeDigitsOnly(candidate.substring(index)).equals(number.getExtensions())) {
                    return false
                }
            }
        }
        index = 1
        return true
    }

    static func isNationalPrefixPresentIfRequired(number: PhoneNumber, util: PhoneNumberUtil): Bool {

        if (number.getCountryCodeSources() != CountryCodeSource.FROM_DEFAULT_COUNTRY) {
            return true
        }
        var phoneNumberRegion: String = util.getRegionCodeForCountryCode(Int32(number.getCountryCodes()))
        var metadata: PhonemetadataPhoneMetadata = util.getMetadataForRegion(phoneNumberRegion)
        var nationalNumber: String = util.getNationalSignificantNumber(number)
        var formatRule: Option<PhonemetadataNumberFormat> = util.chooseFormattingPatternForNumber(metadata.getNumberFormatList(), nationalNumber)
        match(formatRule) {
            case Some(v) =>
                if (v.getNationalPrefixFormattingRule().size > 0) {
                    if (v.getNationalPrefixOptionalWhenFormatting()) {
                        return true
                    }
                    if (PhoneNumberUtil.formattingRuleHasFirstGroupOnly(v.getNationalPrefixFormattingRule())) {
                        return true
                    }
                    let rawInputCopy: String = PhoneNumberUtil.normalizeDigitsOnly(number.getRawInputs())
                    let rawInput: StringBuilder = StringBuilder(rawInputCopy)
                    return util.maybeStripNationalPrefixAndCarrierCode(rawInput, metadata, StringBuilder())
                }
                return true
            case None =>
                return true
        }
    }
}

enum State {
    NOT_READY |
    READY |
    DONE

    public operator func == (that: State): Bool {
        match ((this, that)) {
            case (NOT_READY, NOT_READY) => true
            case (READY, READY) => true
            case (DONE, DONE) => true
            case _ => false
        }
    }

    public operator func != (that: State): Bool {
        return !(this == that)
    }

}
