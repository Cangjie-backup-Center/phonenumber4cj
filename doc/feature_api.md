## phonenumber 库

### 介绍
该库主要是一个解析、格式化和验证国际电话号码的通用 Java、C++ 和 JavaScript 库。它能够对电话号码进行解析、格式化、验证等操作，也能够快速查询电话号码及在文本中查找电话号码等功能，参考地址：https://github.com/google/libphonenumber

### 1 提供对中国及美国的电话号码进行解析功能

前置条件：需要提前将电话号码元数据准备完毕 
场景：
1.提供对中国及美国电话号码的解析功能
约束：数据范围局限于生成的电话号码元数据内
依赖：NA
性能： NA
可靠性： NA

#### 1.1 前置数据准备
将电话号码相关的元数据包含于 phonenumberUtil 类对象内

##### 1.1.1 主要接口

class PhoneNumberUtil

```cangjie
    /**
    * 获取 PhoneNumberUtil 实例，实例内含有元数据
    *
    * 返回值是 Option<PhoneNumberUtil> 类型，返回类对象
    */
    public static func getInstance(): Option<PhoneNumberUtil>
```

#### 1.2 电话号码解析
获取 phonenumberUtil 实例，调用parse解析电话号码

##### 1.2.1 主要接口

```cangjie
    /**
    * 解析电话号码
    *
    * 参数 numberToParse - 将要进行解析的电话号码
    * 参数 defaultRegion - 默认区域代码
    *
    * 返回值是 Option<PhoneNumberUtil> 类型
    */
    public open func parse(numberToParse: String, defaultRegion: String): PhoneNumber

    /**
    * 解析电话号码
    *
    * 参数 numberToParse - 将要进行解析的电话号码
    * 参数 defaultRegion - 默认区域代码
    * 参数 phoneNumber - Phonenumber 类对象
    *
    */
    public open func parse(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit
```

##### 1.2.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("tel:331-6005;phone-context=+1-3", "US")
    showPhoneNumber(phoneNumber)
    if (phoneNumber.hasExtensions()) {
        return 1
    }
    return 0
}

func showPhoneNumber(phoneNumber: PhoneNumber) {
    var hasCountryCode: Bool = phoneNumber.hasCountryCodes()
    var countryCode: Int64 = phoneNumber.getCountryCodes()
    println("hasCountryCode ==> ${hasCountryCode}")
    println("countryCode ==> ${countryCode}")

    var hasNationalNumber: Bool = phoneNumber.hasNationalNumbers()
    var nationalNumber: Int64 = phoneNumber.getNationalNumbers()
    println("hasNationalNumber ==> ${hasNationalNumber}")
    println("nationalNumber ==> ${nationalNumber}")

    var hasExtension: Bool = phoneNumber.hasExtensions()
    var extension: String = phoneNumber.getExtensions()
    println("hasExtension ==> ${hasExtension}")
    println("extension ==> ${extension}")


    var hasItalianLeadingZero: Bool = phoneNumber.hasItalianLeadingZeros()
    var italianLeadingZero: Bool = phoneNumber.isItalianLeadingZeros()
    println("hasItalianLeadingZero ==> ${hasItalianLeadingZero}")
    println("italianLeadingZero ==> ${italianLeadingZero}")


    var hasNumberOfLeadingZeros: Bool = phoneNumber.hasNumbersOfLeadingZeros()
    var numberOfLeadingZeros: Int64 = phoneNumber.getNumbersOfLeadingZeros()
    println("hasNumberOfLeadingZeros ==> ${hasNumberOfLeadingZeros}")
    println("numberOfLeadingZeros ==> ${numberOfLeadingZeros}")

    var hasRawInput: Bool = phoneNumber.hasRawInputs()
    var rawInput: String = phoneNumber.getRawInputs()
    println("hasRawInput ==> ${hasRawInput}")
    println("rawInput ==> ${rawInput}")

    var hasCountryCodeSource: Bool = phoneNumber.hasCountryCodeSources()
    var countryCodeSource: CountryCodeSource = phoneNumber.getCountryCodeSources()
    println("hasCountryCodeSource ==> ${hasCountryCodeSource}")
    println("countryCodeSource ==> ${matchCountryCodeSource(countryCodeSource)}")

    var hasPreferredDomesticCarrierCode: Bool = phoneNumber.hasPreferredDomesticCarrierCodes()
    var preferredDomesticCarrierCode: String = phoneNumber.getPreferredDomesticCarrierCodes()
    println("hasPreferredDomesticCarrierCode ==> ${hasPreferredDomesticCarrierCode}")
    println("preferredDomesticCarrierCode ==> ${preferredDomesticCarrierCode}")
}

func matchCountryCodeSource(countryCodeSource: CountryCodeSource): String {
    match (countryCodeSource) {
        case FROM_NUMBER_WITH_PLUS_SIGN => return "FROM_NUMBER_WITH_PLUS_SIGN"
        case FROM_NUMBER_WITH_IDD => return "FROM_NUMBER_WITH_IDD"
        case FROM_NUMBER_WITHOUT_PLUS_SIGN => "FROM_NUMBER_WITHOUT_PLUS_SIGN"
        case FROM_DEFAULT_COUNTRY => "FROM_DEFAULT_COUNTRY"
        case UNSPECIFIED => "UNSPECIFIED"
    }
}
```

执行结果如下：

```shell
hasCountryCode ==> true
countryCode ==> 1
hasNationalNumber ==> true
nationalNumber ==> 33316005
hasExtension ==> false
extension ==>
hasItalianLeadingZero ==> false
italianLeadingZero ==> false
hasNumberOfLeadingZeros ==> false
numberOfLeadingZeros ==> 1
hasRawInput ==> false
rawInput ==>
hasCountryCodeSource ==> false
countryCodeSource ==> UNSPECIFIED
hasPreferredDomesticCarrierCode ==> false
preferredDomesticCarrierCode ==>
```

### 2 提供对中国及美国的电话号码进行格式化功能

前置条件：需要提前将电话号码元数据准备完毕 
场景：
1.提供对中国及美国电话号码的格式化功能
2.提供即时格式化用户输入的电话号码
约束：数据范围局限于生成的电话号码元数据内
依赖：NA
性能： NA
可靠性： NA

#### 2.1 电话号码格式化
获取 phonenumberUtil 实例，调用format格式化电话号码

##### 2.1.1 主要接口

class PhoneNumberUtil

```cangjie
    /**
    * 通过枚举类型格式化电话号码，并返回.
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
    * @param numberFormat of PhoneNumberFormat, 枚举类型，包含4种格式化的类型，E164, INTERNATIONAL, NATIONAL, RFC3966.
    *
    * @return Type of String 返回格式化后的电话号码.
    */
    public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat): String

    /**
    * 通过枚举类型格式化电话号码，并返回.
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
    * @param numberFormat of PhoneNumberFormat 枚举类型，包含4种格式化的类型，E164, INTERNATIONAL, NATIONAL, RFC3966.
    * @param formattedNumber of StringBuilder 格式化的内容存放容器.
    *
    * @return Type of Unit
    */
    public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit
```

##### 2.1.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("tel:253-0000;phone-context=www.google.com", "US")
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.RFC3966)
    println("PhoneNumberFormat.RFC3966 ==> ${format1}")
    if (format1 != "tel:+1-2530000") {
        return 1
    }
    return 0
}
```

执行结果如下：

```shell
PhoneNumberFormat.RFC3966 ==> tel:+1-2530000
```

#### 2.2 即时格式化电话号码
确定国家代码与时区，即时格式化用户输入的电话号码

##### 2.2.1 主要接口

class PhoneNumberUtil

```cangjie
    /**
    * 获得即时格式化对象
    *
    * @param regionCode of String, 地区码, 支持CN,US
    *
    * @return Type of AsYouTypeFormatter
    */
    public func getAsYouTypeFormatter(regionCode: String): AsYouTypeFormatter
```

class AsYouTypeFormatter

```cangjie
    /**
    * The Function is init constructor
    *
    * @param regionCode of String, 地区码, 支持CN,US
    */
    public init (regionCode: String)

    /**
    * 添加即时格式字符
    *
    * @param nextChar of Char, 即时格式化字符
    *
    * @return Type of String
    */
    public func inputDigit (nextChar: Char): String

    /**
    * 添加即时格式字符, 并记录位置
    *
    * @param nextChar of Char, 即时格式化字符
    *
    * @return Type of String
    */
    public func inputDigitAndRememberPosition (nextChar: Char): String

    /**
    * 获得记录字符从1开始的位置
    *
    * @return Type of Int32 若发生格式则为格式化后的位置, 调用是返回最近的inputDigitAndRememberPosition字符的位置.
    */
    public func getRememberedPosition (): Int32

    /**
    * 清除之前加入的即时格式化内容
    *
    * @return Type of Unit
    */
    public func clear (): Unit 
```

##### 2.2.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.metadata.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var asYouTypeFormatter = phoneNumberUtil.getAsYouTypeFormatter("CN")
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('9')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit('9')
    if (asYouTypeFormatterStr1 != "199") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('9')
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('8')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit('2')
    if (asYouTypeFormatterStr2 != "199 9182") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('2')
    asYouTypeFormatter.inputDigit('8')
    asYouTypeFormatter.inputDigitAndRememberPosition('2')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit('6')
    if (asYouTypeFormatterStr3 != "199 9182 2826") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 12) {
        return 1
    }
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr4 != "19 991 822 8267") {
        return 1
    }
    var asYouTypeFormatterStr5: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr5 != "1999182282677") {
        return 1
    }
    asYouTypeFormatter.clear()
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    var asYouTypeFormatterStr6: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr6 != "7") {
        return 1
    }
    return 0
}

```

执行结果如下：

```shell
return 0
```

### 3 提供对中国及美国的电话号码进行验证功能

前置条件：需要提前将电话号码元数据准备完毕  
场景：
1.提供对中国及美国电话号码的验证功能
约束：数据范围局限于生成的电话号码元数据内
依赖：NA
性能： NA
可靠性： NA

#### 3.1 电话号码验证
获取 phonenumberUtil 实例，传入某个电话号码，验证其是否有效

##### 3.1.1 主要接口

class PhoneNumberUtil

```cangjie
    /**
    * 判断传入的电话号码是否有效
    *
    * @param number 传入一个电话号码
    *
    * @return 返回判断传入的电话号码是否有效，若有效，则为 true，反之，为 false
    */
    public func isValidNumber(number: PhoneNumber): Bool

    /**
    * 根据传入的区域代码判断传入的电话号码是否有效
    *
    * @param number 传入一个电话号码
    * @param regionCode String 类型字符串
    *
    * @return 返回判断传入的电话号码是否有效，若有效，则为 true，反之，为 false
    */
    public func isValidNumberForRegion(number: PhoneNumber, regionCode: String): Bool
```

##### 3.1.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
from std import regex.*
from std import os.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("11111111111", "CN")
    var num = phoneNumber.getNationalNumbers()
    println("${num}")
    var isValid1: Bool = phoneNumberUtil.isValidNumber(phoneNumber)
    println("${isValid1}")
    if (isValid1 != false) {
        return 1
    }
    var isValid2: Bool = phoneNumberUtil.isValidNumberForRegion(phoneNumber, "US")
    println("${isValid2}")
    if (isValid2 != false) {
        return 1
    }
    0
}
```

执行结果如下：

```shell
11111111111
false
false
```

### 4 提供对电话号码进行相关信息查询

前置条件：需要提前将电话号码元数据准备完毕 
场景：
1.提供仅使用长度信息快速猜测一个号码是否是可能的电话号码
2.提供指定国家/地区的有效示例
3.提供在文本中查找数字
4.获取号码类型
约束：数据范围局限于生成的电话号码元数据内
依赖：NA
性能： NA
可靠性： NA

#### 4.1 号码类型
获取 phonenumberUtil 实例，获取号码类型

##### 4.1.1 主要接口

class PhoneNumberUtil

```cangjie
    /**
    * 根据号码本身获取号码的类型
    *
    * @param number 传入一个电话号码
    *
    * @return 返回号码的枚举类型
    */
    public func getNumberType(number: PhoneNumber): PhoneNumberType
```

##### 4.1.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("0086-25-95566", "CN")
    var str = phoneNumberUtil.getNumberType(phoneNumber).toString()
    println(str)
    return 0
}
```

执行结果如下：

```shell
FIXED_LINE
```

#### 4.2 实例提供
提供指定国家/地区的有效示例

##### 4.2.1 主要接口

class PhoneNumberUtil

```cangjie
    /*
     * 获取电话号码示例
     *
     * 返回 String 类型的字符串
     */
    public func getExampleNumber(): String

    /**
    * 获得地区的号码示例，获得PhoneNumberType为FIXED_LINE的示例
    *
    * @param regionCode of String 地区码, 支持CN, US
    *
    * @return Type of Option<PhoneNumber>
    * @since 0.35.6
    */
    public func getExampleNumber (regionCode: String): Option<PhoneNumber>

    /**
    * 获得地区指定类型的号码示例
    *
    * @param regionCode of String 地区码, 支持CN, US
    * @param PhoneNumberType of PhoneNumberType 号码类型,枚举类型PhoneNumberType分为12种类型, 具体参考       PhoneNumberType类型。
    *
    * @return Type of Option<PhoneNumber>
    * @since 0.35.6
    */
    public func getExampleNumberForType (regionCode: String, PhoneNumberType: PhoneNumberType): Option<PhoneNumber>
```

##### 4.2.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.metadata.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var reginCode: String = "CN"
    var us = phoneNumberUtil.getExampleNumber(reginCode)
    if (showExamplePhoneNumber(us, "FIXED_LINE") != 1012345678) {
        return 1
    }
    var us_FIXED_LINE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.FIXED_LINE)
    var us_MOBILE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.MOBILE)
    var us_FIXED_LINE_OR_MOBILE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.FIXED_LINE_OR_MOBILE)
    var us_TOLL_FREE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.TOLL_FREE)
    var us_PREMIUM_RATE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.PREMIUM_RATE)
    var us_SHARED_COST: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.SHARED_COST)
    var us_VOIP: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.VOIP)
    var us_PERSONAL_NUMBER: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.PERSONAL_NUMBER)
    var us_PAGER: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.PAGER)
    var us_UAN: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.UAN)
    var us_VOICEMAIL: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.VOICEMAIL)
    var us_UNKNOWN: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.UNKNOWN)
    if (showExamplePhoneNumber(us_FIXED_LINE, "FIXED_LINE") != 1012345678) {
        return 1
    }
    if (showExamplePhoneNumber(us_MOBILE, "MOBILE") != 13123456789) {
        return 1
    }
    if (showExamplePhoneNumber(us_FIXED_LINE_OR_MOBILE, "FIXED_LINE_OR_MOBILE") != 1012345678) {
        return 1
    }
    if (showExamplePhoneNumber(us_TOLL_FREE, "TOLL_FREE") != 8001234567) {
        return 1
    }
    if (showExamplePhoneNumber(us_PREMIUM_RATE, "PREMIUM_RATE") != 16812345) {
        return 1
    }
    if (showExamplePhoneNumber(us_SHARED_COST, "SHARED_COST") != 4001234567) {
        return 1
    }
    if (showExamplePhoneNumber(us_VOIP, "VOIP") != -1) {
        return 1
    }
    if (showExamplePhoneNumber(us_PERSONAL_NUMBER, "PERSONAL_NUMBER") != -1 ) {
        return 1
    }
    if (showExamplePhoneNumber(us_PAGER, "PAGER") != -1) {
        return 1
    }
    if (showExamplePhoneNumber(us_UAN, "UAN") != -1 ) {
        return 1
    }
    if (showExamplePhoneNumber(us_VOICEMAIL, "VOICEMAIL") != -1 ){
        return 1
    }
    if (showExamplePhoneNumber(us_UNKNOWN, "UNKNOWN") != -1 ) {
        return 1
    }
    return 0
}

func showExamplePhoneNumber(phoneNumber: Option<PhoneNumber>, types: String): Int64 {
    match(phoneNumber) {
        case Some(x) =>
            println("showExamplePhoneNumber ${types} ==> ${x.getNationalNumbers()}")
            return x.getNationalNumbers()
        case None =>
            println("showExamplePhoneNumber ==> None")
            return -1
    }
}
```

执行结果如下：

```shell
showExamplePhoneNumber FIXED_LINE ==> 1012345678
showExamplePhoneNumber FIXED_LINE ==> 1012345678
showExamplePhoneNumber MOBILE ==> 13123456789
showExamplePhoneNumber FIXED_LINE_OR_MOBILE ==> 1012345678
showExamplePhoneNumber TOLL_FREE ==> 8001234567
showExamplePhoneNumber PREMIUM_RATE ==> 16812345
showExamplePhoneNumber SHARED_COST ==> 4001234567
showExamplePhoneNumber ==> None
showExamplePhoneNumber ==> None
showExamplePhoneNumber ==> None
showExamplePhoneNumber ==> None
showExamplePhoneNumber ==> None
showExamplePhoneNumber ==> None
```

#### 4.3 数字查找
在输入文本中查找数字

##### 4.3.1 主要接口

class PhoneNumberUtil

```cangjie
    /**
    * 数字查找功能，根据输入的文本信息查找电话号码
    *
    * @param text 传入的文本信息
    * @param defaultRegion String 类型字符串
    *
    * @return 返回 PhoneNumberMatch 类型的迭代器
    */
    public func findNumbers(text: String, defaultRegion: String): Iterable<PhoneNumberMatch>
```

##### 4.3.1.1 示例

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var zipPreceding: String = "hello 仓颉, i am.0086687652"
    var iterator: Iterator<PhoneNumberMatch> = phoneUtil.findNumbers(zipPreceding, "CN").iterator()
    while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                break
            case None => println("None...")
                break
        }
    }
    return 0
}
```

执行结果如下：

```shell
None...
```
