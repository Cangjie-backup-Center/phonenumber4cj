// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import std.regex.*

main() {
    var isRes = isViablePhoneNumbers("008a6-2cang5-955a66")
    return isRes
}

func isViablePhoneNumbers(number: String): Int64 {
    var data1: String = "\\d+{2}/|[+＋]*+(?:[-x‐-―−ー－-／  \u{00AD}\u{200B}\u{2060}　()（）［］.\\[\\]/~⁓∼～*]*\\d+){3,}[-x‐-―−ー－-／  \u{00AD}\u{200B}\u{2060}　()（）［］.\\[\\]/~⁓∼～*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\\d+]*(?:;ext=(\\d+{1,20})/|[  \\t,]*(?:e?xt(?:ensi(?:ó?/|ó))?n?/|ｅ?ｘｔｎ?/|доб/|anexo)[:\\.．]?[  \\t,-]*(\\d+{1,20})#?/|[  \\t,]*(?:[xｘ#＃~～]/|int/|ｉｎｔ)[:\\.．]?[  \\t,-]*(\\d+{1,9})#?/|[- ]+(\\d+{1,6})#/|[  \\t]*(?:,{2}/|;)[:\\.．]?[  \\t,-]*(\\d+{1,15})#?/|[  \\t]*(?:,)+[:\\.．]?[  \\t,-]*(\\d+{1,9})#?)?"
    var data2: String = "\\d+{2}"
    var data3: String = "[+＋]*+(?:[-x‐-―−ー－-／  \u{00AD}\u{200B}\u{2060}　()（）［］.\\[\\]/~⁓∼～*]*\\d+){3,}[-x‐-―−ー－-／  \u{00AD}\u{200B}\u{2060}　()（）［］.\\[\\]/~⁓∼～*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\\d+]*(?:;ext=(\\d+{1,20})/|[  \\t,]*(?:e?xt(?:ensi(?:ó?/|ó))?n?/|ｅ?ｘｔｎ?/|доб/|anexo)[:\\.．]?[  \\t,-]*(\\d+{1,20})#?/|[  \\t,]*(?:[xｘ#＃~～]/|int/|ｉｎｔ)[:\\.．]?[  \\t,-]*(\\d+{1,9})#?/|[- ]+(\\d+{1,6})#/|[  \\t]*(?:,{2}/|;)[:\\.．]?[  \\t,-]*(\\d+{1,15})#?/|[  \\t]*(?:,)+[:\\.．]?[  \\t,-]*(\\d+{1,9})#?)?"
    var data4: String = ".*"
    var data5: String = "\\d+{2}"
    var data6: String = "\\d+{2}/|.*"
    var VALID_PHONE_NUMBER_PATTERN1 = Regex(data1)
    let m1: Matcher = VALID_PHONE_NUMBER_PATTERN1.matcher(number)
    if (findRes(m1.fullMatch()) != true){
        return 1
    }
    var VALID_PHONE_NUMBER_PATTERN2 = Regex(data2)
    let m2: Matcher = VALID_PHONE_NUMBER_PATTERN2.matcher(number)
    if (findRes(m2.fullMatch()) != false){
        return 1
    }
    var VALID_PHONE_NUMBER_PATTERN3 = Regex(data3)
    let m3: Matcher = VALID_PHONE_NUMBER_PATTERN3.matcher(number)
    if (findRes(m3.fullMatch()) != true){
        return 1
    }
    var VALID_PHONE_NUMBER_PATTERN4 = Regex(data4)
    let m4: Matcher = VALID_PHONE_NUMBER_PATTERN4.matcher(number)
    if (findRes(m4.fullMatch()) != true){
        return 1
    }
    var VALID_PHONE_NUMBER_PATTERN5 = Regex(data5)
    let m5: Matcher = VALID_PHONE_NUMBER_PATTERN5.matcher(number)
    if (findRes(m5.fullMatch()) != false){
        return 1
    }
    var VALID_PHONE_NUMBER_PATTERN6 = Regex(data6)
    let m6: Matcher = VALID_PHONE_NUMBER_PATTERN6.matcher(number)
    if (findRes(m6.fullMatch()) != true){
        return 1
    }
    return 0
}

func findRes(matchData: Option<MatchData>): Bool {
    if (let None <- matchData) {
        return false
    }
    return true
}
