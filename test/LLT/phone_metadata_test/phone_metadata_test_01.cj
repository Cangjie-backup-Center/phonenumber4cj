// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*

main() {
    var format: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    format.addLeadingDigitsPattern(Option<String>.Some("123"))
    format.addLeadingDigitsPattern(Option<String>.Some("456"))
    println("${format.getLeadingDigitsPattern(0)}")
    println("${format.getLeadingDigitsPattern(1)}")
    if (format.getLeadingDigitsPattern(0) != "123") {
        return 1
    }
    if (format.getLeadingDigitsPattern(1) != "456") {
        return 1
    }

    format.setNationalPrefixFormattingRule("{\\d}")
    if (format.hasNationalPrefixFormattingRuleFunc() != true) {
        return 1
    }
    format.clearNationalPrefixFormattingRule()
    if (format.hasNationalPrefixFormattingRuleFunc() != false) {
        return 1
    }
    format.setNationalPrefixFormattingRule("{\\d}")
    format.setDomesticCarrierCodeFormattingRule("{\\d}")
    format.setNationalPrefixOptionalWhenFormatting(true)

    var formatBuilder: NumberFormatBuilder = NumberFormatBuilder()
    var formatBuilder2: NumberFormatBuilder = formatBuilder.mergeFrom(format)
    println("${formatBuilder2.getNationalPrefixFormattingRule()}")
    println("${formatBuilder2.getDomesticCarrierCodeFormattingRule()}")
    println("${formatBuilder2.getNationalPrefixOptionalWhenFormatting()}")
    if (formatBuilder2.getNationalPrefixFormattingRule() != "{\\d}") {
        return 1
    }
    if (formatBuilder2.getDomesticCarrierCodeFormattingRule() != "{\\d}") {
        return 1
    }
    if (formatBuilder2.getNationalPrefixOptionalWhenFormatting() != true) {
        return 1
    }
    0
}
