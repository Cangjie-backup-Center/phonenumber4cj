<div align="center">
<h1>phonenumber</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.34.3-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-91.6%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## <img alt="" src="./doc/assets/readme-icon-introduction.png" style="display: inline-block;" width=3%/>介绍

一个解析、格式化和验证国际电话号码的通用 Java、C++ 和 JavaScript 库

### 特性

- 🚀 解析、格式化和验证世界所有国家/地区的电话号码

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
│   ├── design.md  
│   ├── proposal.md
│   └── xxx_lib.md 
├── src
│   └── carrier
│       ├── data
│   └── geocoder
│       ├── data
│   └── libphonenumber
│       ├── data
│           ├── phone_number_metadata.cj
│       ├── inter
│           ├── countrycode_to_region_codeMap.cj
│           ├── illegalstate_exception.cj
│           ├── linked_hashmap.cj
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
│       ├── phone_number_util.cj
│   └── prefixmapper
└── test   
    ├── HLT
    ├── LLT
    └── UT
```

- `doc`是库的设计文档、提案、库的使用文档
- `src`是库源码目录
- `test`是存放测试用例，包括HLT用例、LLT 用例和UT用例

### 接口说明

主要是核心类和成员函数说明,详情见 [API](./doc/api.md)

## <img alt="" src="./doc/assets/readme-icon-compile.png" style="display: inline-block;" width=3%/> 编译执行

### 编译

```shell
cd test/LLT
cjc ./*.cj
```
### 安装

```shell
# install cjc;
source cangjie/cangjie/envsetup.sh;
cjc -v;
```

### 运行

```cangjie
 cjc phone_parse_test_01_CN.cj
 ./main
 echo $?
```

### 示例

示例描述

```cangjie
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
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

## <img alt="" src="./doc/assets/readme-icon-contribute.png" style="display: inline-block;" width=3%/> 参与贡献

[@chinesebear](https://gitee.com/chinesebear)
[@shawnzhao19](https://gitee.com/shawnzhao19)
