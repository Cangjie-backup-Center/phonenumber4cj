// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format11: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "US", true)
    println("format11 ==> ${format11}")
    if (format11 != "+86 199 9182 2826") {
        return 1
    }
    var format12: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "US", false)
    println("format12 ==> ${format12}")
    if (format12 != "+8619991822826") {
        return 1
    }
    var format13: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "CN", true)
    println("format13 ==> ${format13}")
    if (format13 != "199 9182 2826") {
        return 1
    }
    var format14: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber, "CN", false)
    println("format14 ==> ${format14}")
    if (format14 != "19991822826") {
       return 1
    }

    //"+14255550100", "US"
    var phoneNumber4: PhoneNumber = PhoneNumber()
    phoneNumber4.setCountryCodes(1)
    phoneNumber4.setNationalNumbers(4255550100)
    var format15: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber4, "US", true)
    println("format15 ==> ${format15}")
    if (format15 != "+1 425-555-0100") {
        return 1
    }
    var format16: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber4, "US", false)
    println("format16 ==> ${format16}")
    if (format16 != "+14255550100") {
        return 1
    }
    var format17: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber4, "CN", true)
    println("format17 ==> ${format17}")
    if (format17 != "+1 425-555-0100") {
        return 1
    }
    var format18: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber4, "CN", false)
    println("format18 ==> ${format18}")
    if (format18 != "+14255550100") {
       return 1
    }

    //"010-68688866", "CN"
    var phoneNumber5: PhoneNumber = PhoneNumber()
    phoneNumber5.setCountryCodes(86)
    phoneNumber5.setNationalNumbers(1068688866)
    var format19: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber5, "US", true)
    println("format19 ==> ${format19}")
    if (format19 != "+86 10 6868 8866") {
        return 1
    }
    var format20: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber5, "US", false)
    println("format20 ==> ${format20}")
    if (format20 != "+861068688866") {
        return 1
    }
    var format21: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber5, "CN", true)
    println("format21 ==> ${format21}")
    if (format21 != "010 6868 8866") {
        return 1
    }
    var format22: String = phoneNumberUtil.formatNumberForMobileDialing(phoneNumber5, "CN", false)
    println("format22 ==> ${format22}")
    if (format22 != "01068688866") {
       return 1
    }

    var formattedNationalNumber: String = ""
    var m: Matcher = Regex("(\\d{2})(\\d{4})(\\d{4})").matcher("1068688866")
    var firstGroupMatcher: Matcher = Regex("(\\$\\d)").matcher("$1 $2 $3")
    formattedNationalNumber = replaceFormat(m, firstGroupMatcher.replace("0$1"))
    return 0
}

func replaceFormat(m: Matcher, numberFormatRule: String): String {
    var numberFormatRuleTmp = numberFormatRule
    var res: String = ""
    match (m.find()) {
        case Some(x) =>
            for (i in 1..x.groupNumber() + 1) {
                res = numberFormatRuleTmp.replace("$${i}", x.matchStr(i))
                numberFormatRuleTmp = res
            }
        case None => ()
    }
    return res
}
