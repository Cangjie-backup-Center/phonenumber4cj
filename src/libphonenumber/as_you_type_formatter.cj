/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber

from std import math.*

public class AsYouTypeFormatter {

    private var currentOutput: String = ""
    private var formattingTemplate: StringBuilder = StringBuilder()
    private var currentFormattingPattern: String = ""
    private var accruedInput: StringBuilder = StringBuilder()
    private var accruedInputWithoutFormatting: StringBuilder = StringBuilder()
    private var ableToFormat: Bool = true
    private var inputHasFormatting: Bool = false
    private var isCompleteNumber: Bool = false
    private var isExpectingCountryCallingCode: Bool = false
    private let phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    private var defaultCountry: String = ""
    private static let SEPARATOR_BEFORE_NATIONAL_NUMBER: Char = ' '
    private static let EMPTY_METADATA: PhonemetadataPhoneMetadata = PhonemetadataPhoneMetadata.newBuilder().setId("<ignored>").setInternationalPrefix("NA").build()
    private var defaultMetadata: PhonemetadataPhoneMetadata = PhonemetadataPhoneMetadata()
    private var currentMetadata: PhonemetadataPhoneMetadata = PhonemetadataPhoneMetadata()
    private static let ELIGIBLE_FORMAT_PATTERN: Regex = Regex("[" + PhoneNumberUtil.VALID_PUNCTUATION +  "]*" + "\\$1" + "[" + PhoneNumberUtil.VALID_PUNCTUATION + "]*(\\$\\d" + PhoneNumberUtil.VALID_PUNCTUATION + ")*")
    private static let NATIONAL_PREFIX_SEPARATORS_PATTERN: Regex = Regex("[- ]")
    private static let MIN_LEADING_DIGITS_LENGTH: Int32 = 3
    private static let DIGIT_PLACEHOLDER: String = "\\s"
    private static let DIGIT_PATTERN: Regex = Regex("[" + DIGIT_PLACEHOLDER + "]")
    private var lastMatchPosition: Int32 = 0
    private var originalPosition: Int32 = 0
    private var positionToRemember: Int32 = 0
    private var prefixBeforeNationalNumber: StringBuilder = StringBuilder()
    private var shouldAddSpaceAfterNationalPrefix: Bool = false
    private var extractedNationalPrefix: String = ""
    private var nationalNumber: StringBuilder = StringBuilder()
    private var possibleFormats: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    private var regexCache: RegexCache = RegexCache()

    public init (regionCode: String){
        this.defaultCountry = regionCode
        this.currentMetadata = getMetadataForRegion(defaultCountry)
        this.defaultMetadata = currentMetadata
    }

    private func getMetadataForRegion (regionCode: String): PhonemetadataPhoneMetadata {
        var countryCallingCode: Int32 = phoneUtil.getCountryCodeForRegion(regionCode)
        var mainCountry: String = phoneUtil.getRegionCodeForCountryCode(countryCallingCode)
        var metadata: PhonemetadataPhoneMetadata = phoneUtil.getMetadataForRegion(mainCountry)
        if (metadata != PhonemetadataPhoneMetadata()) {
            return metadata
        }
        return EMPTY_METADATA
    }

    private func maybeCreateNewTemplate (): Bool {
        var removeList: ArrayList<Int64> = ArrayList<Int64>()
        var possibleFormatsList: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
        var removeNum = 0
        var IsCreateFormattingTemplate = false
        var it: Iterator<PhonemetadataNumberFormat> = possibleFormats.iterator()
        while (true) {
            match (it.next()) {
                case Some(it) =>
                    var numberFormat: PhonemetadataNumberFormat = it
                    var pattern: String = numberFormat.getPattern()
                    if (currentFormattingPattern == pattern) {
                        return false
                    }
                    if (createFormattingTemplate(numberFormat)) {
                        currentFormattingPattern = pattern
                        shouldAddSpaceAfterNationalPrefix = findRes(NATIONAL_PREFIX_SEPARATORS_PATTERN.matcher(numberFormat.getNationalPrefixFormattingRule()).find())
                        lastMatchPosition = 0
                        IsCreateFormattingTemplate = true
                        break
                    } else {
                        removeList.append(removeNum)
                    }
                    removeNum++
                case None => break
            }
        }
        if (IsCreateFormattingTemplate) {
            for (index in 0..possibleFormats.size) {
                if (!(removeList.contains(index))) {
                    possibleFormatsList.append(possibleFormats[index])
                }
            }
            possibleFormats = possibleFormatsList
            return true
        }
        ableToFormat = false
        return false
    }

    private func findRes(matchData: Option<MatchData>): Bool {
        if (let None <- matchData) {
            return false
        }
        return true
    }

    private func getAvailableFormats (leadingDigits: String): Unit {
        var isInternationalNumber: Bool = isCompleteNumber && extractedNationalPrefix.size == 0
        var formatList: ArrayList<PhonemetadataNumberFormat>
        if ((isInternationalNumber && currentMetadata.getIntlNumberFormatCount() > 0)) {
            formatList = currentMetadata.getIntlNumberFormatList()
        }else {
            formatList = currentMetadata.getNumberFormatList()
        }
        var times = 0
        for (format in formatList) {
            if (extractedNationalPrefix.size > 0) {
                if (PhoneNumberUtil.formattingRuleHasFirstGroupOnly(format.getNationalPrefixFormattingRule())) {
                    if (!format.getNationalPrefixOptionalWhenFormatting()) {
                        if (!format.hasDomesticCarrierCodeFormattingRuleFunc()) {
                            times++
                            continue
                        }
                    }
                }
            } else if (extractedNationalPrefix.size == 0) {
                if (!isCompleteNumber) {
                    if (!PhoneNumberUtil.formattingRuleHasFirstGroupOnly(format.getNationalPrefixFormattingRule())) {
                        if (!format.getNationalPrefixOptionalWhenFormatting()) {
                            times++
                            continue
                        }
                    }
                }
            }
            if (findRes(ELIGIBLE_FORMAT_PATTERN.matcher(format.getFormat()).find())) {
                possibleFormats.append(format)
            }
            times++
        }
        narrowDownPossibleFormats(leadingDigits)
    }

    private func narrowDownPossibleFormats (leadingDigits: String): Unit {
        var removeList: ArrayList<Int64> = ArrayList<Int64>()
        var possibleFormatsList: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
        var removeNum = 0
        var indexOfLeadingDigitsPattern: Int32 = Int32(leadingDigits.size) - MIN_LEADING_DIGITS_LENGTH
        var it: Iterator<PhonemetadataNumberFormat> = possibleFormats.iterator()
        while (true) {
            match (it.next()) {
                case Some(it) =>
                    var format: PhonemetadataNumberFormat = it
                    if (format.getLeadingDigitsPatternCount() == 0) {
                        removeNum++
                        continue
                    }
                    var lastLeadingDigitsPattern: Int32 = math.min(indexOfLeadingDigitsPattern, format.getLeadingDigitsPatternCount() - 1)
                    var leadingDigitsPattern: Regex = regexCache.getPatternForRegex(format.getLeadingDigitsPattern(lastLeadingDigitsPattern).getOrThrow())
                    var m: Matcher = leadingDigitsPattern.matcher(leadingDigits)
                    if (!findRes(m.matchStart())) {
                        removeList.append(removeNum)
                    }
                    removeNum++
                case None => break
            }
        }
        for (index in 0..possibleFormats.size) {
            if (!(removeList.contains(index))) {
                possibleFormatsList.append(possibleFormats[index])
            }
        }
        possibleFormats = possibleFormatsList
    }

    private func createFormattingTemplate (format: PhonemetadataNumberFormat): Bool {
        var numberPattern: String = format.getPattern()
        formattingTemplate = StringBuilder(Char(0),0)
        var tempTemplate: String = getFormattingTemplate(numberPattern, format.getFormat())
        if (tempTemplate.size > 0) {
            formattingTemplate.append(tempTemplate)
            return true
        }
        return false
    }

    private func getFormattingTemplate (numberPattern: String, numberFormat: String): String {
        var longestPhoneNumber: String = "999999999999999"
        var m: Matcher = regexCache.getPatternForRegex(numberPattern).matcher(longestPhoneNumber)
        match (m.find()) {
            case Some(m) =>
                var aPhoneNumber: String = m.matchStr()
                if (aPhoneNumber.size < nationalNumber.size) {
                  return ""
                }
                var m2: Matcher = regexCache.getPatternForRegex(numberPattern).matcher(aPhoneNumber)
                var template: String = replaceFormat(m2, numberFormat)
                template = template.replace("9", DIGIT_PLACEHOLDER)
                return template
            case None => return ""
        }
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

    public func clear (): Unit {
        currentOutput = ""
        accruedInput = StringBuilder(Char(0), 0)
        accruedInputWithoutFormatting = StringBuilder(Char(0), 0)
        formattingTemplate = StringBuilder(Char(0), 0)
        lastMatchPosition = 0
        currentFormattingPattern = ""
        prefixBeforeNationalNumber = StringBuilder(Char(0), 0)
        extractedNationalPrefix = ""
        ableToFormat = true
        nationalNumber = StringBuilder(Char(0), 0)
        positionToRemember = 0
        isCompleteNumber = false
        possibleFormats.clear()
        isExpectingCountryCallingCode = false
        inputHasFormatting = false
        shouldAddSpaceAfterNationalPrefix = false
        originalPosition = 0
        if (!(currentMetadata == defaultMetadata)) {
          currentMetadata = getMetadataForRegion(defaultCountry)
        }
    }

    public func inputDigit (nextChar: Char): String {
        currentOutput = inputDigitWithOptionToRememberPosition(nextChar, false)
        return currentOutput
    }

    public func inputDigitAndRememberPosition (nextChar: Char): String {
        currentOutput = inputDigitWithOptionToRememberPosition(nextChar, true)
        return currentOutput
    }

    private func extractAccruedInput(rememberPosition: Bool, accruedInput: StringBuilder) {
        if (rememberPosition) {
            originalPosition = Int32(accruedInput.size)
        }
    }

    private func inputDigitWithOptionToRememberPosition (nextChars: Char, rememberPosition: Bool): String {
        var nextChar: Char = nextChars
        accruedInput.append(nextChar)
        extractAccruedInput(rememberPosition, accruedInput)
        if (!isDigitOrLeadingPlusSign(nextChar)) {
            ableToFormat = false
            inputHasFormatting = true
        } else {
            nextChar = normalizeAndAccrueDigitsAndPlusSign(nextChar, rememberPosition)
        }
        if (!ableToFormat) {
            if (inputHasFormatting) {
                return accruedInput.toString()
            } else if (attemptToExtractIdd()) {
                if (attemptToExtractCountryCallingCode()) {
                  return attemptToChoosePatternWithPrefixExtracted()
                }
            } else if (ableToExtractLongerNdd()) {
                prefixBeforeNationalNumber.append(SEPARATOR_BEFORE_NATIONAL_NUMBER)
                return attemptToChoosePatternWithPrefixExtracted()
            }
            return accruedInput.toString()
        }
        if (accruedInputWithoutFormatting.size == 2) {
            return accruedInput.toString()
        }
        if (accruedInputWithoutFormatting.size == 3) {
            if (attemptToExtractIdd()) {
                isExpectingCountryCallingCode = true
            } else {
                extractedNationalPrefix = removeNationalPrefixFromNationalNumber()
                return attemptToChooseFormattingPattern()
            }
        }
        if (isExpectingCountryCallingCode) {
            if (attemptToExtractCountryCallingCode()) {
                isExpectingCountryCallingCode = false
            }
            return prefixBeforeNationalNumber.toString() + nationalNumber.toString()
        }
        if (possibleFormats.size > 0) {
            var tempNationalNumber: String = inputDigitHelper(nextChar)
            var formattedNumber: String = attemptToFormatAccruedDigits()
            if (formattedNumber.size > 0) {
                return formattedNumber
            }
            narrowDownPossibleFormats(nationalNumber.toString())
            if (maybeCreateNewTemplate()) {
                return inputAccruedNationalNumber()
            }
            if (ableToFormat) {
                return appendNationalNumber(tempNationalNumber)
            } else {
                return accruedInput.toString()
            }
        } else {
            return attemptToChooseFormattingPattern()
        }
    }

    private func attemptToChoosePatternWithPrefixExtracted (): String {
        ableToFormat = true
        isExpectingCountryCallingCode = false
        possibleFormats.clear()
        lastMatchPosition = 0
        formattingTemplate = StringBuilder(Char(0), 0)
        currentFormattingPattern = ""
        return attemptToChooseFormattingPattern()
    }

    private func ableToExtractLongerNdd (): Bool {
        if (extractedNationalPrefix.size > 0) {
          let opt = extractedNationalPrefix + nationalNumber.toString()
          nationalNumber = StringBuilder(opt)
          var indexOfPreviousNdd: Int64 = match (prefixBeforeNationalNumber.toString().lastIndexOf(extractedNationalPrefix)) {
              case Some(x) => x
              case None => -1
          }
          prefixBeforeNationalNumber = StringBuilder(Char(0), indexOfPreviousNdd)
        }
        return extractedNationalPrefix != removeNationalPrefixFromNationalNumber()
    }

    private func isDigitOrLeadingPlusSign (nextChar: Char): Bool {
        return nextChar.isAsciiNumber() || (accruedInput.size == 1 && matchRes(PhoneNumberUtil.PLUS_CHARS_PATTERN.matcher(nextChar.toString()).fullMatch()))
    }

    private func matchRes(matchData: Option<MatchData>): Bool {
        if (let None <- matchData) {
            return false
        }
        return true
    }

    func attemptToFormatAccruedDigits (): String {
        for (numberFormat in possibleFormats) {
            var m: Matcher = regexCache.getPatternForRegex(numberFormat.getPattern()).matcher(nationalNumber.toString())
            if (matchRes(m.fullMatch())) {
                shouldAddSpaceAfterNationalPrefix = matchRes(NATIONAL_PREFIX_SEPARATORS_PATTERN.matcher(numberFormat.getNationalPrefixFormattingRule()).find())
                var formattedNumber: String = m.replaceAll(numberFormat.getFormat())
                var fullOutput: String = appendNationalNumber(formattedNumber)
                var formattedNumberDigitsOnly: String = PhoneNumberUtil.normalizeDiallableCharsOnly(fullOutput)
                if (formattedNumberDigitsOnly == accruedInputWithoutFormatting.toString()) {
                  return fullOutput
                }
            }
        }
        return ""
    }

    public func getRememberedPosition (): Int32 {
        if (!ableToFormat) {
            return originalPosition
        }
        var accruedInputIndex: Int32 = 0
        var currentOutputIndex: Int32 = 0
        while ( accruedInputIndex < positionToRemember && currentOutputIndex < Int32(currentOutput.size) ) {
            if (accruedInputWithoutFormatting.toString()[Int64(accruedInputIndex)] == currentOutput[Int64(currentOutputIndex)]) {
                accruedInputIndex++
            }
            currentOutputIndex++
        }
        return currentOutputIndex
    }

    private func appendNationalNumber (nationalNumber: String): String {
        var prefixBeforeNationalNumberLength: Int64 = prefixBeforeNationalNumber.size
        if (shouldAddSpaceAfterNationalPrefix && prefixBeforeNationalNumberLength > 0 && Char(prefixBeforeNationalNumber.toString()[prefixBeforeNationalNumberLength - 1]) != SEPARATOR_BEFORE_NATIONAL_NUMBER) {
          return prefixBeforeNationalNumber.toString() + SEPARATOR_BEFORE_NATIONAL_NUMBER.toString() + nationalNumber.toString()
        } else {
            return prefixBeforeNationalNumber.toString() + nationalNumber.toString()
        }
    }

    private func attemptToChooseFormattingPattern (): String {
        if (nationalNumber.size >= Int64(MIN_LEADING_DIGITS_LENGTH)) {
            getAvailableFormats(nationalNumber.toString())
            var formattedNumber: String = attemptToFormatAccruedDigits()
            if (formattedNumber.size > 0) {
              return formattedNumber
            }
            if (maybeCreateNewTemplate()) {
                return inputAccruedNationalNumber()
            } else {
                return accruedInput.toString()
            }
        } else {
          return appendNationalNumber(nationalNumber.toString())
        }
    }

    private func inputAccruedNationalNumber (): String {
        var lengthOfNationalNumber: Int64 = nationalNumber.size
        if (lengthOfNationalNumber > 0) {
            var tempNationalNumber: String = ""
            for (i in 0..lengthOfNationalNumber) {
              tempNationalNumber = inputDigitHelper(Char(nationalNumber.toString()[i]))
            }
            if (ableToFormat) {
                return appendNationalNumber(tempNationalNumber)
            } else {
                return accruedInput.toString()
            }
        } else {
            return prefixBeforeNationalNumber.toString()
        }
    }

    private func isNanpaNumberWithNationalPrefix (): Bool {
        return (currentMetadata.getCountryCode() == 1) && (Char(nationalNumber.toString()[0]) == '1') &&
               (Char(nationalNumber.toString()[1]) != '0') && (Char(nationalNumber.toString()[1]) != '1')
    }

    private func removeNationalPrefixFromNationalNumber (): String {
        var startOfNationalNumber: Int64 = 0
        if (isNanpaNumberWithNationalPrefix()) {
            startOfNationalNumber = 1
            prefixBeforeNationalNumber.append('1')
            prefixBeforeNationalNumber.append(SEPARATOR_BEFORE_NATIONAL_NUMBER)
            isCompleteNumber = true
        } else if (currentMetadata.hasNationalPrefixForParsingFunc()) {
            var nationalPrefixForParsing: Regex = regexCache.getPatternForRegex(currentMetadata.getNationalPrefixForParsing())
            var m: Matcher = nationalPrefixForParsing.matcher(nationalNumber.toString())
            if (matchRes(m.matchStart()) && m.find().getOrThrow().matchPosition().end > 0) {
                isCompleteNumber = true
                startOfNationalNumber = m.find().getOrThrow().matchPosition().end
                prefixBeforeNationalNumber.append(nationalNumber.toString()[..startOfNationalNumber])
            }
        }
        var nationalPrefix: String = nationalNumber.toString()[..startOfNationalNumber]
        let s = nationalNumber.toString()[startOfNationalNumber..]
        nationalNumber.reset()
        nationalNumber.append(s)
        return nationalPrefix
    }

    private func attemptToExtractIdd (): Bool {
        var internationalPrefix: Regex = regexCache.getPatternForRegex("\\" + String(PhoneNumberUtil.PLUS_SIGN) + "|" + currentMetadata.getInternationalPrefix())
        var iddMatcher: Matcher = internationalPrefix.matcher(accruedInputWithoutFormatting.toString())
        var iddMatchStart: Option<MatchData> = iddMatcher.matchStart()
        if (matchRes(iddMatchStart)) {
            isCompleteNumber = true
            var startOfCountryCallingCode: Int64 = iddMatchStart.getOrThrow().matchPosition().end
            nationalNumber = StringBuilder(Char(0), 0)
            nationalNumber.append(accruedInputWithoutFormatting.toString()[startOfCountryCallingCode..])
            prefixBeforeNationalNumber = StringBuilder(Char(0), 0)
            prefixBeforeNationalNumber.append(accruedInputWithoutFormatting.toString()[..startOfCountryCallingCode])
            if (Char(accruedInputWithoutFormatting.toString()[0]) != PhoneNumberUtil.PLUS_SIGN) {
              prefixBeforeNationalNumber.append(SEPARATOR_BEFORE_NATIONAL_NUMBER)
            }
            return true
        }
        return false
    }

    private func attemptToExtractCountryCallingCode (): Bool {
        if (nationalNumber.size == 0) {
            return false
        }
        var numberWithoutCountryCallingCode: StringBuilder = StringBuilder()
        var countryCode: Int32 = phoneUtil.extractCountryCode(nationalNumber, numberWithoutCountryCallingCode)
        if (countryCode == 0) {
            return false
        }
        nationalNumber = StringBuilder(Char(0), 0)
        nationalNumber.append(numberWithoutCountryCallingCode)
        var newRegionCode: String = phoneUtil.getRegionCodeForCountryCode(countryCode)
        if (PhoneNumberUtil.REGION_CODE_FOR_NON_GEO_ENTITY == (newRegionCode)) {
            currentMetadata = phoneUtil.getMetadataForNonGeographicalRegion(countryCode)
        } else if (newRegionCode != (defaultCountry)) {
            currentMetadata = getMetadataForRegion(newRegionCode)
        }
        var countryCodeString: String = countryCode.toString()
        prefixBeforeNationalNumber.append(countryCodeString)
        prefixBeforeNationalNumber.append(SEPARATOR_BEFORE_NATIONAL_NUMBER)
        extractedNationalPrefix = ""
        return true
    }

    private func normalizeAndAccrueDigitsAndPlusSign (nextChar: Char, rememberPosition: Bool): Char {
        var normalizedChar: Char
        if (nextChar == PhoneNumberUtil.PLUS_SIGN) {
            normalizedChar = nextChar
            accruedInputWithoutFormatting.append(nextChar)
        } else {
            if (nextChar.isAsciiNumber()){
                normalizedChar = nextChar
            }else {
                normalizedChar = Char(0)
            }
            accruedInputWithoutFormatting.append(normalizedChar)
            nationalNumber.append(normalizedChar)
        }
        if (rememberPosition) {
            positionToRemember = Int32(accruedInputWithoutFormatting.size)
        }
        return normalizedChar
    }

    private func inputDigitHelper (nextChar: Char): String {
        var digitMatcher: Matcher = DIGIT_PATTERN.matcher(formattingTemplate.toString())
        var digiM: Option<MatchData> = digitMatcher.find(Int64(lastMatchPosition))
        if (matchRes(digiM)) {
            var tempTemplate: String = digitMatcher.replace(nextChar.toString(), 0)
            var formattingTemplateStr = formattingTemplate.toString().replace(formattingTemplate.toString()[..tempTemplate.size], tempTemplate)
            formattingTemplate = StringBuilder(formattingTemplateStr)
            lastMatchPosition = Int32(digiM.getOrThrow().matchPosition().start)
            return formattingTemplate.toString()[..Int64(lastMatchPosition) + 1]
        } else {
            if (possibleFormats.size == 1) {
                ableToFormat = false
            }
            currentFormattingPattern = ""
            return accruedInput.toString()
        }
    }
}


