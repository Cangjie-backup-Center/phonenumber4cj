/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package phonenumber4cj.libphonenumber

public open class PhoneNumberUtil {

    private static let lock = ReentrantMutex()

    private static let MIN_LENGTH_FOR_NSN: Int64 = 2

    static let MAX_LENGTH_FOR_NSN: Int32 = 17


    private static let MAX_INPUT_STRING_LENGTH: Int32 = 250

    private static let UNKNOWN_REGION: String = "ZZ"

    private static let NANPA_COUNTRY_CODE: Int32 = 1

    private static let COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX: String = "3"

    private static let MOBILE_TOKEN_MAPPINGS: HashMap<Int32, String> = HashMap<Int32, String>([(54, "9")])

    private static let GEO_MOBILE_COUNTRIES: HashSet<Int32> = HashSet<Int32>([52, 54, 55, 62, 86])

    static let PLUS_SIGN: Rune = '+'

    private static let STAR_SIGN: Rune = '*'

    private static let RFC3966_EXTN_PREFIX: String = ";ext="
    private static let RFC3966_PREFIX: String = "tel:"
    private static let RFC3966_PHONE_CONTEXT: String = ";phone-context="
    private static let RFC3966_ISDN_SUBADDRESS: String = ";isub="

    private static let DIALLABLE_CHAR_MAPPINGS: HashMap<Rune, Rune> = HashMap<Rune, Rune>(
        [(r'#', r'#'), (r'*', r'*'), (r'+', r'+'), (r'0', r'0'), (r'1', r'1'), (r'2', r'2'), (r'3', r'3'), (r'4', r'4'), (r'5', r'5'),
        (r'6', r'6'), (r'7', r'7'), (r'8', r'8'), (r'9', r'9')])

    private static let ALPHA_PHONE_MAPPINGS: HashMap<Rune, Rune> = HashMap<Rune, Rune>(
        [(r'0', r'0'), (r'1', r'1'), (r'2', r'2'), (r'3', r'3'), (r'4', r'4'), (r'5', r'5'), (r'6', r'6'), (r'7', r'7'), (r'8', r'8'),
        (r'9', r'9'), (r'A', r'2'), (r'B', r'2'), (r'C', r'2'), (r'D', r'3'), (r'E', r'3'), (r'F', r'3'), (r'G', r'4'), (r'H', r'4'),
        (r'I', r'4'), (r'J', r'5'), (r'K', r'5'), (r'L', r'5'), (r'M', r'6'), (r'N', r'6'), (r'O', r'6'), (r'P', r'7'), (r'Q', r'7'),
        (r'R', r'7'), (r'S', r'7'), (r'T', r'8'), (r'U', r'8'), (r'V', r'8'), (r'W', r'9'), (r'X', r'9'), (r'Y', r'9'), (r'Z', r'9')])

    private static let ALL_PLUS_NUMBER_GROUPING_SYMBOLS: HashMap<Rune, Rune> = HashMap<Rune, Rune>(
        [(r'0', r'0'), (r'1', r'1'), (r'2', r'2'), (r'3', r'3'), (r'4', r'4'), (r'5', r'5'), (r'6', r'6'), (r'7', r'7'), (r'8', r'8'),
        (r'9', r'9'), (r'A', r'A'), (r'B', r'B'), (r'C', r'C'), (r'D', r'D'), (r'E', r'E'), (r'F', r'F'), (r'G', r'G'), (r'H', r'H'),
        (r'I', r'I'), (r'J', r'J'), (r'K', r'K'), (r'L', r'L'), (r'M', r'M'), (r'N', r'N'), (r'O', r'O'), (r'P', r'P'), (r'Q', r'Q'),
        (r'R', r'R'), (r'S', r'S'), (r'T', r'T'), (r'U', r'U'), (r'V', r'V'), (r'W', r'W'), (r'X', r'X'), (r'Y', r'Y'), (r'Z', r'Z'),
        (r'a', r'A'), (r'b', r'B'), (r'c', r'C'), (r'd', r'D'), (r'e', r'E'), (r'f', r'F'), (r'g', r'G'), (r'h', r'H'), (r'i', r'I'),
        (r'j', r'J'), (r'k', r'K'), (r'l', r'L'), (r'm', r'M'), (r'n', r'N'), (r'o', r'O'), (r'p', r'P'), (r'q', r'Q'), (r'r', r'R'),
        (r's', r'S'), (r't', r'T'), (r'u', r'U'), (r'v', r'V'), (r'w', r'W'), (r'x', r'X'), (r'y', r'Y'), (r'z', r'Z'), (r'-', r'-'),
        (r'\u{FF0D}', r'-'), (r'\u{2010}', r'-'), (r'\u{2011}', r'-'), (r'\u{2012}', r'-'), (r'\u{2013}', r'-'), (r'\u{2014}', r'-'),
        (r'\u{2015}', r'-'), (r'\u{2212}', r'-'), (r'/', r'/'), (r'\u{FF0F}', r'/'), (r' ', r' '), (r'\u{3000}', r' '),
        (r'\u{2060}', r' '), (r'.', r'.'), (r'\u{FF0E}', r'.')])

    private static let SINGLE_INTERNATIONAL_PREFIX: Regex = Regex("[\\d]+(?:[~\u{2053}\u{223C}\u{FF5E}][\\d]+)?")

    static let VALID_PUNCTUATION: String = 
        "-x\u{2010}-\u{2015}\u{2212}\u{30FC}\u{FF0D}-\u{FF0F} \u{00A0}\u{00AD}\u{200B}\u{2060}\u{3000}()\u{FF08}\u{FF09}\u{FF3B}\u{FF3D}.\\[\\]/~\u{2053}\u{223C}\u{FF5E}"

    private static let DIGITS: String = "\\d+"

    private static let VALID_ALPHA: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    static let PLUS_CHARS: String = "+＋"

    static let PLUS_CHARS_PATTERN: Regex = Regex("[${PLUS_CHARS}]+")

    private static let SEPARATOR_PATTERN: Regex = Regex("[${VALID_PUNCTUATION}]+")

    private static let CAPTURING_DIGIT_PATTERN: Regex = Regex("(${DIGITS})")

    private static let VALID_START_CHAR: String = "[${PLUS_CHARS}${DIGITS}]"

    private static let VALID_START_CHAR_PATTERN: Regex = Regex("${VALID_START_CHAR}")

    private static let SECOND_NUMBER_START: String = "[\\\\/] *x"

    static let SECOND_NUMBER_START_PATTERN: Regex = Regex("${SECOND_NUMBER_START}")

    private static let UNWANTED_END_CHARS: String = ".*[^/0-9a-zA-Z#]$" // .*[^/0-9a-zA-Z#]$ [^0-9A-Za-z#]+$

    static let UNWANTED_END_CHAR_PATTERN: Regex = Regex("${UNWANTED_END_CHARS}")

    private static let VALID_ALPHA_PHONE_PATTERN: Regex = Regex("(?:.*?[A-Za-z]){3}.*")

    private static let VALID_PHONE_NUMBER: String = 
        "${DIGITS}{${MIN_LENGTH_FOR_NSN}}/|[${PLUS_CHARS}]*+(?:[${VALID_PUNCTUATION}${STAR_SIGN}]*${DIGITS}){3,}[${VALID_PUNCTUATION}${STAR_SIGN}${VALID_ALPHA}${DIGITS}]*"

    private static let DEFAULT_EXTN_PREFIX: String = " ext. "

    private static let EXTN_PATTERNS_FOR_PARSING: String = createExtnPattern(true)

    private static func extnDigits(maxLength: Int32): String {
        return "(" + DIGITS + "{1," + "${maxLength}" + "})"
    }

    private static func createExtnPattern(forParsing: Bool): String {
        let extLimitAfterExplicitLabel: Int32 = 20
        let extLimitAfterLikelyLabel: Int32 = 15
        let extLimitAfterAmbiguousChar: Int32 = 9
        let extLimitWhenNotSure: Int32 = 6

        let possibleSeparatorsBetweenNumberAndExtLabel: String = "[  \\t,]*"
        let possibleCharsAfterExtLabel: String = "[:\\.．]?[  \\t,-]*"
        let optionalExtnSuffix: String = "#?"
        let explicitExtLabels: String = "(?:e?xt(?:ensi(?:ó?/|ó))?n?/|ｅ?ｘｔｎ?/|доб/|anexo)"
        let ambiguousExtLabels: String = "(?:[xｘ#＃~～]/|int/|ｉｎｔ)"
        let ambiguousSeparator: String = "[- ]+"
        let rfcExtn: String = RFC3966_EXTN_PREFIX + extnDigits(extLimitAfterExplicitLabel)
        let explicitExtn: String = possibleSeparatorsBetweenNumberAndExtLabel + explicitExtLabels +
                                    possibleCharsAfterExtLabel + extnDigits(extLimitAfterExplicitLabel) +
                                    optionalExtnSuffix
        let ambiguousExtn: String = possibleSeparatorsBetweenNumberAndExtLabel + ambiguousExtLabels +
                                    possibleCharsAfterExtLabel + 
                                    extnDigits(extLimitAfterAmbiguousChar) +
                                    optionalExtnSuffix
        let americanStyleExtnWithSuffix: String = ambiguousSeparator + extnDigits(extLimitWhenNotSure) + "#"
        let extensionPattern: String = rfcExtn + "/|" +
                                    explicitExtn + "/|" +
                                    ambiguousExtn + "/|" +
                                    americanStyleExtnWithSuffix
        if (forParsing) {
            let possibleSeparatorsNumberExtLabelNoComma: String = "[  \\t]*"
            let autoDiallingAndExtLabelsFound: String = "(?:,{2}/|;)"
            let autoDiallingExtn: String = possibleSeparatorsNumberExtLabelNoComma +
                                            autoDiallingAndExtLabelsFound +
                                            possibleCharsAfterExtLabel +
                                            extnDigits(extLimitAfterLikelyLabel) +
                                            optionalExtnSuffix
            let onlyCommasExtn: String = possibleSeparatorsNumberExtLabelNoComma +
                                            "(?:,)+" + possibleCharsAfterExtLabel +
                                            extnDigits(extLimitAfterAmbiguousChar) +
                                            optionalExtnSuffix
            return extensionPattern + "/|" + autoDiallingExtn + "/|" + onlyCommasExtn
        }
        return extensionPattern
    }

    private static let EXTN_PATTERN: Regex = Regex("(?:${EXTN_PATTERNS_FOR_PARSING})$", RegexOption().ignoreCase())

    private static let VALID_PHONE_NUMBER_PATTERN: Regex = Regex(
        "${VALID_PHONE_NUMBER}(?:${EXTN_PATTERNS_FOR_PARSING})?", RegexOption().ignoreCase())


    private static let FIRST_GROUP_PATTERN: Regex = Regex("(\\$\\d)")

    private static let NP_STRING: String = "$NP"
    private static let FG_STRING: String = "$FG"
    private static let CC_STRING: String = "$CC"

    private static let FIRST_GROUP_ONLY_PREFIX_PATTERN: Regex = Regex("\\(?\\$1\\)?")

    private static var instance: Option<PhoneNumberUtil> = Option<PhoneNumberUtil>.None

    public static let REGION_CODE_FOR_NON_GEO_ENTITY: String = "001"

    private let metadataSource: MetadataSource
    private let countryCallingCodeToRegionCodeMap: HashMap<Int32, ArrayList<String>>
    private let matcherApi: MatcherApi = RegexBasedMatcher.create()
    private let nanpaRegions: HashSet<String> = HashSet<String>(35)
    private let regexCache: RegexCache = RegexCache()
    private let supportedRegions: HashSet<String> = HashSet<String>(320)
    private let countryCodesForNonGeographicalRegion: HashSet<Int32> = HashSet<Int32>()
    private var logger: SimpleLogger = SimpleLogger()

    init(metadataSource: MetadataSource, countryCallingCodeToRegionCodeMap: HashMap<Int32, ArrayList<String>>) {
        this.metadataSource = metadataSource
        this.countryCallingCodeToRegionCodeMap = countryCallingCodeToRegionCodeMap

        for ((k, v) in countryCallingCodeToRegionCodeMap) {
            var regionCodes: ArrayList<String> = v
            let opt = regionCodes.get(0)
            match (opt) {
                case Some(v) => 
                    if (regionCodes.size == 1 && REGION_CODE_FOR_NON_GEO_ENTITY == (v)) {
                        countryCodesForNonGeographicalRegion.put(k)
                    } else {
                        supportedRegions.putAll(regionCodes)
                    }
                case None => ()
            }
        }

        if (supportedRegions.remove(REGION_CODE_FOR_NON_GEO_ENTITY)) {
            logger.log(LogLevel.WARN, "invalid metadata (country calling code was mapped to the non-geo " +
            "entity as well as specific region(s))")
        }
        
        let opt = countryCallingCodeToRegionCodeMap.get(NANPA_COUNTRY_CODE)
        match (opt) {
            case Some(v) => nanpaRegions.putAll(v)
            case None => ()
        }
    }

    static func extractPossibleNumber(number: String): String {
        var num: String = ""
        let m: Matcher = VALID_START_CHAR_PATTERN.matcher(number)
        let res1: Option<MatchData> = m.find()
        match (res1) {
            case Some(v) => 
                num = number[v.matchPosition().start..]
                let trailingCharsMatcher: Matcher = UNWANTED_END_CHAR_PATTERN.matcher(number)
                let res2: Option<MatchData> = trailingCharsMatcher.find()
                match (res2) {
                    case Some(m) =>
                        let mat: Matcher = Regex("[^0-9A-Za-z#]+$").matcher(m.matchStr())
                        let matd: Option<MatchData> = mat.find()
                        match (matd) {
                            case Some(y) =>
                                num = number[..y.matchPosition().start]
                            case None => ()
                        }
                    case None => ()
                }
                let secondNumber: Matcher = SECOND_NUMBER_START_PATTERN.matcher(number)
                let res3: Option<MatchData> = secondNumber.find()
                match (res3) {
                    case Some(w) =>
                        num = number[..w.matchPosition().start]
                    case None => ()
                }
                return num
            case None => return ""
        }
    }

    static func isViablePhoneNumber(number: String): Bool {
        if (number.size < MIN_LENGTH_FOR_NSN) {
            return false
        }
        let m: Matcher = VALID_PHONE_NUMBER_PATTERN.matcher(number)
        return findRes(m.fullMatch())
    }

    static func normalize(number: StringBuilder): StringBuilder {
        var str: String = number.toString()
        let m: Matcher = VALID_ALPHA_PHONE_PATTERN.matcher(str)
        let opt: Option<MatchData> = m.fullMatch()
        match (opt) {
            case Some(v) =>
                v.matchStr()
                str = str.replace(str, normalizeHelper(str, ALPHA_PHONE_MAPPINGS, true))
            case None =>
                str = str.replace(str, normalizeDigitsOnly(str))
        }
        return StringBuilder(str)
    }

    public static func normalizeDigitsOnly(number: String): String {
        return normalizeDigits(number, false).toString()
    }

    static func normalizeDigits(number: String, keepNonDigits: Bool): StringBuilder {
        var normalizedDigits: StringBuilder = StringBuilder()
        for (i in 0..number.size) {
            let c: Rune = Rune(number[i])
            let digit: Bool = c.isAsciiNumber()
            if (digit != false) {
                normalizedDigits.append(c)
            } else if (keepNonDigits) {
                normalizedDigits.append(c)
            }
        }
        return normalizedDigits
    }

    public static func normalizeDiallableCharsOnly(number: String): String {
        return normalizeHelper(number, DIALLABLE_CHAR_MAPPINGS, true)
    }

    private static func normalizeHelper(number: String, normalizationReplacements: HashMap<Rune, Rune>, 
        removeNonMatches: Bool): String {
        var normalizedNumber: StringBuilder = StringBuilder()
        for (i in 0..number.size) {
            let character: Rune = Rune(number[i])
            let newDigit: ?Rune = normalizationReplacements.get(character.toAsciiUpperCase())
            match (newDigit) {
                case Some(v) =>
                    normalizedNumber.append(v)
                case None =>
                    if (!removeNonMatches) {
                        normalizedNumber.append(character)
                    }
            }
        }
        return normalizedNumber.toString()
    }

    static func setInstance(util: PhoneNumberUtil): Unit {
        synchronized(lock) {
            instance = util
        }
    }

    private static func descHasPossibleNumberData(desc: PhonemetadataPhoneNumberDesc): Bool {
        return desc.getPossibleLengthCount() != 1 || desc.getPossibleLength(0) != -1
    }

    public static func getInstance(): Option<PhoneNumberUtil> {
        synchronized(lock) {
            match (instance) {
                case None => 
                    var metadataLoader: MetadataLoader = DefaultMetadataDependenciesProvider.getInstance().getMetadataLoader()
                    setInstance(createInstance(metadataLoader).getOrThrow())
                case _ => ()
            }
        }
        return instance.getOrThrow()
    }

    public static func createInstance(metadataLoader: MetadataLoader): Option<PhoneNumberUtil> {
        return createInstance(MetadataSourceImpl(
            DefaultMetadataDependenciesProvider.getInstance().getPhoneNumberMetadataFileNameProvider(),
            metadataLoader, 
            DefaultMetadataDependenciesProvider.getInstance().getMetadataParser()
            ))
    }

    public static func createInstance(metadataSource: MetadataSource): Option<PhoneNumberUtil> {
        return PhoneNumberUtil(metadataSource, CountryCodeToRegionCodeMap.getCountryCodeToRegionCodeMap())
    }

    private func isValidRegionCode(regionCode: String): Bool {
        return !regionCode.isEmpty() && supportedRegions.contains(regionCode)
    }

    private func hasValidCountryCallingCode(countryCallingCode: Int32): Bool {
        return countryCallingCodeToRegionCodeMap.contains(countryCallingCode)
    }

    public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat): String {
        if (number.getNationalNumbers() == 0 && number.hasRawInputs()) {
          var rawInput: String = number.getRawInputs()
          if (rawInput.size > 0) {
            return rawInput
          }
        }
        var formattedNumber: StringBuilder = StringBuilder()
        format(number, numberFormat, formattedNumber)
        return formattedNumber.toString()
    }

    public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit {
        var countryCallingCode: Int64 = number.getCountryCodes()
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        if (numberFormat == PhoneNumberFormat.E164) {
            formattedNumber.append(nationalSignificantNumber);
            prefixNumberWithCountryCallingCode(Int32(countryCallingCode), PhoneNumberFormat.E164, formattedNumber)
            return
        }
        if (!hasValidCountryCallingCode(Int32(countryCallingCode))) {
            formattedNumber.append(nationalSignificantNumber)
            return
        }
        var regionCode: Option<String> = getRegionCodeForCountryCode(Int32(countryCallingCode))
        if (regionCode != Option<String>.None){
            var metadata: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(Int32(countryCallingCode), regionCode.getOrThrow())
            formattedNumber.append(formatNsn(nationalSignificantNumber, metadata, numberFormat))
            maybeAppendFormattedExtension(number, metadata, numberFormat, formattedNumber)
            prefixNumberWithCountryCallingCode(Int32(countryCallingCode), numberFormat, formattedNumber)
        }else {
            throw IllegalArgumentException("regionCode is None")
        }
    }

    public open func formatByPattern(number: PhoneNumber, numberFormat: PhoneNumberFormat,
        userDefinedFormats: ArrayList<PhonemetadataNumberFormat>): String {
        var countryCallingCode: Int32 = Int32(number.getCountryCodes())
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        if (!hasValidCountryCallingCode(countryCallingCode)) {
            return nationalSignificantNumber
        }
        var regionCode: String = getRegionCodeForCountryCode(countryCallingCode)
        var metadata: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode)
        var formattedNumber: StringBuilder = StringBuilder()
        var formattingPattern: Option<PhonemetadataNumberFormat> = chooseFormattingPatternForNumber(userDefinedFormats, nationalSignificantNumber)
        if (formattingPattern == Option<PhonemetadataNumberFormat>.None) {
            formattedNumber.append(nationalSignificantNumber)
        } else {
            var numFormatCopy: NumberFormatBuilder = PhonemetadataNumberFormat.newBuilder()
            numFormatCopy.mergeFrom(formattingPattern.getOrThrow())
            var nationalPrefixFormattingRule: String = formattingPattern.getOrThrow().getNationalPrefixFormattingRule()
            if (nationalPrefixFormattingRule.size > 0) {
                var nationalPrefix: String = metadata.getNationalPrefix()
                if (nationalPrefix.size > 0) {
                    nationalPrefixFormattingRule = nationalPrefixFormattingRule.replace(NP_STRING, nationalPrefix)
                    nationalPrefixFormattingRule = nationalPrefixFormattingRule.replace(FG_STRING, "$1")
                    numFormatCopy.setNationalPrefixFormattingRule(nationalPrefixFormattingRule)
                } else {
                    numFormatCopy.clearNationalPrefixFormattingRule()
                }
            }
            formattedNumber.append(formatNsnUsingPattern(nationalSignificantNumber, numFormatCopy.build(), numberFormat))
        }
        maybeAppendFormattedExtension(number, metadata, numberFormat, formattedNumber)
        prefixNumberWithCountryCallingCode(countryCallingCode, numberFormat, formattedNumber)
        return formattedNumber.toString()
    }

    public open func formatNationalNumberWithCarrierCode(number: PhoneNumber, carrierCode: String): String {
        var countryCallingCode: Int32 = Int32(number.getCountryCodes())
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        if (!hasValidCountryCallingCode(countryCallingCode)) {
          return nationalSignificantNumber
        }
        var regionCode: String = getRegionCodeForCountryCode(countryCallingCode)
        var metadata: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode)
        var formattedNumber: StringBuilder = StringBuilder()
        formattedNumber.append(formatNsn(nationalSignificantNumber, metadata,PhoneNumberFormat.NATIONAL, carrierCode))
        maybeAppendFormattedExtension(number, metadata, PhoneNumberFormat.NATIONAL, formattedNumber)
        prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.NATIONAL,formattedNumber)
        return formattedNumber.toString()
    }

    private func getMetadataForRegionOrCallingCode(countryCallingCode: Int32, regionCode: String): PhonemetadataPhoneMetadata {
        if (REGION_CODE_FOR_NON_GEO_ENTITY == (regionCode)) {
            return getMetadataForNonGeographicalRegion(countryCallingCode)
        }
        return getMetadataForRegion(regionCode)
    }

    public open func formatNationalNumberWithPreferredCarrierCode(number: PhoneNumber, fallbackCarrierCode: String): String {
        if (number.getPreferredDomesticCarrierCodes().size > 0) {
            return formatNationalNumberWithCarrierCode(number, number.getPreferredDomesticCarrierCodes())
        } else {
            return formatNationalNumberWithCarrierCode(number, fallbackCarrierCode)
        }
    }

    public open func formatNumberForMobileDialing(number: PhoneNumber, regionCallingFrom: String, withFormatting: Bool): String {
        var countryCallingCode: Int32 = Int32(number.getCountryCodes())
        if (!hasValidCountryCallingCode(countryCallingCode)) {
            if (number.hasRawInputs()) {
                return  number.getRawInputs()
            } else { return "" }
        }
        var formattedNumber: String = "";
        var numberNoExt: PhoneNumber = PhoneNumber().mergeFrom(number).clearExtensions()
        var regionCode: String = getRegionCodeForCountryCode(countryCallingCode)
        var numberType: PhoneNumberType = getNumberType(numberNoExt)
        var isValidNumber: Bool = (numberType != PhoneNumberType.UNKNOWN)
        if (regionCallingFrom == (regionCode)) {
            var  isFixedLineOrMobile: Bool = (numberType == PhoneNumberType.FIXED_LINE) || (numberType == PhoneNumberType.MOBILE) || (numberType == PhoneNumberType.FIXED_LINE_OR_MOBILE)
            if (regionCode == ("CO") && numberType == PhoneNumberType.FIXED_LINE) {
              formattedNumber = formatNationalNumberWithCarrierCode(numberNoExt, COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX)
            } else if (regionCode == ("BR") && isFixedLineOrMobile) {
                if (numberNoExt.getPreferredDomesticCarrierCodes().size > 0) {
                    formattedNumber = formatNationalNumberWithPreferredCarrierCode(numberNoExt, "")
                }else { formattedNumber = "" }
            } else if (countryCallingCode == NANPA_COUNTRY_CODE) {
                var regionMetadata: PhonemetadataPhoneMetadata = getMetadataForRegion(regionCallingFrom)
                if (canBeInternationallyDialled(numberNoExt)) {
                    if (testNumberLength(getNationalSignificantNumber(numberNoExt), regionMetadata) != ValidationResult.TOO_SHORT) {
                        formattedNumber = format(numberNoExt, PhoneNumberFormat.INTERNATIONAL)
                    }
                } else {
                    formattedNumber = format(numberNoExt, PhoneNumberFormat.NATIONAL)
                }
            } else {
                if ((regionCode == REGION_CODE_FOR_NON_GEO_ENTITY || ((regionCode == "MX" || regionCode == "CL" || regionCode == "UZ") && isFixedLineOrMobile))) {
                    if (canBeInternationallyDialled(numberNoExt)) {
                        formattedNumber = format(numberNoExt, PhoneNumberFormat.INTERNATIONAL)
                    }
                } else {
                    formattedNumber = format(numberNoExt, PhoneNumberFormat.NATIONAL)
                }
            }
        } else if (isValidNumber) {
            if (canBeInternationallyDialled(numberNoExt)) {
                if (withFormatting) {
                    return format(numberNoExt, PhoneNumberFormat.INTERNATIONAL)
                } else {
                    return format(numberNoExt, PhoneNumberFormat.E164)
                }
            }
        }
        if (withFormatting) {
            return formattedNumber
        } else {
            return normalizeDiallableCharsOnly(formattedNumber)
        }
    }

    public open func formatOutOfCountryCallingNumber(number: PhoneNumber, regionCallingFrom: String): String {
        if (!isValidRegionCode(regionCallingFrom)) {
          return format(number, PhoneNumberFormat.INTERNATIONAL)
        }
        var countryCallingCode: Int32 = Int32(number.getCountryCodes())
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        if (!hasValidCountryCallingCode(countryCallingCode)) {
          return nationalSignificantNumber
        }
        if (countryCallingCode == NANPA_COUNTRY_CODE) {
            if (isNANPACountry(regionCallingFrom)) {
                return countryCallingCode.toString() + " " + format(number, PhoneNumberFormat.NATIONAL)
            }
        } else if (countryCallingCode == getCountryCodeForValidRegion(regionCallingFrom)) {
            return format(number, PhoneNumberFormat.NATIONAL)
        }
        var metadataForRegionCallingFrom: PhonemetadataPhoneMetadata = getMetadataForRegion(regionCallingFrom)
        var internationalPrefix: String = metadataForRegionCallingFrom.getInternationalPrefix()
        var internationalPrefixForFormatting: String = ""
        if (metadataForRegionCallingFrom.hasPreferredInternationalPrefixFunc()) {
            internationalPrefixForFormatting = metadataForRegionCallingFrom.getPreferredInternationalPrefix()
        } else if (findAllResult(SINGLE_INTERNATIONAL_PREFIX.matcher(internationalPrefix).findAll())) {
            internationalPrefixForFormatting = internationalPrefix
        }
        var regionCode: String = getRegionCodeForCountryCode(countryCallingCode)
        var metadataForRegion: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode)
        var formattedNationalNumber: String = formatNsn(nationalSignificantNumber, metadataForRegion, PhoneNumberFormat.INTERNATIONAL)
        var formattedNumber: StringBuilder = StringBuilder(formattedNationalNumber)
        maybeAppendFormattedExtension(number, metadataForRegion, PhoneNumberFormat.INTERNATIONAL,formattedNumber)
        if (internationalPrefixForFormatting.size > 0) {
            let opt = internationalPrefixForFormatting + " " + countryCallingCode.toString() + " " + formattedNumber.toString()
            formattedNumber = StringBuilder(opt)
        } else {
            prefixNumberWithCountryCallingCode(countryCallingCode,PhoneNumberFormat.INTERNATIONAL,formattedNumber)
        }
        return formattedNumber.toString()
    }

    private func findAllResult(matchData: Option<Array<MatchData>>): Bool {
        if (let None <- matchData) {
            return false
        }
        return true
    }

    public static func getCountryMobileToken(countryCallingCode: Int32): String {
        if (MOBILE_TOKEN_MAPPINGS.contains(countryCallingCode)) {
            return MOBILE_TOKEN_MAPPINGS.get(countryCallingCode).getOrThrow()
        }
        return ""
    }

    public open func formatOutOfCountryKeepingAlphaChars(number: PhoneNumber, regionCallingFrom: String): String {
        var rawInput: String = number.getRawInputs()
        if (rawInput.size == 0) {
          return formatOutOfCountryCallingNumber(number, regionCallingFrom)
        }
        var countryCode: Int32 = Int32(number.getCountryCodes())
        if (!hasValidCountryCallingCode(countryCode)) {
          return rawInput
        }
        rawInput = normalizeHelper(rawInput, ALL_PLUS_NUMBER_GROUPING_SYMBOLS, true)
        var nationalNumber: String = getNationalSignificantNumber(number)
        if (nationalNumber.size > 3) {
          var firstNationalNumberDigit = match(rawInput.indexOf(nationalNumber[..3])){
              case Some(x) => x
              case None => -1
          }
          if (firstNationalNumberDigit != -1) {
            rawInput = rawInput[firstNationalNumberDigit..]
          }
        }
        var metadataForRegionCallingFrom: PhonemetadataPhoneMetadata = getMetadataForRegion(regionCallingFrom)
        if (countryCode == NANPA_COUNTRY_CODE) {
            if (isNANPACountry(regionCallingFrom)) {
                return countryCode.toString() + " " + rawInput
            }
        } else if (metadataForRegionCallingFrom != PhonemetadataPhoneMetadata()) {
            if (countryCode == getCountryCodeForValidRegion(regionCallingFrom)) {
                var formattingPattern: Option<PhonemetadataNumberFormat> = chooseFormattingPatternForNumber(metadataForRegionCallingFrom.getNumberFormatList(), nationalNumber)
                if (formattingPattern == Option<PhonemetadataNumberFormat>.None) {
                    return rawInput
                }
                var newFormat: NumberFormatBuilder = PhonemetadataNumberFormat.newBuilder()
                newFormat.mergeFrom(formattingPattern.getOrThrow())
                newFormat.setPattern("(\\d+)(.*)")
                newFormat.setFormat("$1$2")
                return formatNsnUsingPattern(rawInput, newFormat.build(), PhoneNumberFormat.NATIONAL)
            }
        }
        var internationalPrefixForFormatting: String = ""
        if (metadataForRegionCallingFrom != PhonemetadataPhoneMetadata()) {
            var internationalPrefix: String = metadataForRegionCallingFrom.getInternationalPrefix();
            if (findRes(SINGLE_INTERNATIONAL_PREFIX.matcher(internationalPrefix).fullMatch())) {
                internationalPrefixForFormatting = internationalPrefix
            }else {
                internationalPrefixForFormatting = metadataForRegionCallingFrom.getPreferredInternationalPrefix()
            }
        }
        var formattedNumber: StringBuilder = StringBuilder(rawInput)
        var regionCode: String = getRegionCodeForCountryCode(countryCode);
        var metadataForRegion: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(countryCode, regionCode)
        maybeAppendFormattedExtension(number, metadataForRegion, PhoneNumberFormat.INTERNATIONAL, formattedNumber)
        if (internationalPrefixForFormatting.size > 0) {
            let opt = internationalPrefixForFormatting + " " + countryCode.toString() + " " + formattedNumber.toString()
            formattedNumber = StringBuilder(opt)
        } else {
            if (!isValidRegionCode(regionCallingFrom)) {
                println("Trying to format number from invalid region " + regionCallingFrom + ". International formatting applied.")
            }
            prefixNumberWithCountryCallingCode(countryCode, PhoneNumberFormat.INTERNATIONAL, formattedNumber)
        }
        return formattedNumber.toString()
    }

    public open func getNationalSignificantNumber(number: PhoneNumber): String {
        var nationalNumber: StringBuilder = StringBuilder()
        if (number.isItalianLeadingZeros() && number.getNumbersOfLeadingZeros() > 0) {
          var zeros: Array<Rune> = Array<Rune>(number.getNumbersOfLeadingZeros(), item: r'0')
          nationalNumber.append(String(zeros))
        }
        nationalNumber.append(number.getNationalNumbers())
        return nationalNumber.toString()
    }

    private func prefixNumberWithCountryCallingCode(countryCallingCode: Int32, numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit {
        match (numberFormat) {
            case E164 =>
                let opt = String(PLUS_SIGN) + countryCallingCode.toString() + formattedNumber.toString()
                formattedNumber.reset()
                formattedNumber.append(opt)
                return
            case INTERNATIONAL =>
                let opt = String(PLUS_SIGN) + countryCallingCode.toString() + " " + formattedNumber.toString()
                formattedNumber.reset()
                formattedNumber.append(opt)
                return
            case RFC3966 =>
                let opt = String(PLUS_SIGN) + countryCallingCode.toString() + "-" + formattedNumber.toString()
                formattedNumber.reset()
                formattedNumber.append(opt)
                return
            case NATIONAL => return
        }
    }

    private func formatNsn(number: String, metadata: PhonemetadataPhoneMetadata, numberFormat: PhoneNumberFormat): String {
        return formatNsn(number, metadata, numberFormat, Option<String>.None)
    }

    private func formatNsn(number: String, metadata: PhonemetadataPhoneMetadata, numberFormat: PhoneNumberFormat, carrierCode: Option<String>): String {
        var intlNumberFormats: ArrayList<PhonemetadataNumberFormat> = metadata.getIntlNumberFormatList()
        var availableFormats: ArrayList<PhonemetadataNumberFormat>
        if (intlNumberFormats.size == 0 || numberFormat == PhoneNumberFormat.NATIONAL) {
            availableFormats = metadata.getNumberFormatList()
        }else {
            availableFormats = metadata.getIntlNumberFormatList()
        }
        var formattingPattern: Option<PhonemetadataNumberFormat>= chooseFormattingPatternForNumber(availableFormats, number)
        if (formattingPattern == Option<PhonemetadataNumberFormat>.None) {
            return number
        }else {
            return formatNsnUsingPattern(number, formattingPattern.getOrThrow(), numberFormat, carrierCode)
        }
    }

    protected open func chooseFormattingPatternForNumber(availableFormats: ArrayList<PhonemetadataNumberFormat>,
        nationalNumber: String): Option<PhonemetadataNumberFormat> {
        for (numFormat in availableFormats) {
            var size: Int32 = numFormat.getLeadingDigitsPatternCount()
            if (size == 0) {
                var m: Matcher = regexCache.getPatternForRegex(numFormat.getPattern()).matcher(nationalNumber)
                if (matchesFullMatch(m)) {
                  return numFormat
                }
            }
            if (size != 0) {
                if (lookingAt(regexCache.getPatternForRegex(numFormat.getLeadingDigitsPattern(size - 1).getOrThrow()).matcher(nationalNumber).matchStart())) {
                    var m: Matcher = regexCache.getPatternForRegex(numFormat.getPattern()).matcher(nationalNumber)
                    if (matchesFullMatch(m)) {
                    return numFormat
                    }
                }
            }
        }
        return Option<PhonemetadataNumberFormat>.None
    }

    private func matchesFullMatch(matchs: Matcher): Bool {
        if (let None <- matchs.fullMatch()) {
            return false
        }
        return true
    }

    protected open func formatNsnUsingPattern(nationalNumber: String, formattingPattern: PhonemetadataNumberFormat,
        numberFormat: PhoneNumberFormat): String {
        return formatNsnUsingPattern(nationalNumber, formattingPattern, numberFormat, Option<String>.None)
    }

    private func formatNsnUsingPattern(nationalNumber: String, formattingPattern: PhonemetadataNumberFormat,
        numberFormat: PhoneNumberFormat, carrierCode: Option<String>): String {
        var numberFormatRule: String = formattingPattern.getFormat()
        var m: Matcher = regexCache.getPatternForRegex(formattingPattern.getPattern()).matcher(nationalNumber)
        var formattedNationalNumber: String = ""
        if (numberFormat == PhoneNumberFormat.NATIONAL && carrierCode != Option<String>.None && carrierCode.getOrThrow().size > 0 && formattingPattern.getDomesticCarrierCodeFormattingRule().size > 0) {
            var carrierCodeFormattingRule: String = formattingPattern.getDomesticCarrierCodeFormattingRule()
            carrierCodeFormattingRule = carrierCodeFormattingRule.replace(CC_STRING, carrierCode.getOrThrow())
            numberFormatRule = FIRST_GROUP_PATTERN.matcher(numberFormatRule).replace(carrierCodeFormattingRule)
            formattedNationalNumber = replaceFormat(m, numberFormatRule)
        } else {
            var nationalPrefixFormattingRule: String = formattingPattern.getNationalPrefixFormattingRule()
            if (numberFormat == PhoneNumberFormat.NATIONAL && nationalPrefixFormattingRule.size > 0) {
                var firstGroupMatcher: Matcher = FIRST_GROUP_PATTERN.matcher(numberFormatRule)
                formattedNationalNumber = replaceFormat(m, firstGroupMatcher.replace(nationalPrefixFormattingRule))
            } else {
                formattedNationalNumber = replaceFormat(m, numberFormatRule)
            }
        }
        if (numberFormat == PhoneNumberFormat.RFC3966) {
            var matcher: Matcher = SEPARATOR_PATTERN.matcher(formattedNationalNumber)
            if (lookingAt(matcher.matchStart())) {
                formattedNationalNumber = matcher.replace("", 0)
            }
            formattedNationalNumber = matcher.resetString(formattedNationalNumber).replaceAll("-")
        }
        return formattedNationalNumber
    }

    private func replaceFormat(m: Matcher, numberFormatRule: String): String {
        var numberFormatRuleTmp = numberFormatRule
        var res: String = ""
        match (m.find()) {
            case Some(x) =>
                for (i in 1..x.groupNumber() + 1) {
                    res = numberFormatRuleTmp.replace("$${i}", x.matchStr(i))
                    numberFormatRuleTmp = res
                }
            case None => res = m.getString()
        }
        return res
    }

    private func maybeAppendFormattedExtension(number: PhoneNumber, metadata: PhonemetadataPhoneMetadata, 
        numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit {
        if (number.hasExtensions() && number.getExtensions().size > 0) {
            if (numberFormat == PhoneNumberFormat.RFC3966) {
                formattedNumber.append(RFC3966_EXTN_PREFIX)
                formattedNumber.append(number.getExtensions())
            } else {
                if (metadata.hasPreferredExtnPrefixFunc()) {
                    formattedNumber.append(metadata.getPreferredExtnPrefix())
                    formattedNumber.append(number.getExtensions())
                } else {
                    formattedNumber.append(DEFAULT_EXTN_PREFIX)
                    formattedNumber.append(number.getExtensions())
                }
            }
        }
    }

    protected open func getNumberDescByType(metadata: PhonemetadataPhoneMetadata, types: PhoneNumberType): PhonemetadataPhoneNumberDesc {
        match (types) {
            case PREMIUM_RATE => return metadata.getPremiumRate().getOrThrow()
            case TOLL_FREE => return metadata.getTollFree().getOrThrow()
            case MOBILE => return metadata.getMobile().getOrThrow()
            case FIXED_LINE => return metadata.getFixedLine().getOrThrow()
            case FIXED_LINE_OR_MOBILE => return metadata.getFixedLine().getOrThrow()
            case SHARED_COST => return metadata.getSharedCost().getOrThrow()
            case VOIP => return metadata.getVoip().getOrThrow()
            case PERSONAL_NUMBER => return metadata.getPersonalNumber().getOrThrow()
            case PAGER => return metadata.getPager().getOrThrow()
            case UAN => return metadata.getUan().getOrThrow()
            case VOICEMAIL => return metadata.getVoicemail().getOrThrow()
            case _ => return metadata.getGeneralDesc().getOrThrow()
        }
    }

    public func isValidNumber(number: PhoneNumber): Bool {
        var regionCode: Option<String> = getRegionCodeForNumber(number)
        if (regionCode == Option<String>.None) {
            return false
        }
        return isValidNumberForRegion(number, regionCode.getOrThrow())
    }

    public func isValidNumberForRegion(number: PhoneNumber, regionCode: String): Bool {
        var countryCode: Int64 = number.getCountryCodes()
        var metadata: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(Int32(countryCode), regionCode)
        if ((REGION_CODE_FOR_NON_GEO_ENTITY != regionCode)) {
            if (countryCode != Int64(getCountryCodeForValidRegion(regionCode))) {
                return false
            }
        }
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        return getNumberTypeHelper(nationalSignificantNumber, metadata) != PhoneNumberType.UNKNOWN
    }

    public func isNumberGeographical(phoneNumberType: PhoneNumberType, countryCallingCode: Int32): Bool {
        return phoneNumberType == PhoneNumberType.FIXED_LINE || phoneNumberType == PhoneNumberType.FIXED_LINE_OR_MOBILE || (GEO_MOBILE_COUNTRIES.contains(countryCallingCode) && phoneNumberType == PhoneNumberType.MOBILE)
    }

    public open func getNumberType(number: PhoneNumber): PhoneNumberType {
        var regionCode: Option<String> = getRegionCodeForNumber(number)
        if (regionCode == Option<String>.None) {
            return PhoneNumberType.UNKNOWN
        }
        var metadata: PhonemetadataPhoneMetadata = getMetadataForRegionOrCallingCode(Int32(number.getCountryCodes()), regionCode.getOrThrow())
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        return getNumberTypeHelper(nationalSignificantNumber, metadata)
    }

    private func getNumberTypeHelper(nationalNumber: String, metadata: PhonemetadataPhoneMetadata): PhoneNumberType {
        if (!isNumberMatchingDesc(nationalNumber, metadata.getGeneralDesc().getOrThrow())) {
            return PhoneNumberType.UNKNOWN
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getPremiumRate().getOrThrow())) {
            return PhoneNumberType.PREMIUM_RATE
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getTollFree().getOrThrow())) {
            return PhoneNumberType.TOLL_FREE
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getSharedCost().getOrThrow())) {
            return PhoneNumberType.SHARED_COST
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getVoip().getOrThrow())) {
            return PhoneNumberType.VOIP
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getPersonalNumber().getOrThrow())) {
            return PhoneNumberType.PERSONAL_NUMBER
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getPager().getOrThrow())) {
            return PhoneNumberType.PAGER
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getUan().getOrThrow())) {
            return PhoneNumberType.UAN
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getVoicemail().getOrThrow())) {
            return PhoneNumberType.VOICEMAIL
        }

        var isFixedLine: Bool = isNumberMatchingDesc(nationalNumber, metadata.getFixedLine().getOrThrow())
        if (isFixedLine) {
            if (metadata.getSameMobileAndFixedLinePattern()) {
              return PhoneNumberType.FIXED_LINE_OR_MOBILE
            } else if (isNumberMatchingDesc(nationalNumber, metadata.getMobile().getOrThrow())) {
              return PhoneNumberType.FIXED_LINE_OR_MOBILE
            }
            return PhoneNumberType.FIXED_LINE
        }
        if (!metadata.getSameMobileAndFixedLinePattern() && isNumberMatchingDesc(nationalNumber, metadata.getMobile().getOrThrow())) {
            return PhoneNumberType.MOBILE
        }
        return PhoneNumberType.UNKNOWN
    }

    protected open func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata {
        if (!isValidRegionCode(regionCode)) {
            return PhonemetadataPhoneMetadata()
        }
        var phoneMetadata: PhonemetadataPhoneMetadata = metadataSource.getMetadataForRegion(regionCode)
        ensureMetadataIsNonNull(phoneMetadata, "Missing metadata for region code " + regionCode)
        return phoneMetadata
    }

    protected open func getMetadataForNonGeographicalRegion(countryCallingCode: Int32): PhonemetadataPhoneMetadata {
        if (!countryCodesForNonGeographicalRegion.contains(countryCallingCode)) {
            return PhonemetadataPhoneMetadata()
        }
        var phoneMetadata: PhonemetadataPhoneMetadata = metadataSource.getMetadataForNonGeographicalRegion(countryCallingCode)
        ensureMetadataIsNonNull(phoneMetadata, "Missing metadata for country code " + "${countryCallingCode}")
        return phoneMetadata
    }

    private static func ensureMetadataIsNonNull(phoneMetadata: ?PhonemetadataPhoneMetadata, message: String): Unit {
        if (let None <- phoneMetadata) {
            throw MissingMetadataException(message)
        }
    }

    protected open func isNumberMatchingDesc(nationalNumber: String, numberDesc: PhonemetadataPhoneNumberDesc): Bool {
        var actualLength: Int64 = nationalNumber.size
        var possibleLengths: ArrayList<Int32> = numberDesc.getPossibleLengthList()
        if (possibleLengths.size > 0 && !possibleLengths.contains(Int32(actualLength))) {
            return false
        }
        return matcherApi.matchNationalNumber(nationalNumber, numberDesc, false)
    }

    public open func getRegionCodeForNumber(number: PhoneNumber): Option<String> {
        var countryCode: Int32 = Int32(number.getCountryCodes())
        var regions: Option<ArrayList<String>> = countryCallingCodeToRegionCodeMap.get(countryCode)
        if (regions == Option<ArrayList<String>>.None) {
            return Option<String>.None
        }
        if (regions.getOrThrow().size == 1) {
          return regions.getOrThrow().get(0)
        } else {
          return getRegionCodeForNumberFromRegionList(number, regions.getOrThrow())
        }
    }

    private func getRegionCodeForNumberFromRegionList(number: PhoneNumber, regionCodes: ArrayList<String>): Option<String> {
        var nationalNumber: String = getNationalSignificantNumber(number)
        for (regionCode in regionCodes) {
            var metadata: PhonemetadataPhoneMetadata = getMetadataForRegion(regionCode)
            if (metadata.hasLeadingDigitsFunc()) {
                if ( lookingAt(regexCache.getPatternForRegex(metadata.getLeadingDigits()).matcher(nationalNumber).matchStart()) ) {
                    return regionCode
                }
            } else if (getNumberTypeHelper(nationalNumber, metadata) != PhoneNumberType.UNKNOWN) {
                return regionCode
            }
        }
        return Option<String>.None
    }

    public open func getRegionCodeForCountryCode(countryCallingCode: Int32): String {
        var regionCodes: ?ArrayList<String> = countryCallingCodeToRegionCodeMap.get(countryCallingCode)
        match (regionCodes) {
            case Some(v) => 
                let opt = v.get(0)
                match (opt) {
                    case Some(w) => return w
                    case None => return "empty value"
                }
            case None => return UNKNOWN_REGION
        }
    }

    private func getCountryCodeForValidRegion(regionCode: String): Int32 {
        var metadata: PhonemetadataPhoneMetadata = getMetadataForRegion(regionCode);
        if (metadata == PhonemetadataPhoneMetadata()) {
            throw IllegalArgumentException("Invalid region code: " + regionCode);
        }
        return metadata.getCountryCode()
    }

    public func getCountryCodeForRegion(regionCode: String): Int32 {
        if (!isValidRegionCode(regionCode)) {
            return 0
        }
      return getCountryCodeForValidRegion(regionCode)
    }

    public open func isNANPACountry(regionCode: String): Bool {
        return nanpaRegions.contains(regionCode)
    }

    private func testNumberLength(number: String, metadata: PhonemetadataPhoneMetadata): ValidationResult {
        return testNumberLength(number, metadata, PhoneNumberType.UNKNOWN)
    }

    private func testNumberLength(number: String, metadata: PhonemetadataPhoneMetadata, types: PhoneNumberType): ValidationResult {
        var descForType: PhonemetadataPhoneNumberDesc = getNumberDescByType(metadata, types)
        var possibleLengths: ArrayList<Int32> = ArrayList<Int32>()
        if (descForType.getPossibleLengthList().isEmpty()) {
            possibleLengths = metadata.getGeneralDesc().getOrThrow().getPossibleLengthList()
        } else {
            possibleLengths = descForType.getPossibleLengthList()
        }
        var localLengths: ArrayList<Int32> = descForType.getPossibleLengthLocalOnlyList()
        if (types == PhoneNumberType.FIXED_LINE_OR_MOBILE) {
            if (!descHasPossibleNumberData(getNumberDescByType(metadata, PhoneNumberType.FIXED_LINE))) {
                return testNumberLength(number, metadata, PhoneNumberType.MOBILE)
            } else {
                var mobileDesc: PhonemetadataPhoneNumberDesc = getNumberDescByType(metadata, PhoneNumberType.MOBILE)
                if (descHasPossibleNumberData(mobileDesc)) {
                    possibleLengths = ArrayList<Int32>(possibleLengths)
                    if (mobileDesc.getPossibleLengthCount() == 0) {
                        possibleLengths.appendAll(metadata.getGeneralDesc().getOrThrow().getPossibleLengthList())
                    } else {
                        possibleLengths.appendAll(mobileDesc.getPossibleLengthList())
                    }
                    possibleLengths.sort()
                    if (localLengths.isEmpty()) {
                        localLengths = mobileDesc.getPossibleLengthLocalOnlyList()
                    } else {
                        localLengths = ArrayList<Int32>(localLengths)
                        localLengths.appendAll(mobileDesc.getPossibleLengthLocalOnlyList())
                        localLengths.sort()
                    }
                }
            }
        }

        let opt = possibleLengths.get(0)
        match (opt) {
            case Some(v) =>
                if (v == -1) {
                    return ValidationResult.INVALID_LENGTH
                }
            case None => ()
        }

        var actualLength: Int64 = number.size

        if (localLengths.contains(Int32(actualLength))) {
            return ValidationResult.IS_POSSIBLE_LOCAL_ONLY
        }

        let opt2 = possibleLengths.get(0)
        match (opt2) {
            case Some(b) =>
                var minimumLength: Int32 = b
                if (minimumLength == Int32(actualLength)) {
                    return ValidationResult.IS_POSSIBLE
                } else if (minimumLength > Int32(actualLength)) {
                    return ValidationResult.TOO_SHORT
                }
                let opt3 = possibleLengths.get(possibleLengths.size - 1)
                match (opt3) {
                    case Some(c) =>
                        if (c < Int32(actualLength)) {
                            return ValidationResult.TOO_LONG
                        }
                    case None => ()
                }
            case None => ()
        }
        let r: Range<Int64> = 1..=possibleLengths.size -1 : 1
        var sli: ArrayList<Int32> = possibleLengths.slice(r)
        if (sli.contains(Int32(actualLength))) {
            return ValidationResult.IS_POSSIBLE
        }
        return ValidationResult.INVALID_LENGTH
    }

    protected open func extractCountryCode(fullNumber: StringBuilder, nationalNumber: StringBuilder): Int32 {
        let str: String = fullNumber.toString()
        if ((fullNumber.size != 0) || (Rune(str[0]) != r'0')) {
            var potentialCountryCode: Int32 = 0
            let numberLength: Int32 = Int32(fullNumber.size)
            for (i in 1..numberLength) {
                if (i <= 3) {
                    potentialCountryCode = Int32.parse(str[..Int64(i)])
                    if (countryCallingCodeToRegionCodeMap.contains(potentialCountryCode)) {
                        nationalNumber.append(str[Int64(i)..])
                        return potentialCountryCode
                    }
                }
            }
            return 0
        } else {
            return 0
        }
    }

    protected open func maybeExtractCountryCode(number: String, defaultRegionMetadata: ?PhonemetadataPhoneMetadata, nationalNumber: StringBuilder, keepRawInput: Bool, phoneNumber: PhoneNumber): Int32 {
        if (number.size == 0) {
            return 0
        } else {
            var fullNumber: StringBuilder = StringBuilder(number)
            var possibleCountryIddPrefix: String = "NonMatch"
            if (let Some(i) <- defaultRegionMetadata) {
                possibleCountryIddPrefix = i.getInternationalPrefix()
            }
            var countryCodeSource: (CountryCodeSource, StringBuilder) = maybeStripInternationalPrefixAndNormalize(fullNumber, possibleCountryIddPrefix)
            if (keepRawInput) {
                phoneNumber.setCountryCodeSources(countryCodeSource[0])
            }
            fullNumber = countryCodeSource[1]
            if (countryCodeSource[0] != CountryCodeSource.FROM_DEFAULT_COUNTRY) {
                if (fullNumber.size <= MIN_LENGTH_FOR_NSN) {
                    throw NumberParseException(ErrorType.TOO_SHORT_AFTER_IDD,
                                        "Phone number had an IDD, but after this was not "+ "long enough to be a viable phone number.")
                }
                var potentialCountryCode: Int32 = extractCountryCode(fullNumber, nationalNumber)
                if (potentialCountryCode != 0) {
                    phoneNumber.setCountryCodes(Int64(potentialCountryCode))
                    return potentialCountryCode
                }
                throw NumberParseException(ErrorType.INVALID_COUNTRY_CODE, "Country calling code supplied was not recognised.")
            } else {
                if (let Some(i) <- defaultRegionMetadata) {
                    let defaultCountryCode: Int32 = i.getCountryCode()
                    let defaultCountryCodeString: String = "${defaultCountryCode}"
                    var normalizedNumber: String = fullNumber.toString()
                    if (normalizedNumber.startsWith(defaultCountryCodeString)) {
                        var potentialNationalNumber: StringBuilder = StringBuilder(normalizedNumber[defaultCountryCodeString.size..])
                        var generalDesc: PhonemetadataPhoneNumberDesc = defaultRegionMetadata.getOrThrow().getGeneralDesc().getOrThrow()
                        maybeStripNationalPrefixAndCarrierCode(potentialNationalNumber, defaultRegionMetadata.getOrThrow(), StringBuilder())
                        if ((!matcherApi.matchNationalNumber(normalizedNumber, generalDesc, false) &&
                            matcherApi.matchNationalNumber(potentialNationalNumber.toString(), generalDesc, false))) {
                            nationalNumber.append(potentialNationalNumber)
                            if (keepRawInput) {
                                phoneNumber.setCountryCodeSources(CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN)
                            }
                            phoneNumber.setCountryCodes(Int64(defaultCountryCode))
                            return defaultCountryCode
                        }
                        if (testNumberLength(normalizedNumber, defaultRegionMetadata.getOrThrow()) == ValidationResult.TOO_LONG) {
                            nationalNumber.append(potentialNationalNumber)
                            if (keepRawInput) {
                                phoneNumber.setCountryCodeSources(CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN)
                            }
                            phoneNumber.setCountryCodes(Int64(defaultCountryCode))
                            return defaultCountryCode
                        }
                    }
                }
                phoneNumber.setCountryCodes(0)
                return 0
            }
        }
    }

    private func parsePrefixAsIdd(iddPattern: Regex, number: StringBuilder): Bool {
        var m: Option<MatchData> = iddPattern.matcher(number.toString()).matchStart()
        match (m) {
            case Some(v) =>
                var matchEnd = v.matchPosition().end
                var digitMatcher: Option<MatchData>  = CAPTURING_DIGIT_PATTERN.matcher(number.toString()[matchEnd..]).find()
                match (digitMatcher) {
                    case Some(w) =>
                        var normalizedGroup: String = normalizeDigitsOnly(w.matchStr(1))
                        if (normalizedGroup == ("0")) {
                            return false
                        }
                    case None => ()
                }
                let s = number.toString()[matchEnd..]
                number.reset()
                number.append(s)
                return true
            case None => ()
        }
        return false
    }

    protected open func maybeStripInternationalPrefixAndNormalize(number: StringBuilder, possibleIddPrefix: String): (CountryCodeSource, StringBuilder) {
        var strBuild: StringBuilder = StringBuilder()
        if (number.size == 0) {
            return (CountryCodeSource.FROM_DEFAULT_COUNTRY, strBuild)
        } else {
            let m: Option<MatchData> = PLUS_CHARS_PATTERN.matcher(number.toString()).matchStart()
            match (m) {
                case Some(v) =>
                    let s = number.toString()[v.matchPosition().end..]
                    number.reset()
                    number.append(s)
                    strBuild = normalize(number)
                    return (CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN, strBuild)
                case None =>
                    var iddPattern: Regex = regexCache.getPatternForRegex(possibleIddPrefix)
                    strBuild = normalize(number)
                    if (parsePrefixAsIdd(iddPattern, strBuild)) {
                        return (CountryCodeSource.FROM_NUMBER_WITH_IDD, strBuild)
                    } else {
                        return (CountryCodeSource.FROM_DEFAULT_COUNTRY, strBuild)
                    }
            }
        }
    }

    static func formattingRuleHasFirstGroupOnly(nationalPrefixFormattingRule: String): Bool {
        return (nationalPrefixFormattingRule.size == 0) || (findRes(FIRST_GROUP_ONLY_PREFIX_PATTERN.matcher(nationalPrefixFormattingRule).fullMatch()))
    }

    public func getRegionCodesForCountryCode(countryCallingCode: Int32): ArrayList<String> {
        let regionCodes = match (countryCallingCodeToRegionCodeMap.get(countryCallingCode)) {
            case Some(v) => v
            case None => ArrayList<String>()
        }
        return regionCodes
    }

    static func findRes(matchData: Option<MatchData>): Bool {
        if (let None <- matchData) {
            return false
        }
        return true
    }

    private func lookingAt(matchData: Option<MatchData>): Bool {
        if (let None <- matchData) {
            return false
        }
        return true
    }
    protected open func maybeStripNationalPrefixAndCarrierCode(number: StringBuilder, metadata: PhonemetadataPhoneMetadata,
        carrierCode: StringBuilder): Bool {
        let numberLength: Int32 = Int32(number.size)
        let possibleNationalPrefix: String = metadata.getNationalPrefixForParsing()
        var numberStr: String = number.toString()
        if (numberLength == 0 || possibleNationalPrefix.size == 0) {
            return false
        }
        var prefixMatcher: Matcher = regexCache.getPatternForRegex(possibleNationalPrefix).matcher(numberStr)
        var res: Option<MatchData> = prefixMatcher.matchStart()
        match (res) {
            case Some(v) =>
                var generalDesc: PhonemetadataPhoneNumberDesc = metadata.getGeneralDesc().getOrThrow()
                var isViableOriginalNumber: Bool = matcherApi.matchNationalNumber(numberStr, generalDesc, false)
                var numOfGroups: Int32 = Int32(prefixMatcher.allCount())
                var transformRule: String = metadata.getNationalPrefixTransformRule()
                if (transformRule.isEmpty() || transformRule.size == 0 || v.matchStr(Int64(numOfGroups)).isEmpty()) {
                    if (isViableOriginalNumber && !matcherApi.matchNationalNumber(numberStr[prefixMatcher.getString().size..], generalDesc, false)) {
                        return false
                    }
                    if (carrierCode.size > 0 && numOfGroups > 0 && !(v.matchStr(Int64(numOfGroups))).isEmpty()) {
                    carrierCode.append(v.matchStr(1))
                    }
                    let s = number.toString()[1..]
                    number.reset()
                    number.append(s)
                    return true
                } else {
                    var transformedNumber: StringBuilder = StringBuilder(numberStr)
                    var transformedNumberStr: String = transformedNumber.toString()
                    transformedNumberStr.replace(transformedNumberStr, prefixMatcher.replace(transformRule, 0))
                    if (isViableOriginalNumber && !matcherApi.matchNationalNumber(transformedNumberStr, generalDesc, false)) {
                        return false
                    }

                    if (carrierCode.size > 0 && numOfGroups > 1) {
                        carrierCode.append(v.matchStr(1))
                    }
                    numberStr.replace(numberStr, transformedNumberStr)
                    return true
                }
            case None => ()
        }
        return false
    }

    protected open func maybeStripExtension(number: StringBuilder): (String, StringBuilder) {
        let m: Option<MatchData> = EXTN_PATTERN.matcher(number.toString()).find()
        match (m) {
            case Some(v) =>
                if (isViablePhoneNumber(number.toString()[..v.matchPosition().start])) {
                    for (i in 1..v.groupNumber()) {
                        if (!v.matchStr(i).isEmpty()){
                            var extension: String = v.matchStr(i)
                            var numbers = StringBuilder(number.toString()[v.matchPosition().start..number.size])
                            return (extension, numbers)
                        }
                    }
                }
            case None => ()
        }
        return ("", number)
    }

    private func checkRegionForParsing(numberToParse: String, defaultRegion: String): Bool {
        if (!isValidRegionCode(defaultRegion)) {
            let opt: Option<MatchData> = PLUS_CHARS_PATTERN.matcher(numberToParse).matchStart()
                match (opt) {
                    case Some(v) =>
                        if ((numberToParse.size == 0) || !v.groupNumber() > 0) {
                            return false
                        }
                    case None => return false
                }
        }
        return true
    }

    public open func parse(numberToParse: String, defaultRegion: String): PhoneNumber {
        var phoneNumber: PhoneNumber = PhoneNumber()
        parse(numberToParse, defaultRegion, phoneNumber)
        return phoneNumber
    }

    public open func parse(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit {
        parseHelper(numberToParse, defaultRegion, false, true, phoneNumber)
    }

    public open func parseAndKeepRawInput(numberToParse: String, defaultRegion: String): PhoneNumber {
        var phoneNumber: PhoneNumber = PhoneNumber()
        parseAndKeepRawInput(numberToParse, defaultRegion, phoneNumber)
        return phoneNumber
    }

    public open func parseAndKeepRawInput(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit {
        parseHelper(numberToParse, defaultRegion, true, true, phoneNumber)
    }

    static func setItalianLeadingZerosForPhoneNumber(nationalNumber: String, phoneNumber: PhoneNumber): Unit {
        if (nationalNumber.size > 1 && Rune(nationalNumber[0]) == r'0') {
            phoneNumber.setItalianLeadingZeros(true)
            var numberOfLeadingZeros: Int64 = 1
            while (numberOfLeadingZeros < nationalNumber.size - 1 && Rune(nationalNumber[numberOfLeadingZeros]) == r'0') {
                numberOfLeadingZeros ++
            }

            if (numberOfLeadingZeros != 1) {
                phoneNumber.setNumberOfLeadingZeros(numberOfLeadingZeros)
            }
        }
    }

    public func findNumbers(text: String, defaultRegion: String): Iterable<PhoneNumberMatch> {
        var fni: FindNumbersImpl = FindNumbersImpl(text, defaultRegion, Valid(), 1000, this)
        return fni.findNumber()
    }

    private func parseHelper(numberToParse: String, defaultRegion: String, keepRawInput: Bool, checkRegion: Bool, 
        phoneNumber: PhoneNumber): Unit {
        if (numberToParse.isEmpty()) {
            throw NumberParseException(ErrorType.NOT_A_NUMBER, "The phone number supplied was null.")
        } else if (Int32(numberToParse.size) > MAX_INPUT_STRING_LENGTH) {
            throw NumberParseException(ErrorType.TOO_LONG, "The string supplied was too long to parse.")
        }
        var nationalNumber: StringBuilder = StringBuilder()
        buildNationalNumberForParsing(numberToParse, nationalNumber)
        if (!isViablePhoneNumber(nationalNumber.toString())) {
            throw NumberParseException(ErrorType.NOT_A_NUMBER,
                                     "The string supplied did not seem to be a phone number.")
        }

        if (checkRegion) {
            if (!checkRegionForParsing(nationalNumber.toString(), defaultRegion)) {
                throw NumberParseException(ErrorType.INVALID_COUNTRY_CODE,
                                        "Missing or invalid default region.")
            }
        }

        if (keepRawInput) {
            phoneNumber.setRawInputs(numberToParse)
        }
        let extension: (String, StringBuilder) = maybeStripExtension(nationalNumber)
        if (extension[0].size > 0) {
            phoneNumber.setExtensions(extension[0])
        }
        var nationalNumbers: StringBuilder = extension[1]
        var regionMetadata: ?PhonemetadataPhoneMetadata = getMetadataForRegion(defaultRegion)
        var normalizedNationalNumber: StringBuilder = StringBuilder()
        var countryCode: Int32 = 0
        try {
            countryCode = maybeExtractCountryCode(nationalNumbers.toString(), regionMetadata, normalizedNationalNumber, keepRawInput, phoneNumber)
        } catch (e: NumberParseException) {
            var matcher: Matcher = PLUS_CHARS_PATTERN.matcher(nationalNumbers.toString())
            let opt: Option<MatchData> = matcher.find()
            match (opt) {
                case Some(v) =>
                    if (e.getErrorType() == ErrorType.INVALID_COUNTRY_CODE && v.groupNumber() > 0) {
                        countryCode = maybeExtractCountryCode(nationalNumbers.toString()[matcher.region().end..],
                                                                regionMetadata, normalizedNationalNumber,
                                                                keepRawInput, phoneNumber)
                        if (countryCode == 0) {
                            throw NumberParseException(ErrorType.INVALID_COUNTRY_CODE, "Could not interpret numbers after plus-sign.")
                        }
                    } else {
                        throw NumberParseException(e.getErrorType(), "error methods")
                    }
                case None => ()
            }

        }
        if (countryCode != 0) {
            var phoneNumberRegion: String = getRegionCodeForCountryCode(countryCode)
            if (phoneNumberRegion != (defaultRegion)) {
                regionMetadata = getMetadataForRegionOrCallingCode(countryCode, phoneNumberRegion)
            }
        } else {
            normalizedNationalNumber.append(normalize(nationalNumbers))
            if (!defaultRegion.isEmpty()) {
                countryCode = regionMetadata.getOrThrow().getCountryCode()
                phoneNumber.setCountryCodes(Int64(countryCode))
            } else if (keepRawInput) {
                phoneNumber.clearCountryCodeSources()
            }
        }

        if (normalizedNationalNumber.toString().size < MIN_LENGTH_FOR_NSN) {
            throw NumberParseException(ErrorType.TOO_SHORT_NSN,
                                     "The string supplied is too short to be a phone number.")
        }

        if (let Some(i) <- regionMetadata) {
            i.getCountryCode()
            var carrierCode: StringBuilder = StringBuilder()
            var potentialNationalNumber: StringBuilder = StringBuilder(normalizedNationalNumber.toString())
            maybeStripNationalPrefixAndCarrierCode(potentialNationalNumber, regionMetadata.getOrThrow(), carrierCode)
            var validationResult: ValidationResult = testNumberLength(potentialNationalNumber.toString(), regionMetadata.getOrThrow())
            if (validationResult != ValidationResult.TOO_SHORT && validationResult != ValidationResult.IS_POSSIBLE_LOCAL_ONLY &&
                                                                  validationResult != ValidationResult.INVALID_LENGTH)
            {
                normalizedNationalNumber = potentialNationalNumber
                if (keepRawInput && carrierCode.toString().size > 0) {
                    phoneNumber.setPreferredDomesticCarrierCodes(carrierCode.toString())
                }
            }
        }
        var lengthOfNationalNumber: Int64 = normalizedNationalNumber.toString().size
        if (lengthOfNationalNumber < MIN_LENGTH_FOR_NSN) {
            throw NumberParseException(ErrorType.TOO_SHORT_NSN,
                                     "The string supplied is too short to be a phone number.")
        }

        if (lengthOfNationalNumber > Int64(MAX_LENGTH_FOR_NSN)) {
            throw NumberParseException(ErrorType.TOO_LONG,
                                     "The string supplied is too long to be a phone number.")
        }
        setItalianLeadingZerosForPhoneNumber(normalizedNationalNumber.toString(), phoneNumber)
        phoneNumber.setNationalNumbers(Int64.parse(normalizedNationalNumber.toString()))
    }

    private static func copyCoreFieldsOnly(phoneNumberIn: PhoneNumber): PhoneNumber {
        var phoneNumber: PhoneNumber = PhoneNumber()
        phoneNumber.setCountryCodes(phoneNumberIn.getCountryCodes())
        phoneNumber.setNationalNumbers(phoneNumberIn.getNationalNumbers())
        if (phoneNumberIn.getExtensions().size > 0) {
            phoneNumber.setExtensions(phoneNumberIn.getExtensions())
        }
        if (phoneNumberIn.isItalianLeadingZeros()) {
            phoneNumber.setItalianLeadingZeros(true)
            phoneNumber.setNumberOfLeadingZeros(phoneNumberIn.getNumbersOfLeadingZeros())
        }
        return phoneNumber
    }

    private func isNationalNumberSuffixOfTheOther(firstNumber: PhoneNumber, secondNumber: PhoneNumber ): Bool {
        var firstNumberNationalNumber: String = "${firstNumber.getNationalNumbers()}"
        var secondNumberNationalNumber: String = "${secondNumber.getNationalNumbers()}"
        return firstNumberNationalNumber.endsWith(secondNumberNationalNumber) ||
               secondNumberNationalNumber.endsWith(firstNumberNationalNumber)
    }

    protected func isNumberMatch(firstNumberIn: PhoneNumber, secondNumberIn: PhoneNumber): MatchType {

        let firstNumber: PhoneNumber = copyCoreFieldsOnly(firstNumberIn)
        let secondNumber: PhoneNumber = copyCoreFieldsOnly(secondNumberIn)

        if (firstNumber.hasExtensions() && secondNumber.hasExtensions() && 
            firstNumber.getExtensions() != (secondNumber.getExtensions())) {
            return MatchType.NO_MATCH
        }

        let firstNumberCountryCode: Int64 = firstNumber.getCountryCodes()
        let secondNumberCountryCode: Int64 = secondNumber.getCountryCodes()

        if (firstNumberCountryCode != 0 && secondNumberCountryCode != 0) {
            if (firstNumber.exactlySameAs(secondNumber)) {
                return MatchType.EXACT_MATCH
            } else if (firstNumberCountryCode == secondNumberCountryCode &&
                isNationalNumberSuffixOfTheOther(firstNumber, secondNumber)) {
                return MatchType.SHORT_NSN_MATCH
        }
            return MatchType.NO_MATCH
        }
        firstNumber.setCountryCodes(secondNumberCountryCode)

        if (firstNumber.exactlySameAs(secondNumber)) {
            return MatchType.NSN_MATCH
        }

        if (isNationalNumberSuffixOfTheOther(firstNumber, secondNumber)) {
        return MatchType.SHORT_NSN_MATCH
        }

        return MatchType.NO_MATCH
    }

    protected func isNumberMatch(firstNumber: String, secondNumber: String): MatchType {
        try {
            var firstNumberAsProto: PhoneNumber = parse(firstNumber, UNKNOWN_REGION)
            return isNumberMatch(firstNumberAsProto, secondNumber)
        } catch (e: NumberParseException) {
            if (e.getErrorType() == ErrorType.INVALID_COUNTRY_CODE) {
                try {
                    var secondNumberAsProto: PhoneNumber = parse(secondNumber, UNKNOWN_REGION)
                return isNumberMatch(secondNumberAsProto, firstNumber)
            } catch (e2: NumberParseException) {
                if (e2.getErrorType() == ErrorType.INVALID_COUNTRY_CODE) {
                    try {
                        var firstNumberProto: PhoneNumber = PhoneNumber()
                        var secondNumberProto: PhoneNumber = PhoneNumber()
                        parseHelper(firstNumber, "", false, false, firstNumberProto)
                        parseHelper(secondNumber, "", false, false, secondNumberProto)
                        return isNumberMatch(firstNumberProto, secondNumberProto)
                    } catch (e3: NumberParseException) {
                        
                    }
                }
            }
            }
        }
        return MatchType.NOT_A_NUMBER
    }

    protected func isNumberMatch(firstNumber: PhoneNumber, secondNumber: String): MatchType {
        try {
            var secondNumberAsProto: PhoneNumber = parse(secondNumber, UNKNOWN_REGION)
            return isNumberMatch(firstNumber, secondNumberAsProto)
            } catch (e: NumberParseException) {
                if (e.getErrorType() == ErrorType.INVALID_COUNTRY_CODE) {
                    var firstNumberRegion: String = getRegionCodeForCountryCode(Int32(firstNumber.getCountryCodes()))
                    try {
                        if (firstNumberRegion != (UNKNOWN_REGION)) {
                        var secondNumberWithFirstNumberRegion: PhoneNumber = parse(secondNumber, firstNumberRegion)
                        var matching: MatchType = isNumberMatch(firstNumber, secondNumberWithFirstNumberRegion)
                        if (matching == MatchType.EXACT_MATCH) {
                            return MatchType.NSN_MATCH
                        }
                        return matching
                        } else {
                            var secondNumberProto: PhoneNumber = PhoneNumber()
                            parseHelper(secondNumber, "", false, false, secondNumberProto)
                            return isNumberMatch(firstNumber, secondNumberProto)
                        }
                    } catch (e2: NumberParseException) {

                    }
                }
            }
        return MatchType.NOT_A_NUMBER
    }

    public func buildNationalNumberForParsing(numberToParse: String, nationalNumber: StringBuilder): Unit {
        var indexOfPhoneContext: Int32
        match (numberToParse.indexOf(RFC3966_PHONE_CONTEXT)) {
            case Some(x) => indexOfPhoneContext = Int32(x)
            case None => indexOfPhoneContext = -1
        }
        if (indexOfPhoneContext >= 0 ) {
            var phoneContextStart: Int32 = indexOfPhoneContext + Int32(RFC3966_PHONE_CONTEXT.size)
            var phoneContextEnd: Int64
            if (phoneContextStart < (Int32(numberToParse.size) - 1) && Rune(numberToParse[Int64(phoneContextStart)]) == PLUS_SIGN) {
                match (numberToParse.indexOf(";", Int64(phoneContextStart))){
                    case Some(x) => phoneContextEnd = x
                    case None => phoneContextEnd = -1
                }
                if (phoneContextEnd > 0) {
                    nationalNumber.append(numberToParse[(Int64(phoneContextStart)..phoneContextEnd)])
                } else {
                    nationalNumber.append(numberToParse[Int64(phoneContextStart)..])
                }
            }
            var indexOfRfc3966Prefix: Int32
            match (numberToParse.indexOf(RFC3966_PREFIX)) {
                case Some(x) => indexOfRfc3966Prefix = Int32(x)
                case None => indexOfRfc3966Prefix = -1
            }
            var indexOfNationalNumber: Int32
            if (indexOfRfc3966Prefix >= 0) {
                indexOfNationalNumber = indexOfRfc3966Prefix + Int32(RFC3966_PREFIX.size)
            } else {
                indexOfNationalNumber = 0
            }
            nationalNumber.append(numberToParse[(Int64(indexOfNationalNumber)..Int64(indexOfPhoneContext))])
        } else {
            nationalNumber.append(extractPossibleNumber(numberToParse))
        }
        var indexOfIsdn: Int64
        match (nationalNumber.toString().indexOf(RFC3966_ISDN_SUBADDRESS)){
            case Some(x) => indexOfIsdn = x
            case None => indexOfIsdn = -1
        }
        if (indexOfIsdn > 0) {
            let s: String = nationalNumber.toString()[..indexOfIsdn] + nationalNumber.toString()[nationalNumber.size..]
            nationalNumber.reset()
            nationalNumber.append(s)
        }
    }

    public open func canBeInternationallyDialled(number: PhoneNumber): Bool {
        var regionCode: Option<String> = getRegionCodeForNumber(number)
        if (regionCode == Option<String>.None) {
          return true
        }
        var metadata: PhonemetadataPhoneMetadata = getMetadataForRegion(getRegionCodeForNumber(number).getOrThrow())
        var nationalSignificantNumber: String = getNationalSignificantNumber(number)
        if (metadata.getNoInternationalDialling() == Option<PhonemetadataPhoneNumberDesc>.None) {
          return true
        }
        return !isNumberMatchingDesc(nationalSignificantNumber, metadata.getNoInternationalDialling().getOrThrow())
    }

    public static func matchCountryCodeSource(countryCodeSource: CountryCodeSource): String{
            match (countryCodeSource) {
                case FROM_NUMBER_WITH_PLUS_SIGN => return "FROM_NUMBER_WITH_PLUS_SIGN"
                case FROM_NUMBER_WITH_IDD => return "FROM_NUMBER_WITH_IDD"
                case FROM_NUMBER_WITHOUT_PLUS_SIGN => "FROM_NUMBER_WITHOUT_PLUS_SIGN"
                case FROM_DEFAULT_COUNTRY => "FROM_DEFAULT_COUNTRY"
                case UNSPECIFIED => "UNSPECIFIED"
            }
    }

    public func getAsYouTypeFormatter(regionCode: String): AsYouTypeFormatter {
        return AsYouTypeFormatter(regionCode)
    }

    public func getExampleNumber (regionCode: String): Option<PhoneNumber> {
        return getExampleNumberForType(regionCode, PhoneNumberType.FIXED_LINE)
    }

    public func getExampleNumberForType (regionCode: String, PhoneNumberType: PhoneNumberType): Option<PhoneNumber> {
        if (!isValidRegionCode(regionCode)) {
            logger.log(LogLevel.WARN, "Invalid or unknown region code provided: " + regionCode)
            return Option<PhoneNumber>.None
        }
        var desc: PhonemetadataPhoneNumberDesc = getNumberDescByType(getMetadataForRegion(regionCode), PhoneNumberType)
        try {
            if (desc.hasExampleNumberFunc()) {
                return parse(desc.getExampleNumber(), regionCode)
            }
        } catch (e: NumberParseException) {
            logger.log(LogLevel.ERROR, e.toString())
        }
        return Option<PhoneNumber>.None
    }

    public func isMobileNumberPortableRegion(regionCode: String): Bool {
        let metadata: PhonemetadataPhoneMetadata = getMetadataForRegion(regionCode)
        return metadata.getMobileNumberPortableRegion()
    }

}

public enum PhoneNumberFormat {
    | E164
    | INTERNATIONAL
    | NATIONAL
    | RFC3966

    public operator func == (that: PhoneNumberFormat): Bool {
        match ((this, that)) {
            case (E164, E164) => true
            case (INTERNATIONAL, INTERNATIONAL) => true
            case (NATIONAL, NATIONAL) => true
            case (RFC3966, RFC3966) => true
            case _ => false
        }
    }

    public operator func != (that: PhoneNumberFormat): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case E164                => "E164"
            case INTERNATIONAL          => "INTERNATIONAL"
            case NATIONAL               => "NATIONAL"
            case RFC3966   => "RFC3966"
        }
    }
}

public enum PhoneNumberType <: Hashable & Equatable<PhoneNumberType> {
    | FIXED_LINE
    | MOBILE
    | FIXED_LINE_OR_MOBILE
    | TOLL_FREE
    | PREMIUM_RATE
    | SHARED_COST
    | VOIP
    | PERSONAL_NUMBER
    | PAGER
    | UAN
    | VOICEMAIL
    | UNKNOWN

    public operator func ==(that: PhoneNumberType): Bool {
        match ((this, that)) {
            case (FIXED_LINE, FIXED_LINE) => true
            case (MOBILE, MOBILE) => true
            case (FIXED_LINE_OR_MOBILE, FIXED_LINE_OR_MOBILE) => true
            case (TOLL_FREE, TOLL_FREE) => true
            case (PREMIUM_RATE, PREMIUM_RATE) => true
            case (SHARED_COST, SHARED_COST) => true
            case (VOIP, VOIP) => true
            case (PERSONAL_NUMBER, PERSONAL_NUMBER) => true
            case (PAGER, PAGER) => true
            case (UAN, UAN) => true
            case (VOICEMAIL, VOICEMAIL) => true
            case (UNKNOWN, UNKNOWN) => true
            case _ => false
        }
    }

    public operator func !=(that: PhoneNumberType): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case FIXED_LINE => "FIXED_LINE"
            case MOBILE => "MOBILE"
            case FIXED_LINE_OR_MOBILE => "FIXED_LINE_OR_MOBILE"
            case TOLL_FREE => "TOLL_FREE"
            case PREMIUM_RATE => "PREMIUM_RATE"
            case SHARED_COST => "SHARED_COST"
            case VOIP => "VOIP"
            case PERSONAL_NUMBER => "PERSONAL_NUMBER"
            case PAGER => "PAGER"
            case UAN => "UAN"
            case VOICEMAIL => "VOICEMAIL"
            case UNKNOWN => "UNKNOWN"
        }
    }

    public func hashCode(): Int64 {
        match (this) {
            case FIXED_LINE => "FIXED_LINE".hashCode()
            case MOBILE => "MOBILE".hashCode()
            case FIXED_LINE_OR_MOBILE => "FIXED_LINE_OR_MOBILE".hashCode()
            case TOLL_FREE => "TOLL_FREE".hashCode()
            case PREMIUM_RATE => "PREMIUM_RATE".hashCode()
            case SHARED_COST => "SHARED_COST".hashCode()
            case VOIP => "VOIP".hashCode()
            case PERSONAL_NUMBER => "PERSONAL_NUMBER".hashCode()
            case PAGER => "PAGER".hashCode()
            case UAN => "UAN".hashCode()
            case VOICEMAIL => "VOICEMAIL".hashCode()
            case UNKNOWN => "UNKNOWN".hashCode()
        }
    }
}

public enum MatchType {
    | NOT_A_NUMBER
    | NO_MATCH
    | SHORT_NSN_MATCH
    | NSN_MATCH
    | EXACT_MATCH

    public operator func == (that: MatchType): Bool {
        match ((this, that)) {
            case (NOT_A_NUMBER, NOT_A_NUMBER) => true
            case (NO_MATCH, NO_MATCH) => true
            case (SHORT_NSN_MATCH, SHORT_NSN_MATCH) => true
            case (NSN_MATCH, NSN_MATCH) => true
            case (EXACT_MATCH, EXACT_MATCH) => true
            case _ => false
        }
    }

    public operator func != (that: MatchType): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case NOT_A_NUMBER => "NOT_A_NUMBER"
            case NO_MATCH => "NO_MATCH"
            case SHORT_NSN_MATCH => "SHORT_NSN_MATCH"
            case NSN_MATCH => "NSN_MATCH"
            case EXACT_MATCH => "EXACT_MATCH"
        }
    }
}

public enum ValidationResult {
    | IS_POSSIBLE
    | IS_POSSIBLE_LOCAL_ONLY
    | INVALID_COUNTRY_CODE
    | TOO_SHORT
    | INVALID_LENGTH
    | TOO_LONG

    public operator func == (that: ValidationResult): Bool {
        match ((this, that)) {
            case (IS_POSSIBLE, IS_POSSIBLE) => true
            case (IS_POSSIBLE_LOCAL_ONLY, IS_POSSIBLE_LOCAL_ONLY) => true
            case (INVALID_COUNTRY_CODE, INVALID_COUNTRY_CODE) => true
            case (TOO_SHORT, TOO_SHORT) => true
            case (INVALID_LENGTH, INVALID_LENGTH) => true
            case (TOO_LONG, TOO_LONG) => true
            case _ => false
        }
    }

    public operator func != (that: ValidationResult): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case IS_POSSIBLE => "IS_POSSIBLE"
            case IS_POSSIBLE_LOCAL_ONLY => "IS_POSSIBLE_LOCAL_ONLY"
            case INVALID_COUNTRY_CODE => "INVALID_COUNTRY_CODE"
            case TOO_SHORT => "TOO_SHORT"
            case INVALID_LENGTH => "INVALID_LENGTH"
            case TOO_LONG => "TOO_LONG"
        }
    }
}

class FindNumbersImpl<: Iterable<PhoneNumberMatch> {

    private var text: String
    private var defaultRegion: String
    private var leniency: Leniency
    private var maxTries: Int64
    private var util: PhoneNumberUtil

    init(text: String, defaultRegion: String, leniency: Leniency, maxTries: Int64, util: PhoneNumberUtil) {
        this.text = text
        this.defaultRegion = defaultRegion
        this.leniency = leniency
        this.maxTries = maxTries
        this.util = util
    }

    func findNumber(): Iterator<PhoneNumberMatch> {
        return iterator()
    }

    public func iterator(): Iterator<PhoneNumberMatch> {
        return PhoneNumberMatcher(util, text, defaultRegion, leniency , maxTries)
    }
}

abstract class Leniency {
    protected func verify(number: PhoneNumber, candidate: String, util: PhoneNumberUtil): Bool
}

class Valid <: Leniency {

    protected func verify(number: PhoneNumber, candidate: String, util: PhoneNumberUtil): Bool {

        if(!util.isValidNumber(number)) {
            return false
        }
        if(!PhoneNumberMatcher.containsOnlyValidXChars(number, candidate, util)) {
            return false
        }
        return PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util)
    }
}
