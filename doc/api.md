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
     * 获取数字主导匹配模式集合中的值
     *
     * 参数 index - Int32 类型数据
     *
     * 返回 option 类型，表示集合中的值
     */
    public func getLeadingDigitsPatternCount(index: Int32): Option<String>

    /*
     * 获取数字主导匹配模式集合中的值
     *
     * 参数 index - Int32 类型数据
     *
     * 返回 option<String> 类型，表示集合中的值
     */
    public func getLeadingDigitsPatternCount(index: Int32): Option<String>

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
