<div align="center">
<h1>phonenumber4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.5-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.39.8-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-94.8%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## <img alt="" src="./doc/assets/readme-icon-introduction.png" style="display: inline-block;" width=3%/>介绍

一个解析、格式化和验证国际电话号码的通用 Java、C++ 和 JavaScript 库

### 特性

- 🚀 解析、格式化和验证世界所有国家/地区的电话号码
- 🚀 根据号码本身获取号码的类型
- 🚀 为指定国家/地区提供有效的示例号码
- 🚀 在用户输入每个数字时即时格式化电话号码
- 🚀 在文本中查找数字
- 🚀 根据电话号码查询运营商信息
- 🚀 根据电话号码查询地理位置信息
- 🚀 根据电话号码查询时区信息

### 路线

<p align="center">
<img src="./doc/assets/milestone.png" width="100%" >
</p>

## <img alt="" src="./doc/assets/readme-icon-framework.png" style="display: inline-block;" width=3%/> 架构

### 源码目录

```shell
.
├── README.md
├── doc
│   ├── assets
│   ├── cjcov
│   ├── design.md
│   ├── feature_api.md
├── src
│   └── carrier
│       ├── phone_number_to_carrier_mapper.cj
│   └── geocoder
│       ├── geocoding
            ├── phone_number_offline_geocoder.cj
        ├── phone_number_to_timezone_mapper.cj
│   └── libphonenumber
│       ├── data
│           ├── phone_number_metadata.cj
│       ├── inter
│           ├── countrycode_to_region_codeMap.cj
│           ├── illegalstate_exception.cj
│           ├── metadata_loader.cj
│           ├── missing_metadata_exception.cj
│           ├── number_parse_exception.cj
│           ├── phone_metadata.cj
│           ├── phone_number.cj
│           ├── phone_number_match.cj
│       ├── internal
│           ├── geo_entity_utility.cj
│           ├── matcher_api.cj
│           ├── regex_based_matcher.cj
│           ├── regex_cache.cj
│       ├── metadata
│           ├── blocking_metadata_bootstrapping_guard.cj
│           ├── classpath_resource_metadataloader.cj
│           ├── composite_metadata_container.cj
│           ├── default_metadata_dependencies_provider.cj
│           ├── formatting_metadata_source.cj
│           ├── formatting_metadata_source_impl.cj
│           ├── map_backed_metadata_container.cj
│           ├── metadata_bootstrapping_guard.cj
│           ├── metadata_container.cj
│           ├── metadata_parser.cj
│           ├── metadata_source.cj
│           ├── metadata_source_impl.cj
│           ├── multifile_mode_filename_Provider.cj
│           ├── non_geographical_entity_metadata_source.cj
│           ├── phone_metadata_filename_provider.cj
│           ├── region_metadata_source.cj
│           ├── region_metadata_source_impl.cj
│       ├── as_you_type_formatter.cj
│       ├── phone_number_matcher.cj
│       ├── phone_number_util.cj
│   └── prefixmapper
│       ├── language.cj
│       ├── prefix_file_reader.cj
│       ├── prefix_reader_file_path.cj
└── test   
    ├── HLT
    ├── LLT
    └── UT
├── CHANGELOG.md
├── gitee_gate.cfg
├── LICENSE
├── module.json
├── phonenumber_build.bat
├── phonenumber_build.sh
├── README.md
├── README.OpenSource
```

- `doc` 存放库的设计文档、使用文档、需求文档、LLT 用例覆盖报告
- `src` 是库源码目录
- `test` 是存放测试用例的文件夹，含有 HLT 测试用例、LLT 自测用例和 UT 单元测试用例

### 接口说明

主要是核心类和成员函数说明,详情见 [API](./doc/feature_api.md)

## <img alt="" src="./doc/assets/readme-icon-compile.png" style="display: inline-block;" width=3%/> 使用说明

### 编译构建

#### linux环境编译

编译描述和具体shell命令

```shell
cjpm build
```

#### Windows环境编译

编译描述和具体cmd命令

```cmd
cjpm build
```

### 功能示例

注意：用例需放入 `test/LLT` 下，执行步骤是 [本项目编译运行方式](#jump1)

#### 解析电话号码功能示例

```cangjie
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

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

#### 格式化电话号码功能示例

```cangjie
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

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

#### 验证电话号码功能示例

```cangjie
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*
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

#### 根据号码本身获取号码的类型功能示例

```cangjie
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

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

#### 为所有国家/地区提供有效的示例号码功能示例

```cangjie
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

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

#### 在用户输入数字时即时格式化电话号码功能示例

```cangjie
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

main() {
    var asYouTypeFormatter = AsYouTypeFormatter("US")
    asYouTypeFormatter.inputDigit('+')
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('4')
    asYouTypeFormatter.inputDigit('2')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit('5')
    if (asYouTypeFormatterStr1 != "+1 425") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('5')
    asYouTypeFormatter.inputDigit('5')
    asYouTypeFormatter.inputDigit('5')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit('0')
    if (asYouTypeFormatterStr2 != "+1 425-555-0") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigitAndRememberPosition('1')
    asYouTypeFormatter.inputDigit('0')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit('0')
    if (asYouTypeFormatterStr3 != "+1 425-555-0100") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 13) {
        return 1
    }
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit('9')
    if (asYouTypeFormatterStr4 != "+142555501009") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 10) {
        return 1
    }
    asYouTypeFormatter.clear()
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    return 0
}


```

执行结果如下：

```shell
0
```

#### 在文本中查找数字功能示例

```cangjie
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

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

#### 根据电话号码查询运营商信息功能示例

```cangjies
from phonenumber4cj import carrier.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(13967195351)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForNumber(phone, Language.Chinese)
    let res2: String = p.getNameForNumber(phone, Language.English)
    if (!res.isEmpty()) {
        println(res)
    }
    println(res2)
    0
}

```

执行结果如下：

```shell
中国移动
China Mobile
```

#### 根据电话号码查询地理位置信息功能示例

```cangjie
from phonenumber4cj import geocoder.geocoding.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(15168316747)
    var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
    let res: String = p.getDescriptionForNumber(phone, Language.China, "CN")
    if (!res.isEmpty()) {
        println(res)
        return 0
    }
    return 1
}


```

执行结果如下：

```shell
浙江省杭州市
```

#### 根据电话号码查询时区信息功能示例

```cangjie
from phonenumber4cj import geocoder.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*
from std import collection.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(15091069727)
    var p: PhoneNumberToTimeZonesMapper = PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
    let str: String = PhoneNumberToTimeZonesMapper.getUnknownTimeZone()
    let arr: ArrayList<String> = p.getTimeZonesForGeographicalNumber(phone)
    for (res in arr) {
        if (res != "Etc/Unknown") {
            println(res)
            return 0
        }
    }
    return 1
}


```

执行结果如下：

```shell
Asia/Shanghai
```

## <img alt="" src="./doc/assets/readme-icon-contribute.png" style="display: inline-block;" width=3%/> 参与贡献

欢迎给我们提交 PR，欢迎给我们提交 issue，欢迎参与任何形式的贡献。
