## phonenumber库

### 介绍
该库主要是一个解析、格式化和验证国际电话号码的通用 Java、C++ 和 JavaScript 库

### 主要接口
#### class CountryCodeToRegionCodeMap 

此类是从国家代码到地区代码的映射类，用国家代码表示国家/地区

```cangjie
public class CountryCodeToRegionCodeMap {

    /*
     * 从 Hashmap 中根据国家代码获取国家/地区
     *
     * 返回值 HashMap<Int32, ArrayList<String>> - 返回所有的国家代码到地区代码的映射类集合
     */
    public static func getCountryCodeToRegionCodeMap(): HashMap<Int32, ArrayList<String>>
}
```

#### class IllegalStateException

此类是一个非法状态异常类，它继承了 Exception 类

```cangjie
public open class IllegalStateException {

    /*
     * IllegalStateException 的无参构造器
     */
    public init()

    /*
     * IllegalStateException 的有参构造器
     *
     * 参数 s - String 类型的字符串
     */
    public init(s: String)
}
```

#### class MissingMetadataException

此类是一个缺失元数据的异常信息类，它继承了 IllegalStateException 类

```cangjie
public open class MissingMetadataException {

    /*
     * MissingMetadataException 的有参构造器
     *
     * 参数 message - String 类型的字符串
     */
    public init(message: String)
}
```

#### class NumberParseException

此类是一个缺失元数据的异常信息类，它继承了 Exception 类

```cangjie
public class NumberParseException {

    /*
     * NumberParseException 的有参构造器
     *
     * 参数 errorType - 传入的错误信息枚举类型
     * 参数 msg - String 类型的字符串
     */
    public init(errorType: ErrorType, msg: String)

    /*
     * 获取异常信息错误类型
     *
     * 返回错误信息枚举类型
     */
    public func getErrorType(): ErrorType

    /*
     * 打印字符串信息
     *
     * 返回 String 类型的字符串
     */
    public func toString(): String
}
```

#### enum ErrorType

此类是一个错误信息枚举类，分别表示 INVALID_COUNTRY_CODE 无效国家代码、NOT_A_NUMBER 无效电话号码、TOO_SHORT_AFTER_IDD 超短号码、TOO_SHORT_NSN 超短号码、TOO_LONG 号码太长

```cangjie
public class NumberParseException {

    /*
     * 判断两个枚举类型是否相等
     *
     * 参数 thar - 传入的另一个错误信息枚举类型
     *
     * 返回两个枚举类型是否相等，若相等，返回 ture；否则，返回 false
     */
    public operator func == (that: ErrorType): Bool

    /*
     * 判断两个枚举类型是否不相等
     *
     * 参数 thar - 传入的另一个错误信息枚举类型
     *
     * 返回两个枚举类型是否不相等，若不相等，返回 ture；否则，返回 false
     */
    public operator func != (that: ErrorType): Bool

    /*
     * 打印字符串信息
     *
     * 返回 String 类型的字符串
     */
    public func toString(): String
}
```

#### class PhonemetadataNumberFormat

此类是电话号码元数据格式化信息装配类，它含有与格式化相关的一些信息

```cangjie
public open class PhonemetadataNumberFormat {

    /*
     * PhonemetadataNumberFormat 的无参构造器
     *
     */
    public init()

    /*
     * 判断是否含有模式匹配函数
     *
     * 返回是否含有模式匹配函数，若含有，返回 ture；否则，返回 false
     */
    public func hasPatternFunc(): Bool

    /*
     * 从对象中获取模式匹配
     *
     * 返回 String 类型的字符串
     */
    public func getPattern(): String

    /*
     * 设置模式匹配函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有匹配模式的 PhonemetadataNumberFormat 装配类对象
     */
    public func setPattern(value: String): PhonemetadataNumberFormat

    /*
     * 判断是否含有格式化函数
     *
     * 返回是否含有格式化函数，若含有，返回 ture；否则，返回 false
     */
    public func hasFormatFunc(): Bool

    /*
     * 从对象中获取格式化函数
     *
     * 返回 String 类型的字符串
     */
    public func getFormat(): String

    /*
     * 设置格式化函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有格式化函数的 PhonemetadataNumberFormat 装配类对象
     */
    public func setFormat(value: String): PhonemetadataNumberFormat

    /*
     * 获取数字主导匹配模式集合
     *
     * 返回数字主导匹配模式集合
     */
    public func leadingDigitPatterns(): ArrayList<String>

    /*
     * 数字主导匹配模式集合大小
     *
     * 返回 Int32 类型数据
     */
    public func leadingDigitsPatternSize(): Int32

    /*
     * 获取数字主导匹配模式集合大小
     *
     * 返回 Int32 类型数据
     */
    public func getLeadingDigitsPatternCount(): Int32

    /*
     * 根据序列号得到Pattern
     *
     * 参数 index - Int32 类型数据
     *
     * 返回 option 类型，表示集合中的值
     */
    public func getLeadingDigitsPattern(index: Int32): Option<String>

    /*
     * 向leadingDigitsPattern_中添加Pattern数据
     *
     * 参数 index - Int32 类型数据
     *
     * 返回 option<String> 类型，表示集合中的值
     */
    public func addLeadingDigitsPattern(value: Option<String>): PhonemetadataNumberFormat

    /*
     * 判断是否含有格式化规则的国家前缀函数
     *
     *
     * 返回是否含有格式化规则的国家前缀函数，若含有，则为 true；反之，为 false
     */
    public func hasNationalPrefixFormattingRuleFunc(): Bool

    /*
     * 获取格式化规则的国家前缀函数
     *
     * 返回 String 类型的字符串
     */
    public func getNationalPrefixFormattingRule(): String

    /*
     * 设置格式化规则的国家前缀函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有格式化规则的国家前缀函数的 PhonemetadataNumberFormat 装配类对象
     */
    public func setNationalPrefixFormattingRule(value: String): PhonemetadataNumberFormat

    /*
     * 清除格式化规则的国家前缀函数
     *
     * 返回清除格式化规则的国家前缀函数后的 PhonemetadataNumberFormat 装配类对象
     */
    public func clearNationalPrefixFormattingRule(): PhonemetadataNumberFormat

    /*
     * 判断当格式化时是否含有国家前缀可选项函数
     *
     * 返回格式化时是否含有国家前缀可选项函数，若含有，则为 true；反之，为 false
     */
    public func hasNationalPrefixOptionalWhenFormattingFunc(): Bool

    /*
     * 获取格式化国家前缀可选项函数
     *
     * 返回格式化时是否含有国家前缀可选项函数，若含有，则为 true；反之，为 false
     */
    public func getNationalPrefixOptionalWhenFormatting(): Bool

    /*
     * 设置格式化时国家前缀可选项函数
     *
     * 参数 value - Bool 类型参数
     *
     * 返回含有格式化时国家前缀可选项函数的 PhonemetadataNumberFormat 装配类对象
     */
    public func setNationalPrefixOptionalWhenFormatting(value: Bool): PhonemetadataNumberFormat

    /*
     * 判断是否含有与运营商相关的格式化规则函数
     *
     * 返回是否含有与运营商相关的格式化规则函数，若含有，则为 true；反之，为 false
     */
    public func hasDomesticCarrierCodeFormattingRuleFunc(): Bool

    /*
     * 获取与运营商相关的格式化规则函数
     *
     * 返回 String 类型的字符串
     */
    public func getDomesticCarrierCodeFormattingRule(): String

    /*
     * 设置与运营商相关的格式化规则函数
     *
     * 参数 value - String 类型参数
     *
     * 返回含有与运营商相关的格式化规则函数的 PhonemetadataNumberFormat 装配类对象
     */
    public func setDomesticCarrierCodeFormattingRule(value: String): PhonemetadataNumberFormat

    /*
     * 读取数据
     *
     * 参数 objectInput - String 类型的迭代器
     */
    public func readExternal(objectInput: Iterator<String>): Unit

    /*
     * 判断两个对象是否相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func ==(rhs: PhonemetadataNumberFormat): Bool

    /*
     * 判断两个对象是否不相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func !=(rhs: PhonemetadataNumberFormat): Bool
}
```

#### class PhonemetadataPhoneNumberDesc

此类是电话号码元数据信息装配类

```cangjie
public open class PhonemetadataNumberFormat {

    /*
     * PhonemetadataNumberFormat 的无参构造器
     *
     */
    public init()

    /*
     * 构造一个 PhonemetadataNumberFormat 对象
     *
     * 返回一个 PhonemetadataNumberFormat 对象
     */
    public static func newBuilder(): PhoneNumberDescBuilder

    /*
     * 判断是否含有国家号码模型匹配函数
     *
     * 返回是否含有国家号码模型匹配函数，若含有，返回 ture；否则，返回 false
     */
    public func hasNationalNumberPatternFunc(): Bool

    /*
     * 获取国家号码模型匹配函数
     *
     * 返回 String 类型的字符串
     */
    public func getNationalNumberPattern(): String

    /*
     * 设置国家号码模型匹配函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有国家号码模型匹配函数的 PhonemetadataNumberFormat 装配类对象
     */
    public func setNationalNumberPattern(value: String): PhonemetadataPhoneNumberDesc

    /*
     * 从对象中清除国家号码模型匹配函数
     *
     * 返回清楚国家号码模型匹配函数后的 PhonemetadataNumberFormat 装配类对象
     */
    public func clearNationalNumberPattern(): PhonemetadataPhoneNumberDesc

    /*
     * 获取集合长度
     *
     * 返回一个集合
     */
    public func getPossibleLengthList(): ArrayList<Int32>

    /*
     * 获取个数
     *
     * 返回 Int32 类型的数据
     */
    public func getPossibleLengthCount(): Int32

    /*
     * 添加长度
     *
     * 参数 value - Int32 类型的数据
     *
     * 返回一个 PhonemetadataNumberFormat 装配类对象
     */
    public func addPossibleLength(value: Int32): PhonemetadataPhoneNumberDesc

    /*
     * 从对象中清除长度
     *
     * 返回一个 PhonemetadataNumberFormat 装配类对象
     */
    public func clearPossibleLength(): PhonemetadataPhoneNumberDesc

    /*
     * 获取集合长度
     *
     * 返回一个集合
     */
    public func getPossibleLengthLocalOnlyList(): ArrayList<Int32>

    /*
     * 获取个数
     *
     * 返回 Int32 类型的数据
     */
    public func getPossibleLengthLocalOnlyCount(): Int32

    /*
     * 添加长度
     *
     * 参数 value - Int32 类型的数据
     *
     * 返回 Option 类型
     */
    public func getPossibleLengthLocalOnly(index: Int32): Option<Int32>

    /*
     * 添加长度
     *
     * 参数 value - Int32 类型的数据
     *
     * 返回添加后的 PhonemetadataPhoneNumberDesc 对象
     */
    public func addPossibleLengthLocalOnly(value: Int32): PhonemetadataPhoneNumberDesc 

    /*
     * 从对象中清除长度
     *
     * 返回一个 PhonemetadataNumberFormat 装配类对象
     */
    public func clearPossibleLengthLocalOnly(): PhonemetadataPhoneNumberDesc

    /*
     * 判断是否含有电话号码示例
     *
     * 返回是否含含有电话号码示例，若含有，返回 ture；否则，返回 false
     */
    public func hasExampleNumberFunc(): Bool

    /*
     * 获取电话号码示例
     *
     * 返回 String 类型的字符串
     */
    public func getExampleNumber(): String

    /*
     * 设置电话号码示例
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有电话号码示例的 PhonemetadataNumberFormat 装配类对象
     */
    public func setExampleNumber(value: String): PhonemetadataPhoneNumberDesc

    /*
     * 从对象中清除电话号码示例
     *
     * 返回清除电话号码示例后的 PhonemetadataNumberFormat 装配类对象
     */
    public func clearExampleNumber(): PhonemetadataPhoneNumberDesc

    /*
     * 判断两个对象是否完全相等
     *
     * 参数 other - 传入另一个对象
     *
     * 返回两个对象是否完全相等，若相等，返回 true；反之，返回 false
     */
    public func exactlySameAs(other: PhonemetadataPhoneNumberDesc): Bool

    /*
     * 读取数据
     *
     * 参数 objectInput - String 类型的迭代器
     */
    public func readExternal(objectInput: Iterator<String>): Unit

    /*
     * 判断两个对象是否相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func ==(rhs: PhonemetadataPhoneNumberDesc): Bool

    /*
     * 判断两个对象是否不相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func !=(rhs: PhonemetadataPhoneNumberDesc): Bool
}
```

#### class PhoneNumberDescBuilder

此类是电话号码信息构建类

```cangjie
public class PhoneNumberDescBuilder {

    /*
     * PhoneNumberDescBuilder 的无参构造器
     *
     */
    public init()

    /*
     * PhoneNumberDescBuilder 的有参构造器
     *
     * 参数 out - PhonemetadataPhoneNumberDesc 对象
     */
    public init(out: PhonemetadataPhoneNumberDesc)

    /*
     * 构造一个 PhonemetadataPhoneNumberDesc 对象
     *
     * 返回构造的 PhonemetadataPhoneNumberDesc 对象
     */
    public func build(): PhonemetadataPhoneNumberDesc

    /*
     * 合并比较两个 PhonemetadataPhoneNumberDesc 对象
     *
     * 参数 other - 传入 PhonemetadataPhoneNumberDesc 对象
     *
     * 返回 PhoneNumberDescBuilder 对象
     */
    public func mergeFrom(other: PhonemetadataPhoneNumberDesc): PhoneNumberDescBuilder
}
```

#### class PhonemetadataPhoneMetadata

此类是电话元数据装配类

```cangjie

public class PhonemetadataPhoneMetadata {

    /*
     * PhonemetadataPhoneMetadata 的无参构造器
     *
     */
    public init()

    /*
     * PhonemetadataPhoneMetadata 的静态构造器
     *
     * 返回值是构造出来的 PhoneMetadataBuilder 对象
     */
    public static func newBuilder(): PhoneMetadataBuilder

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值 Bool 类型
     */
    public func hasGeneralDescFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 PhonemetadataPhoneNumberDesc 类型
     */
    public func getGeneralDesc(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 获取 phonemetadataPhoneNumberDesc 构造类对象
     *
     * 返回值是 PhonemetadataPhoneNumberDesc 类型
     */
    public func getGeneralDescBuilder(): PhonemetadataPhoneNumberDesc

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setGeneralDesc(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasFixedLineFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getFixedLine(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setFixedLine(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasMobileFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getMobile(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setMobile(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasTollFreeFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getTollFree(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setTollFree(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasPremiumRateFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getPremiumRate(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setPremiumRate(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasSharedCostFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getSharedCost(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setSharedCost(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasPersonalNumberFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getPersonalNumber(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setPersonalNumber(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasVoipFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getVoip(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setVoip(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata
    
    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasPagerFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getPager(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setPager(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasUanFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getUan(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setUan(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasEmergencyFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getEmergency(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setEmergency(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasVoicemailFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getVoicemail(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setVoicemail(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasShortCodeFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getShortCode(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setShortCode(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasStandardRateFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getStandardRate(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setStandardRate(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasCarrierSpecificFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getCarrierSpecific(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setCarrierSpecific(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasSmsServicesFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getSmsServices(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setSmsServices(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasNoInternationalDiallingFunc(): Bool

    /*
     * 获取装配函数后的类对象
     *
     * 返回值是 Option<PhonemetadataPhoneNumberDesc> 类型
     */
    public func getNoInternationalDialling(): Option<PhonemetadataPhoneNumberDesc>

    /*
     * 设置装配函数
     *
     * 参数 value - Option<PhonemetadataPhoneNumberDesc> 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setNoInternationalDialling(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有装配 id 的函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasIdFunc(): Bool

    /*
     * 获取 id
     *
     * 返回值是 String 类型字符串
     */
    public func getId(): String


    /*
     * 判断是否含有国家代码的装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasCountryCodeFunc(): Bool

    /*
     * 获取国家代码
     *
     * 返回值是 Int32 类型的数据
     */
    public func getCountryCode(): Int32

    /*
     * 设置国家代码
     *
     * 参数 value - Int32 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setCountryCode(value: Int32): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有内置前缀的装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasInternationalPrefixFunc(): Bool

    /*
     * 获取内置前缀
     *
     * 返回值是 String 类型的数据
     */
    public func getInternationalPrefix(): String

    /*
     * 设置内置前缀
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public open func setInternationalPrefix(value: String): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有首选项内置前缀的装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasPreferredInternationalPrefixFunc(): Bool

    /*
     * 获取首选项内置前缀
     *
     * 返回值是 String 类型的数据
     */
    public func getPreferredInternationalPrefix(): String

    /*
     * 设置首选项内置前缀
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setPreferredInternationalPrefix(value: String): PhonemetadataPhoneMetadata

    /*
     * 清除首选项内置前缀
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func clearPreferredInternationalPrefix(): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有国家前缀的装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasNationalPrefixFunc(): Bool

    /*
     * 获取国家内置前缀
     *
     * 返回值是 String 类型的数据
     */
    public func getNationalPrefix(): String

    /*
     * 设置国家内置前缀
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setNationalPrefix(value: String): PhonemetadataPhoneMetadata

    /*
     * 清除国家内置前缀
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func clearNationalPrefix(): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有首选项扩展前缀装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasPreferredExtnPrefixFunc(): Bool

    /*
     * 获取首选项扩展前缀
     *
     * 返回值是 String 类型的数据
     */
    public func getPreferredExtnPrefix(): String

    /*
     * 设置首选项扩展前缀
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setPreferredExtnPrefix(value: String): PhonemetadataPhoneMetadata

    /*
     * 清除首选项扩展前缀
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func clearPreferredExtnPrefix(): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有 NationalPrefixForParsingFunc 装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasNationalPrefixForParsingFunc(): Bool

    /*
     * 获取 NationalPrefixForParsingFunc
     *
     * 返回值是 String 类型的数据
     */
    public func getNationalPrefixForParsing(): String

    /*
     * 设置 NationalPrefixForParsingFunc
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setNationalPrefixForParsing(value: String): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有 NationalPrefixTransformRuleFunc 装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasNationalPrefixTransformRuleFunc(): Bool

    /*
     * 获取 NationalPrefixTransformRuleFunc
     *
     * 返回值是 String 类型的数据
     */
    public func getNationalPrefixTransformRule(): String

    /*
     * 设置 NationalPrefixTransformRuleFunc
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setNationalPrefixTransformRule(value: String): PhonemetadataPhoneMetadata

    /*
     * 清除 clearNationalPrefixTransformRule
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func clearNationalPrefixTransformRule(): PhonemetadataPhoneMetadata

    /*
     * 判断是否含有 SameMobileAndFixedLinePatternFunc 装配函数，若含有，则为 true；反之，为 false
     *
     * 返回值是 Bool 类型
     */
    public func hasSameMobileAndFixedLinePatternFunc(): Bool

    /*
     * 获取 hasSameMobileAndFixedLinePatternFunc
     *
     * 返回值是 String 类型的数据
     */
    public func getSameMobileAndFixedLinePattern(): Bool

    /*
     * 设置 getSameMobileAndFixedLinePattern
     *
     * 参数 value - Bool 类型的数据
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func setSameMobileAndFixedLinePattern(value: Bool): PhonemetadataPhoneMetadata

    /*
     * 清除 clearSameMobileAndFixedLinePattern
     *
     * 返回值是 PhonemetadataPhoneMetadata 对象
     */
    public func clearSameMobileAndFixedLinePattern(): PhonemetadataPhoneMetadata

    /*
     * 返回格式化后的电话号码
     *
     * 返回值是 ArrayList<PhonemetadataNumberFormat> 类型
     */
    public func numberFormats(): ArrayList<PhonemetadataNumberFormat>

    /*
     * 返回格式化后的电话号码列表
     *
     * 返回值是 ArrayList<PhonemetadataNumberFormat> 类型
     */
    public func getNumberFormatList(): ArrayList<PhonemetadataNumberFormat>

    /*
     * 返回格式化后的电话号码长度
     *
     * 返回值是 Int32 类型
     */
    public func numberFormatSize(): Int32

    /*
     * 返回格式化后的电话号码个数
     *
     * 返回值是 Int32 类型
     */
    public func getNumberFormatCount(): Int32

    /*
     * 根据 index 位置格式化电话号码
     *
     * 参数 index - 指定的位置
     *
     * 返回值是 Option<PhonemetadataNumberFormat> 类型
     */
    public func getNumberFormat(index: Int32): Option<PhonemetadataNumberFormat>

    /*
     * 添加电话号码于格式化
     *
     * 参数 index - Option<PhonemetadataNumberFormat> 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func addNumberFormat(value: Option<PhonemetadataNumberFormat>): PhonemetadataPhoneMetadata

    /*
     * 格式化电话号码
     *
     * 返回值是 ArrayList<PhonemetadataNumberFormat> 类型
     */
    public func intlNumberFormats(): ArrayList<PhonemetadataNumberFormat>

    /*
     * 获取 IntlNumberFormatList 列表
     *
     * 返回值是 ArrayList<PhonemetadataNumberFormat> 类型
     */
    public func getIntlNumberFormatList(): ArrayList<PhonemetadataNumberFormat>

    /*
     * 获取 IntlNumberFormatList 大小
     *
     * 返回值是 Int32 类型
     */
    public func intlNumberFormatSize(): Int32

    /*
     * 获取 IntlNumberFormatList 个数
     *
     * 返回值是 Int32 类型
     */
    public func getIntlNumberFormatCount(): Int32

    /*
     * 获取 IntlNumberFormat
     *
     * 参数 index - 指定位置
     *
     * 返回值是 Option<PhonemetadataNumberFormat> 类型
     */
    public func getIntlNumberFormat(index: Int32): Option<PhonemetadataNumberFormat>

    /*
     * 添加 IntlNumberFormat
     *
     * 参数 value - Option<PhonemetadataNumberFormat> 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func addIntlNumberFormat(value: Option<PhonemetadataNumberFormat>): PhonemetadataPhoneMetadata

    /*
     * 清除 IntlNumberFormat
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func clearIntlNumberFormat(): PhonemetadataPhoneMetadata

    /*
     * 是否含有 MainCountryForCodeFunc
     *
     * 返回值是 Bool 类型
     */
    public func hasMainCountryForCodeFunc(): Bool

    /*
     * 是否是 MainCountryForCodeFunc
     *
     * 返回值是 Bool 类型
     */
    public func isMainCountryForCode(): Bool

    /*
     * 获取 MainCountryForCode
     *
     * 返回值是 Bool 类型
     */
    public func getMainCountryForCode(): Bool

    /*
     * 设置 MainCountryForCode
     *
     * 参数 value - Bool 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setMainCountryForCode(value: Bool): PhonemetadataPhoneMetadata

    /*
     * 清除 MainCountryForCode
     *
     * 返回值是 Bool 类型
     */
    public func clearMainCountryForCode(): PhonemetadataPhoneMetadata

    /*
     * 是否含有 LeadingDigitsFunc
     *
     * 返回值是 Bool 类型
     */
    public func hasLeadingDigitsFunc(): Bool

    /*
     * 获取 LeadingDigits
     *
     * 返回值是 String 类型
     */
    public func getLeadingDigits(): String

    /*
     * 设置 LeadingDigits
     *
     * 参数 value - String 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setLeadingDigits(value: String): PhonemetadataPhoneMetadata

    /*
     * 是否含有 LeadingZeroPossibleFunc
     *
     * 返回值是 Bool 类型
     */
    public func hasLeadingZeroPossibleFunc(): Bool

    /*
     * 是否是 LeadingZeroPossible
     *
     * 返回值是 Bool 类型
     */
    public func isLeadingZeroPossible(): Bool

    /*
     * 设置 LeadingZeroPossible
     *
     * 参数 value - Bool 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setLeadingZeroPossible(value: Bool): PhonemetadataPhoneMetadata

    /*
     * 清除 LeadingZeroPossible
     *
     * 参数 value - Bool 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func clearLeadingZeroPossible(): PhonemetadataPhoneMetadata

    /*
     * 是否含有 MobileNumberPortableRegionFunc
     *
     * 返回值是 Bool 类型
     */
    public func hasMobileNumberPortableRegionFunc(): Bool

    /*
     * 是否是 MobileNumberPortableRegionFunc
     *
     * 返回值是 Bool 类型
     */
    public func isMobileNumberPortableRegion(): Bool

    /*
     * 获取 MobileNumberPortableRegion
     *
     * 返回值是 Bool 类型
     */
    public func getMobileNumberPortableRegion(): Bool

    /*
     * 设置 MobileNumberPortableRegion
     *
     * 参数 value - Bool 类型
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     */
    public func setMobileNumberPortableRegion(value: Bool): PhonemetadataPhoneMetadata

    /*
     * 清除 MobileNumberPortableRegion
     *
     * 返回值是 Bool 类型
     */
    public func clearMobileNumberPortableRegion(): PhonemetadataPhoneMetadata

    /*
     * 从外部读取数据
     *
     * 参数 objectInput - String 类型的迭代器
     *
     */
    public func readExternal(objectInput: Iterator<String>): Unit
```

#### class PhoneMetadataBuilder

```cangjie

    /*
     * PhoneMetadataBuilder 的无参构造器
     *
     */
    public init()

    /*
     * PhoneMetadataBuilder 的有参构造器
     *
     * 参数 out - PhonemetadataPhoneMetadata 类对象
     *
     */
    public init(out: PhonemetadataPhoneMetadata)

    /*
     * 构建 PhoneMetadataBuilder
     *
     * 返回值是 PhonemetadataPhoneMetadata 类型
     *
     */
    public func build(): PhonemetadataPhoneMetadata

    /*
     * 根据 value 内容设置 id
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhoneMetadataBuilder 类型
     *
     */
    public func setId(value: String): PhoneMetadataBuilder

    /*
     * 设置 InternationalPrefix
     *
     * 参数 value - String 类型的数据
     *
     * 返回值是 PhoneMetadataBuilder 类型
     *
     */
    public func setInternationalPrefix(value: String): PhoneMetadataBuilder
```

#### class PhonemetadataPhoneMetadataCollection

```cangjie

    /*
     * 设置元数据列表
     *
     * 返回值是 ArrayList<PhonemetadataPhoneMetadata> 类型
     *
     */
    public func getMetadataList(): ArrayList<PhonemetadataPhoneMetadata>

    /*
     * 设置元数据个数
     *
     * 返回值是 Int32 类型
     *
     */
    public func getMetadataCount(): Int32

    /*
     * 添加元数据
     *
     * 参数 value - Option<PhonemetadataPhoneMetadata> 类型
     *
     * 返回值是 Int32 类型
     *
     */
    public func addMetadata(value: Option<PhonemetadataPhoneMetadata>): PhonemetadataPhoneMetadataCollection

    /*
     * 从外部读取数据
     *
     * 参数 objectInput - ArrayList<String> 类型
     *
     */
    public func readExternal(objectInput: ArrayList<String>): Unit

    /*
     * 清除内容
     *
     * 返回值是 PhonemetadataPhoneMetadataCollection 类型
     *
     */
    public func clear(): PhonemetadataPhoneMetadataCollection
```

#### class PhoneMetadataCollectionBuilder

```cangjie

    /*
     * PhoneMetadataCollectionBuilder 的无参构造器
     *
     */
    public init()

    /*
     * PhoneMetadataCollectionBuilder 的无参构造器
     *
     * 参数 out - PhonemetadataPhoneMetadataCollection 类对象
     *
     */
    public init(out: PhonemetadataPhoneMetadataCollection)

    /*
     * 构建 PhoneMetadataCollectionBuilder
     *
     * 返回值是 PhonemetadataPhoneMetadataCollection 类型
     *
     */
    public func build(): PhonemetadataPhoneMetadataCollection
```

#### class PhoneNumber

```cangjie

    /*
     * PhoneNumber 的无参构造器
     *
     */
    public init()

    /*
     * 判断是否含有国家代码
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasCountryCodes(): Bool

    /*
     * 获取国家代码
     *
     * 返回值是 Int64 类型
     *
     */
    public func getCountryCodes(): Int64

    /*
     * 设置国家代码
     *
     * 参数 value - Int64 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setCountryCodes(value: Int64): PhoneNumber

    /*
     * 清除国家代码
     *
     * 参数 value - Int64 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearCountryCodes(): PhoneNumber

    /*
     * 判断是否含有国家号码
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasNationalNumbers(): Bool

    /*
     * 获取国家电话号码
     *
     * 返回值是 Int64 类型
     *
     */
    public func getNationalNumbers(): Int64

    /*
     * 设置国家电话号码
     *
     * 参数 value - Int64 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setNationalNumbers(value: Int64): PhoneNumber

    /*
     * 清除国家电话号码
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearNationalNumbers(): PhoneNumber

    /*
     * 判断是否含有 Extensions
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasExtensions(): Bool

    /*
     * 获取 Extensions
     *
     * 返回值是 String 类型
     *
     */
    public func getExtensions(): String

    /*
     * 设置 Extensions
     *
     * 参数 value - String 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setExtensions(value: String): PhoneNumber

    /*
     * 清除 Extensions
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearExtensions(): PhoneNumber

    /*
     * 判断是否含有 ItalianLeadingZeros
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasItalianLeadingZeros(): Bool

    /*
     * 判断是否是 ItalianLeadingZeros
     *
     * 返回值是 Bool 类型
     *
     */
    public func isItalianLeadingZeros(): Bool

    /*
     * 设置 ItalianLeadingZeros
     *
     * 参数 value - Bool 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setItalianLeadingZeros(value: Bool): PhoneNumber

    /*
     * 清除 ItalianLeadingZeros
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearItalianLeadingZeros(): PhoneNumber

    /*
     * 判断是否含有 NumbersOfLeadingZeros
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasNumbersOfLeadingZeros(): Bool

    /*
     * 获取 NumbersOfLeadingZeros
     *
     * 返回值是 Int64 类型
     *
     */
    public func getNumbersOfLeadingZeros(): Int64

    /*
     * 设置 NumbersOfLeadingZeros
     *
     * 参数 value - Int64 类型数据
     *
     * 返回值是 Int64 类型
     *
     */
    public func setNumberOfLeadingZeros(value: Int64): PhoneNumber

    /*
     * 清除 NumberOfLeadingZeros
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearNumberOfLeadingZeros(): PhoneNumber

    /*
     * 判断是否含有 RawInputs
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasRawInputs(): Bool

    /*
     * 获取 RawInputs
     *
     * 返回值是 String 类型
     *
     */
    public func getRawInputs(): String

    /*
     * 设置 RawInputs
     *
     * 参数 value - String 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setRawInputs(value: String): PhoneNumber

    /*
     * 清除 RawInputs
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearRawInputs(): PhoneNumber

    /*
     * 判断是否含有 CountryCodeSources
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasCountryCodeSources(): Bool

    /*
     * 获取 CountryCodeSources
     *
     * 返回值是 CountryCodeSource 类型
     *
     */
    public func getCountryCodeSources(): CountryCodeSource

    /*
     * 设置 CountryCodeSources
     *
     * 参数 value - CountryCodeSource 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setCountryCodeSources(value: CountryCodeSource): PhoneNumber

    /*
     * 清除 CountryCodeSources
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearCountryCodeSources(): PhoneNumber

    /*
     * 判断是否含有 PreferredDomesticCarrierCodes
     *
     * 返回值是 Bool 类型
     *
     */
    public func hasPreferredDomesticCarrierCodes(): Bool

    /*
     * 获取 PreferredDomesticCarrierCodes
     *
     * 返回值是 String 类型
     *
     */
    public func getPreferredDomesticCarrierCodes(): String

    /*
     * 设置 PreferredDomesticCarrierCodes
     *
     * 参数 value - String 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func setPreferredDomesticCarrierCodes(value: String): PhoneNumber

    /*
     * 清除 PreferredDomesticCarrierCodes
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clearPreferredDomesticCarrierCodes(): PhoneNumber

    /*
     * 清除所有内容
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func clear(): PhoneNumber

    /*
     * 合并两个 PhoneNumber 对象
     *
     * 参数 other - PhoneNumber 类型数据
     *
     * 返回值是 PhoneNumber 类型
     *
     */
    public func mergeFrom(other: PhoneNumber): PhoneNumber

    /*
     * 判断两个 PhoneNumber 对象是否相同
     *
     * 参数 other - PhoneNumber 类型数据
     *
     * 返回值是 Bool 类型
     *
     */
    public func exactlySameAs(other: PhoneNumber): Bool

    /*
     * 转成 String 字符串
     *
     * 返回值是 String 类型
     *
     */
    public func toString(): String
```

#### enum CountryCodeSource

```cangjie
    | FROM_NUMBER_WITH_PLUS_SIGN
    | FROM_NUMBER_WITH_IDD
    | FROM_NUMBER_WITHOUT_PLUS_SIGN
    | FROM_DEFAULT_COUNTRY
    | UNSPECIFIED

    /*
     * 转成 String 字符串
     *
     * 返回值是 String 类型
     *
     */
    public func toString()
```

#### class PhoneNumberMatch

```cangjie

    /**
    * PhoneNumberMatch 的有参构造器
    *
    * 参数 start - Int64 类型数据
    * 参数 rawString - String 类型数据
    * 参数 number - PhoneNumber 类对象
    *
    */
    public init(start: Int64, rawString: String, number: PhoneNumber)

    /**
    * 获取电话号码
    *
    * 返回值是 PhoneNumber 类型
    */
    public func getNumber(): PhoneNumber

    /**
    * 获取起始位置
    *
    * 返回值是 Int64 类型
    */
    public func getStart(): Int64

    /**
    * 获取结束位置
    *
    * 返回值是 Int64 类型
    */
    public func getEnd(): Int64

    /**
    * 获取 RawString
    *
    * 返回值是 String 类型
    */
    public func getRawString(): String

    /**
    * 转成字符串
    *
    * 返回值是 String 类型
    */
    public func toString(): String
```

#### class PhoneNumberUtil

```cangjie

    /**
    * normalizeDigitsOnly 方法
    *
    * 参数 number - String 类型数据
    *
    * 返回值是 String 类型
    */
    public static func normalizeDigitsOnly(number: String): String

    /**
    * 获取 PhoneNumberUtil 实例方法
    *
    * 返回值是 Option<PhoneNumberUtil> 类型
    */
    public static func getInstance(): Option<PhoneNumberUtil>

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

    /**
    * 创建实例方法
    *
    * 参数 metadataLoader - 传入的元数据加载器
    *
    * 返回值是 Option<PhoneNumberUtil> 类型
    */
    public static func createInstance(metadataLoader: MetadataLoader): Option<PhoneNumberUtil>

    /**
    * 创建实例方法
    *
    * 参数 metadataSource - 传入的元数据源
    *
    * 返回值是 Option<PhoneNumberUtil> 类型
    */
    public static func createInstance(metadataSource: MetadataSource): Option<PhoneNumberUtil>

    /**
    * 获取 RegionCodeForCountryCode
    *
    * 参数 countryCallingCode - Int32 类型数据
    *
    * 返回值是 String 类型
    */
    public open func getRegionCodeForCountryCode(countryCallingCode: Int32): String

    /**
    * buildNationalNumberForParsing 方法
    *
    * 参数 numberToParse - String 类型数据
    * 参数 nationalNumber - StringBuilder 类型数据
    *
    */
    public func buildNationalNumberForParsing(numberToParse: String, nationalNumber: StringBuilder): Unit

    /**
    * matchCountryCodeSource 方法
    *
    * 参数 countryCodeSource - CountryCodeSource 类对象
    *
    * 返回值是 String 类型
    */
    public static func matchCountryCodeSource(countryCodeSource: CountryCodeSource): String

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

    /**
    * 通过枚举类型和自定义的PhonemetadataNumberFormat格式化电话号码，并返回.
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得. 
    * @param numberFormat of PhoneNumberFormat, 枚举类型，包含4种格式化的类型，E164, INTERNATIONAL, NATIONAL, RFC3966.
    * @param userDefinedFormats of ArrayList<PhonemetadataNumberFormat> PhonemetadataNumberFormat类型需要setPattern和setFormat, 以集合中第一个正常匹配的为准.
    *
    * @return Type of String, 返回格式化后的电话号码.
    */
    public open func formatByPattern(number: PhoneNumber, numberFormat: PhoneNumberFormat, userDefinedFormats: ArrayList<PhonemetadataNumberFormat>): String

    /**
    * 当getNumberFormatList或getIntlNumberFormatList获得的NumberFormat对象中的满足一定条件后
    * 会带数据如的运营商号码进行格式化
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得.
    * @param carrierCode of String, 运营商号码
    *
    * @return Type of String, 返回格式化后的电话号码.
    */
    public open func formatNationalNumberWithCarrierCode(number: PhoneNumber, carrierCode: String): String

    /**
    * 和formatNationalNumberWithCarrierCode不同的是，此方法会优先考虑setPreferredDomesticCarrierCode成员的值，进行格式化.
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
    * @param fallbackCarrierCode of String, 运营商号码
    *
    * @return Type of String, 返回格式化后的电话号码.
    */
    public open func formatNationalNumberWithPreferredCarrierCode(number: PhoneNumber, fallbackCarrierCode: String): String

    /**
    * 根据呼叫来源格式化
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
    * @param regionCallingFrom of String, 呼叫来源， 支持US, CN
    * @param withFormatting of Bool
    *
    * @return Type of String
    */

    public open func formatNumberForMobileDialing(number: PhoneNumber, regionCallingFrom: String, withFormatting: Bool): String
    public open func formatOutOfCountryCallingNumber(number: PhoneNumber, regionCallingFrom: String): String

    /**
    * 根据根据呼叫来源和setRawInput格式化
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
    * @param regionCallingFrom of String, 呼叫来源， 支持US, CN
    *
    * @return Type of String
    */
    public open func formatOutOfCountryKeepingAlphaChars(number: PhoneNumber, regionCallingFrom: String): String

    /**
    * 获得即时格式化对象
    *
    * @param regionCode of String, 地区码, 支持CN,US
    *
    * @return Type of AsYouTypeFormatter
    */
    public func getAsYouTypeFormatter(regionCode: String): AsYouTypeFormatter

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

    /**
    * 当 RawInput 为 true 时，解析电话号码并返回
    *
    * @param numberToParse 传入将要被解析的电话号码
    * @param defaultRegion String 类型字符串
    *
    * @return 返回解析后的电话号码
    */
    public open func parseAndKeepRawInput(numberToParse: String, defaultRegion: String): PhoneNumber

    /**
    * 数字查找功能，根据输入的文本信息查找电话号码
    *
    * @param text 传入的文本信息
    * @param defaultRegion String 类型字符串
    *
    * @return 返回 PhoneNumberMatch 类型的迭代器
    */
    public func findNumbers(text: String, defaultRegion: String): Iterable<PhoneNumberMatch>

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
    * @param PhoneNumberType of PhoneNumberType 号码类型,枚举类型PhoneNumberType分为12种类型, 具体参考PhoneNumberType类型。
    *
    * @return Type of Option<PhoneNumber>
    * @since 0.35.6
    */
    public func getExampleNumberForType (regionCode: String, PhoneNumberType: PhoneNumberType): Option<PhoneNumber>

    /**
    * 判断两个 MatchType 是否相等
    *
    * @param that 传入的另外一个 MatchType
    *
    * @return 返回两个 MatchType 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func == (that: MatchType): Bool

    /**
    * 判断两个 MatchType 是否不相等
    *
    * @param that 传入的另外一个 MatchType
    *
    * @return 返回两个 MatchType 是否不相等，若相等，返回 true，反之，返回 false
    */
    public operator func != (that: MatchType): Bool

    /**
    * 返回字符串
    *
    * @return 返回字符串
    */
    public func toString(): String
```

#### class AsYouTypeFormatter

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

#### enum PhoneNumberFormat

```cangjie
    | E164
    | INTERNATIONAL
    | NATIONAL
    | RFC3966

    /**
    * 判断两个 PhoneNumberFormat 是否相等
    *
    * @param that 传入的另外一个 PhoneNumberFormat
    *
    * @return 返回两个 PhoneNumberFormat 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func == (that: PhoneNumberFormat): Bool

    /**
    * 判断两个 PhoneNumberFormat 是否不相等
    *
    * @param that 传入的另外一个 PhoneNumberFormat
    *
    * @return 返回两个 PhoneNumberFormat 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func != (that: PhoneNumberFormat): Bool

    /**
    * 转成字符串
    *
    * @return 返回 String 类型
    */
    public func toString(): String
```

#### enum State

```cangjie
    | NOT_READY
    | READY
    | DONE

    /**
    * 判断两个 State 是否相等
    *
    * @param that 传入的另外一个 State
    *
    * @return 返回两个 State 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func == (that: State): Bool

    /**
    * 判断两个 State 是否不相等
    *
    * @param that 传入的另外一个 State
    *
    * @return 返回两个 State 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func != (that: State): Bool

    /**
    * 转成字符串
    *
    * @return 返回 String 类型
    */
    public func toString(): String
```
#### enum PhoneNumberType

```cangjie
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

    /**
    * 判断两个 PhoneNumberType 是否相等
    *
    * @param that 传入的另外一个 PhoneNumberType
    *
    * @return 返回两个 PhoneNumberType 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func == (that: PhoneNumberType): Bool

    /**
    * 判断两个 PhoneNumberType 是否不相等
    *
    * @param that 传入的另外一个 PhoneNumberType
    *
    * @return 返回两个 PhoneNumberType 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func != (that: PhoneNumberType): Bool
```

#### class MatchType

```cangjie
    | NOT_A_NUMBER
    | NO_MATCH
    | SHORT_NSN_MATCH
    | NSN_MATCH
    | EXACT_MATCH
```

#### class ValidationResult

```cangjie
    | IS_POSSIBLE
    | IS_POSSIBLE_LOCAL_ONLY
    | INVALID_COUNTRY_CODE
    | TOO_SHORT
    | INVALID_LENGTH
    | TOO_LONG

    /**
    * 判断两个 ValidationResult 是否相等
    *
    * @param that 传入的另外一个 ValidationResult
    *
    * @return 返回两个 ValidationResult 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func == (that: ValidationResult): Bool

    /**
    * 判断两个 ValidationResult 是否不相等
    *
    * @param that 传入的另外一个 ValidationResult
    *
    * @return 返回两个 ValidationResult 是否相等，若相等，返回 true，反之，返回 false
    */
    public operator func != (that: ValidationResult): Bool

    /**
    * 转成字符串
    *
    * @return 返回 String 类型
    */
    public func toString(): String
```
