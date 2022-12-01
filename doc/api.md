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
    1201转测 public init()

    /*
     * 判断是否含有模式匹配函数
     *
     * 返回是否含有模式匹配函数，若含有，返回 ture；否则，返回 false
     */
    1201转测 public func hasPatternFunc(): Bool

    /*
     * 从对象中获取模式匹配
     *
     * 返回 String 类型的字符串
     */
    1201转测 public func getPattern(): String

    /*
     * 设置模式匹配函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有匹配模式的 PhonemetadataNumberFormat 装配类对象
     */
    1201转测 public func setPattern(value: String): PhonemetadataNumberFormat

    /*
     * 判断是否含有格式化函数
     *
     * 返回是否含有格式化函数，若含有，返回 ture；否则，返回 false
     */
    1201转测 public func hasFormatFunc(): Bool

    /*
     * 从对象中获取格式化函数
     *
     * 返回 String 类型的字符串
     */
    1201转测 public func getFormat(): String

    /*
     * 设置格式化函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有格式化函数的 PhonemetadataNumberFormat 装配类对象
     */
    1201转测 public func setFormat(value: String): PhonemetadataNumberFormat

    /*
     * 获取数字主导匹配模式集合
     *
     * 返回数字主导匹配模式集合
     */
    1201转测 public func leadingDigitPatterns(): ArrayList<String>

    /*
     * 数字主导匹配模式集合大小
     *
     * 返回 Int32 类型数据
     */
    1201转测 public func leadingDigitsPatternSize(): Int32

    /*
     * 获取数字主导匹配模式集合大小
     *
     * 返回 Int32 类型数据
     */
    1201转测 public func getLeadingDigitsPatternCount(): Int32

    /*
     * 获取数字主导匹配模式集合中的值
     *
     * 参数 index - Int32 类型数据
     *
     * 返回 option 类型，表示集合中的值
     */
    1201转测 public func getLeadingDigitsPatternCount(index: Int32): Option<String>

    /*
     * 获取数字主导匹配模式集合中的值
     *
     * 参数 index - Int32 类型数据
     *
     * 返回 option<String> 类型，表示集合中的值
     */
    1201转测 public func getLeadingDigitsPatternCount(index: Int32): Option<String>

    /*
     * 判断是否含有格式化规则的国家前缀函数
     *
     *
     * 返回是否含有格式化规则的国家前缀函数，若含有，则为 true；反之，为 false
     */
    1201转测 public func hasNationalPrefixFormattingRuleFunc(): Bool

    /*
     * 获取格式化规则的国家前缀函数
     *
     * 返回 String 类型的字符串
     */
    1201转测 public func getNationalPrefixFormattingRule(): String

    /*
     * 设置格式化规则的国家前缀函数
     *
     * 参数 value - String 类型的字符串
     *
     * 返回含有格式化规则的国家前缀函数的 PhonemetadataNumberFormat 装配类对象
     */
    1201转测 public func setNationalPrefixFormattingRule(value: String): PhonemetadataNumberFormat

    /*
     * 清除格式化规则的国家前缀函数
     *
     * 返回清除格式化规则的国家前缀函数后的 PhonemetadataNumberFormat 装配类对象
     */
    1201转测 public func clearNationalPrefixFormattingRule(): PhonemetadataNumberFormat

    /*
     * 判断当格式化时是否含有国家前缀可选项函数
     *
     * 返回格式化时是否含有国家前缀可选项函数，若含有，则为 true；反之，为 false
     */
    1201转测 public func hasNationalPrefixOptionalWhenFormattingFunc(): Bool

    /*
     * 获取格式化国家前缀可选项函数
     *
     * 返回格式化时是否含有国家前缀可选项函数，若含有，则为 true；反之，为 false
     */
    1201转测 public func getNationalPrefixOptionalWhenFormatting(): Bool

    /*
     * 设置格式化时国家前缀可选项函数
     *
     * 参数 value - Bool 类型参数
     *
     * 返回含有格式化时国家前缀可选项函数的 PhonemetadataNumberFormat 装配类对象
     */
    1201转测 public func setNationalPrefixOptionalWhenFormatting(value: Bool): PhonemetadataNumberFormat

    /*
     * 判断是否含有与运营商相关的格式化规则函数
     *
     * 返回是否含有与运营商相关的格式化规则函数，若含有，则为 true；反之，为 false
     */
    1201转测 public func hasDomesticCarrierCodeFormattingRuleFunc(): Bool

    /*
     * 获取与运营商相关的格式化规则函数
     *
     * 返回 String 类型的字符串
     */
    1201转测 public func getDomesticCarrierCodeFormattingRule(): String

    /*
     * 设置与运营商相关的格式化规则函数
     *
     * 参数 value - String 类型参数
     *
     * 返回含有与运营商相关的格式化规则函数的 PhonemetadataNumberFormat 装配类对象
     */
    1201转测 public func setDomesticCarrierCodeFormattingRule(value: String): PhonemetadataNumberFormat

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
    1201转测 public operator func ==(rhs: PhonemetadataNumberFormat): Bool

    /*
     * 判断两个对象是否不相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    1201转测 public operator func !=(rhs: PhonemetadataNumberFormat): Bool
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
    getPossibleLengthLocalOnlyList(): ArrayList<Int32>

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
    public func hasInternationalPrefixFunc(): Bool
    public func getInternationalPrefix()
    public open func setInternationalPrefix(value: String): PhonemetadataPhoneMetadata
    public func hasPreferredInternationalPrefixFunc(): Bool
    public func getPreferredInternationalPrefix(): String
    public func setPreferredInternationalPrefix(value: String): PhonemetadataPhoneMetadata
    public func clearPreferredInternationalPrefix(): PhonemetadataPhoneMetadata
    public func hasNationalPrefixFunc(): Bool
    public func getNationalPrefix(): String
    public func setNationalPrefix(value: String): PhonemetadataPhoneMetadata
    public func clearNationalPrefix(): PhonemetadataPhoneMetadata
    public func hasPreferredExtnPrefixFunc(): Bool
    public func getPreferredExtnPrefix(): String
    public func setPreferredExtnPrefix(value: String): PhonemetadataPhoneMetadata
    public func clearPreferredExtnPrefix(): PhonemetadataPhoneMetadata
    public func hasNationalPrefixForParsingFunc(): Bool
    public func getNationalPrefixForParsing(): String
    public func setNationalPrefixForParsing(value: String): PhonemetadataPhoneMetadata
    public func hasNationalPrefixTransformRuleFunc(): Bool
    public func getNationalPrefixTransformRule(): String
    public func setNationalPrefixTransformRule(value: String): PhonemetadataPhoneMetadata
    public func clearNationalPrefixTransformRule(): PhonemetadataPhoneMetadata
    public func hasSameMobileAndFixedLinePatternFunc(): Bool
    public func getSameMobileAndFixedLinePattern(): Bool
    public func setSameMobileAndFixedLinePattern(value: Bool): PhonemetadataPhoneMetadata
    public func clearSameMobileAndFixedLinePattern(): PhonemetadataPhoneMetadata
    public func numberFormats(): ArrayList<PhonemetadataNumberFormat>
    public func getNumberFormatList(): ArrayList<PhonemetadataNumberFormat>
    public func numberFormatSize(): Int32
    public func getNumberFormatCount(): Int32
    public func getNumberFormat(index: Int32): Option<PhonemetadataNumberFormat>
    public func addNumberFormat(value: Option<PhonemetadataNumberFormat>): PhonemetadataPhoneMetadata
    public func intlNumberFormats(): ArrayList<PhonemetadataNumberFormat>
    public func getIntlNumberFormatList(): ArrayList<PhonemetadataNumberFormat>
    public func intlNumberFormatSize(): Int32
    public func getIntlNumberFormatCount(): Int32
    public func getIntlNumberFormat(index: Int32): Option<PhonemetadataNumberFormat>
    public func addIntlNumberFormat(value: Option<PhonemetadataNumberFormat>): PhonemetadataPhoneMetadata
    public func clearIntlNumberFormat(): PhonemetadataPhoneMetadata
    public func hasMainCountryForCodeFunc(): Bool
    public func isMainCountryForCode(): Bool
    public func getMainCountryForCode(): Bool
    public func setMainCountryForCode(value: Bool): PhonemetadataPhoneMetadata
    public func clearMainCountryForCode(): PhonemetadataPhoneMetadata
    public func hasLeadingDigitsFunc(): Bool
    public func getLeadingDigits(): String
    public func setLeadingDigits(value: String): PhonemetadataPhoneMetadata
    public func hasLeadingZeroPossibleFunc(): Bool
    public func isLeadingZeroPossible(): Bool
    public func setLeadingZeroPossible(value: Bool): PhonemetadataPhoneMetadata
    public func clearLeadingZeroPossible(): PhonemetadataPhoneMetadata
    public func hasMobileNumberPortableRegionFunc(): Bool
    public func isMobileNumberPortableRegion(): Bool
    public func getMobileNumberPortableRegion(): Bool
    public func setMobileNumberPortableRegion(value: Bool): PhonemetadataPhoneMetadata
    public func clearMobileNumberPortableRegion(): PhonemetadataPhoneMetadata
    public func readExternal(objectInput: Iterator<String>): Unit
```

#### class PhoneMetadataBuilder

```cangjie
public func build(): PhonemetadataPhoneMetadata
public func setId(value: String): PhoneMetadataBuilder
public func setInternationalPrefix(value: String): PhoneMetadataBuilder
```

#### class PhonemetadataPhoneMetadataCollection

```cangjie
public func getMetadataList(): ArrayList<PhonemetadataPhoneMetadata>
public func getMetadataCount(): Int32
public func addMetadata(value: Option<PhonemetadataPhoneMetadata>): PhonemetadataPhoneMetadataCollection
public func readExternal(objectInput: ArrayList<String>): Unit
public func clear(): PhonemetadataPhoneMetadataCollection
```

#### class PhoneMetadataCollectionBuilder

```cangjie
public func build(): PhonemetadataPhoneMetadataCollection
```

#### class PhoneNumber

```cangjie
1124转测 public init()
1124转测 public func hasCountryCodes(): Bool
1124转测 public func getCountryCodes(): Int64
1124转测 public func setCountryCodes(value: Int64): PhoneNumber
1124转测 public func clearCountryCodes(): PhoneNumber
1124转测 public func hasNationalNumbers(): Bool
1124转测 public func getNationalNumbers(): Int64
1124转测 public func setNationalNumbers(value: Int64): PhoneNumber
1124转测 public func clearNationalNumbers(): PhoneNumber
1124转测 public func hasExtensions(): Bool
1124转测 public func getExtensions(): String
1124转测 public func setExtensions(value: String): PhoneNumber
1124转测 public func clearExtensions(): PhoneNumber
1124转测 public func hasItalianLeadingZeros(): Bool
1124转测 public func isItalianLeadingZeros(): Bool
1124转测 public func setItalianLeadingZeros(value: Bool): PhoneNumber
1124转测 public func clearItalianLeadingZeros(): PhoneNumber
1124转测 public func hasNumbersOfLeadingZeros(): Bool
1124转测 public func getNumbersOfLeadingZeros(): Int64
1124转测 public func setNumberOfLeadingZeros(value: Int64): PhoneNumber
1124转测 public func clearNumberOfLeadingZeros(): PhoneNumber
1124转测 public func hasRawInputs(): Bool
1124转测 public func getRawInputs(): String
1124转测 public func setRawInputs(value: String): PhoneNumber
1124转测 public func clearRawInputs(): PhoneNumber
1124转测 public func hasCountryCodeSources(): Bool
1124转测 public func getCountryCodeSources(): CountryCodeSource
1124转测 public func setCountryCodeSources(value: CountryCodeSource): PhoneNumber
1124转测 public func clearCountryCodeSources(): PhoneNumber
1124转测 public func hasPreferredDomesticCarrierCodes(): Bool
1124转测 public func getPreferredDomesticCarrierCodes(): String
1124转测 public func setPreferredDomesticCarrierCodes(value: String): PhoneNumber
1124转测 public func clearPreferredDomesticCarrierCodes(): PhoneNumber
1124转测 public func clear(): PhoneNumber
1124转测 public func mergeFrom(other: PhoneNumber): PhoneNumber
1124转测 public func exactlySameAs(other: PhoneNumber): Bool
1124转测 public func toString(): String
```

#### enum CountryCodeSource

```cangjie
| FROM_NUMBER_WITH_PLUS_SIGN
| FROM_NUMBER_WITH_IDD
| FROM_NUMBER_WITHOUT_PLUS_SIGN
| FROM_DEFAULT_COUNTRY
| UNSPECIFIED
1124转测 public func toString()
```

#### class PhoneNumberMatch

```cangjie
public init(start: Int64, rawString: String, number: PhoneNumber)
public func getNumber(): PhoneNumber
public func getStart(): Int64
public func getEnd(): Int64
public func getRawString(): String
public func toString(): String
```

#### class PhoneNumberUtil

```cangjie
public static func normalizeDigitsOnly(number: String): String
1124转测 public static func getInstance(): Option<PhoneNumberUtil>
1124转测 public open func parse(numberToParse: String, defaultRegion: String): PhoneNumber
1124转测 public open func parse(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit
public static func createInstance(metadataLoader: MetadataLoader): Option<PhoneNumberUtil>
public static func createInstance(metadataSource: MetadataSource): Option<PhoneNumberUtil>
public open func getRegionCodeForCountryCode(countryCallingCode: Int32): String
public func buildNationalNumberForParsing(numberToParse: String, nationalNumber: StringBuilder): Unit
public static func matchCountryCodeSource(countryCodeSource: CountryCodeSource): String
/**
 * 通过枚举类型格式化电话号码，并返回.
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
 * @param numberFormat of PhoneNumberFormat, 枚举类型，包含4种格式化的类型，E164, INTERNATIONAL, NATIONAL, RFC3966.
 *
 * @return Type of String 返回格式化后的电话号码.
 */
1201转测 public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat): String
/**
 * 通过枚举类型格式化电话号码，并返回.
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
 * @param numberFormat of PhoneNumberFormat 枚举类型，包含4种格式化的类型，E164, INTERNATIONAL, NATIONAL, RFC3966.
 * @param formattedNumber of StringBuilder 格式化的内容存放容器.
 *
 * @return Type of Unit
 */
1201转测 public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit
/**
 * 通过枚举类型和自定义的PhonemetadataNumberFormat格式化电话号码，并返回.
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得. 
 * @param numberFormat of PhoneNumberFormat, 枚举类型，包含4种格式化的类型，E164, INTERNATIONAL, NATIONAL, RFC3966.
 * @param userDefinedFormats of ArrayList<PhonemetadataNumberFormat> PhonemetadataNumberFormat类型需要setPattern和setFormat, 以集合中第一个正常匹配的为准.
 *
 * @return Type of String, 返回格式化后的电话号码.
 */
1201转测 public open func formatByPattern(number: PhoneNumber, numberFormat: PhoneNumberFormat, userDefinedFormats: ArrayList<PhonemetadataNumberFormat>): String
/**
 * 当getNumberFormatList或getIntlNumberFormatList获得的NumberFormat对象中的满足一定条件后
 * 会带数据如的运营商号码进行格式化
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得.
 * @param carrierCode of String, 运营商号码
 *
 * @return Type of String, 返回格式化后的电话号码.
 */
1201转测 public open func formatNationalNumberWithCarrierCode(number: PhoneNumber, carrierCode: String): String
/**
 * 和formatNationalNumberWithCarrierCode不同的是，此方法会优先考虑setPreferredDomesticCarrierCode成员的值，进行格式化.
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
 * @param fallbackCarrierCode of String, 运营商号码
 *
 * @return Type of String, 返回格式化后的电话号码.
 */
1201转测 public open func formatNationalNumberWithPreferredCarrierCode(number: PhoneNumber, fallbackCarrierCode: String): String
/**
 * 根据呼叫来源格式化
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
 * @param regionCallingFrom of String, 呼叫来源， 支持US, CN
 * @param withFormatting of Bool
 *
 * @return Type of String
 */
1201转测 public open func formatNumberForMobileDialing(number: PhoneNumber, regionCallingFrom: String, withFormatting: Bool): String
1201转测 public open func formatOutOfCountryCallingNumber(number: PhoneNumber, regionCallingFrom: String): String
/**
 * 根据根据呼叫来源和setRawInput格式化
 *
 * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
 * @param regionCallingFrom of String, 呼叫来源， 支持US, CN
 *
 * @return Type of String
 */
1201转测 public open func formatOutOfCountryKeepingAlphaChars(number: PhoneNumber, regionCallingFrom: String): String
```

#### enum PhoneNumberFormat

```cangjie
| E164
| INTERNATIONAL
| NATIONAL
| RFC3966
1201转测 public operator func == (that: PhoneNumberFormat): Bool
1201转测 public operator func != (that: PhoneNumberFormat): Bool
1201转测 public func toString(): String    
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
public operator func ==(that: PhoneNumberType): Bool
public operator func !=(that: PhoneNumberType): Bool
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
public operator func == (that: ValidationResult): Bool
public operator func != (that: ValidationResult): Bool
public func toString(): String
```
