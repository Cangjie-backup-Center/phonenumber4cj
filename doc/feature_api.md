## phonenumber 库

### 介绍
该库主要是一个解析、格式化和验证国际电话号码的通用 Java、C++ 和 JavaScript 库。它能够对电话号码进行解析、格式化、验证等操作，也能够快速查询电话号码及在文本中查找电话号码等功能

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

##### 1.1.2 内部接口

class CountryCodeToRegionCodeMap

此类是从国家代码到地区代码的映射类，用国家代码表示国家/地区

```cangjie
    /*
     * 从 Hashmap 中根据国家代码获取国家/地区
     *
     * 返回值 HashMap<Int32, ArrayList<String>> - 返回所有的国家代码到地区代码的映射类集合
     */
    public static func getCountryCodeToRegionCodeMap(): HashMap<Int32, ArrayList<String>>
```

class BlockingMetadataBootstrappingGuard

```cangjie

    /**
    * BlockingMetadataBootstrappingGuard 的有参构造
    *
    * 参数 metadataLoader - 元数据加载器
    * 参数 metadataParser - 元数据解析器
    * 参数 metadataContainer - 承载元数据的容器
    *
    */
    public init(metadataLoader: MetadataLoader, metadataParser: MetadataParser, metadataContainer: T)

    /**
    * 从文件中读取元数据
    *
    * 参数 phoneMetadataFile - 元数据文件
    *
    * 返回值是一个泛型 T
    *
    */
    public func getOrBootstrap(phoneMetadataFile: ArrayList<String>): T
```

class GeoEntityUtility

```cangjie

    /**
    * 判断是否是 geo 实体
    *
    * 参数 regionCode - String 类型数据
    *
    * 返回值是 Bool 类型
    */
    public static func isGeoEntity(regionCode: String): Bool

    /**
    * 判断是否是 geo 实体
    *
    * 参数 regionCode - Int32 类型数据
    *
    * 返回值是 Bool 类型
    */
    public static func isGeoEntity(regionCode: Int32): Bool
```

class ClassPathResourceMetadataLoader

```cangjie

    /**
    * 
    * ClassPathResourceMetadataLoader 的无参构造
    */
    public init()

    /**
    * 加载元数据
    *
    * 参数 metadataFileName - 元数据文件名
    *
    * 返回值是一个集合
    *
    */
    public func loadMetadata(metadataFileName: ArrayList<String>): ArrayList<String>
```

class CompositeMetadataContainer

```cangjie

    /**
    * 
    * CompositeMetadataContainer 的无参构造
    */
    public init()

    /**
    * 装配元数据
    *
    * 参数 phoneMetadata - PhonemetadataPhoneMetadata 装配类
    *
    */
    public func accept(phoneMetadata: PhonemetadataPhoneMetadata): Unit
```

class DefaultMetadataDependenciesProvider

```cangjie

    /**
    * 
    * 获取 DefaultMetadataDependenciesProvider 实例
    *
    * 返回值是 DefaultMetadataDependenciesProvider 类对象
    *
    */
    public static func getInstance(): DefaultMetadataDependenciesProvider

    /**
    * 获取元数据解析器
    *
    * 返回值是 MetadataParser 类对象
    *
    */
    public func getMetadataParser(): MetadataParser

    /**
    * 获取元数据加载器
    *
    * 返回值是 getMetadataLoader 类对象
    *
    */
    public func getMetadataLoader(): getMetadataLoader

    /**
    * 获取 getPhoneNumberMetadataFileNameProvider
    *
    * 返回值是 PhoneMetadataFileNameProvider 类对象
    *
    */
    public func getPhoneNumberMetadataFileNameProvider(): PhoneMetadataFileNameProvider

    /**
    * 获取 getPhoneNumberMetadataSource
    *
    * 返回值是 MetadataSource 类对象
    *
    */
    public func getPhoneNumberMetadataSource(): MetadataSource

    /**
    * 获取 getShortNumberMetadataFileNameProvider
    *
    * 返回值是 PhoneMetadataFileNameProvider 类对象
    *
    */
    public func getShortNumberMetadataFileNameProvider(): PhoneMetadataFileNameProvider

    /**
    * 获取 getShortNumberMetadataSource
    *
    * 返回值是 MetadataSource 类对象
    *
    */
    public func getShortNumberMetadataSource(): RegionMetadataSource

    /**
    * 获取 getAlternateFormatsMetadataFileNameProvider
    *
    * 返回值是 PhoneMetadataFileNameProvider 类对象
    *
    */
    public func getAlternateFormatsMetadataFileNameProvider(): PhoneMetadataFileNameProvider

    /**
    * 获取 getAlternateFormatsMetadataSource
    *
    * 返回值是 FormattingMetadataSource 类对象
    *
    */
    public func getAlternateFormatsMetadataSource(): FormattingMetadataSource

    /**
    * 获取 getCarrierDataDirectory
    *
    * 返回值是 String 字符串
    *
    */
    public func getCarrierDataDirectory(): String

    /**
    * 获取 getGeocodingDataDirectory
    *
    * 返回值是 String 字符串
    *
    */
    public func getGeocodingDataDirectory(): String
```

class FormattingMetadataSourceImpl

```cangjie

    /**
    * 
    * FormattingMetadataSourceImpl 的有参构造
    *
    * 参数 phoneMetadataFileNameProvider - PhoneMetadataFileNameProvider 类对象
    * 参数 bootstrappingGuard - MetadataBootstrappingGuard 类对象
    *
    */
    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, 
        bootstrappingGuard: MetadataBootstrappingGuard<MapBackedMetadataContainer<Int32>>)

    /**
    * 
    * FormattingMetadataSourceImpl 的有参构造
    *
    * 参数 phoneMetadataFileNameProvider - PhoneMetadataFileNameProvider 类对象
    * 参数 metadataLoader - MetadataLoader 类对象
    * 参数 metadataParser - MetadataParser 类对象
    *
    */
    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, metadataLoader: MetadataLoader, 
        metadataParser: MetadataParser)

    /**
    * getFormattingMetadataForCountryCallingCode 方法
    *
    * 参数 countryCallingCode - Int32 类型数据
    * 
    * 返回值是 PhonemetadataPhoneMetadata 类对象
    */
    public func getFormattingMetadataForCountryCallingCode(countryCallingCode: Int32): PhonemetadataPhoneMetadata
```

class MapBackedMetadataContainer

```cangjie

    /**
    * 
    * FormattingMetadataSourceImpl 的无参构造
    * 
    */
    public init()

    /**
    * 
    * 装配元数据内容
    *
    * 参数 phonemetadataPhoneMetadata - phonemetadataPhoneMetadata 类对象
    *
    */
    public func accept(phonemetadataPhoneMetadata: PhonemetadataPhoneMetadata): Unit
```

class KeyProviderImpString

```cangjie

    /**
    * 
    * 从元数据中获取 key
    *
    * 参数 phoneMetadata - PhonemetadataPhoneMetadata 类对象
    *
    * 返回值是 String 字符串
    *
    */
    public func getKeyOf(phoneMetadata: PhonemetadataPhoneMetadata): String
```

class KeyProviderImpInt32

```cangjie

    /**
    * 
    * 从元数据中获取 key
    *
    * 参数 phoneMetadata - PhonemetadataPhoneMetadata 类对象
    *
    * 返回值是 Int32 类型
    *
    */
    public func getKeyOf(phoneMetadata: PhonemetadataPhoneMetadata): Int32
```

class MetadataParser

```cangjie

    /**
    * 
    * 创建元数据解析器
    *
    * 返回值是 MetadataParser 解析器
    *
    */
    public static func newLenientParser(): MetadataParser

    /**
    * 
    * 创建元数据解析器
    *
    * 返回值是 MetadataParser 解析器
    *
    */
    public static func newStrictParser(): MetadataParser

    /**
    * 
    * 解析元数据
    *
    * 参数 source - 传入的 List 集合
    * 如果从元数据集合列表中获取的数据为空，抛出 Exception 异常
    *  
    * 返回值是 Collection 集合
    *
    */
    public func parse(source: ArrayList<String>): Collection<PhonemetadataPhoneMetadata>
```

class MetadataSourceImpl

```cangjie

    /**
    * 
    * MetadataSourceImpl 的有参构造
    *
    * 参数 phoneMetadataFileNameProvider -  PhoneMetadataFileNameProvider 类对象
    * 参数 bootstrappingGuard - MetadataBootstrappingGuard 类对象
    *
    */
    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, 
        bootstrappingGuard: MetadataBootstrappingGuard<CompositeMetadataContainer>)

    /**
    * 
    * MetadataSourceImpl 的有参构造
    *
    * 参数 phoneMetadataFileNameProvider -  PhoneMetadataFileNameProvider 类对象
    * 参数 metadataLoader - MetadataLoader 类对象
    * 参数 metadataParser - MetadataParser 类对象
    *
    */
    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, metadataLoader: MetadataLoader, 
        metadataParser: MetadataParser)

    /**
    * 
    * 从国家代码中获取元数据
    *
    * 参数 countryCallingCode - Int32 类型数据
    * 如果传入的国家代码得到的 geo 不是实体，抛出 IllegalArgumentException 异常
    * 
    * 返回值是 PhonemetadataPhoneMetadata 装配类对象
    *
    */
    public func getMetadataForNonGeographicalRegion(countryCallingCode: Int32): PhonemetadataPhoneMetadata

    /**
    * 
    * 从区域代码中获取元数据
    *
    * 参数 regionCode - String 类型数据
    * 如果传入的区域代码得到的 geo 不是实体，抛出 IllegalArgumentException 异常
    * 
    * 返回值是 PhonemetadataPhoneMetadata 装配类对象
    *
    */
    public func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata
```

class MultiFileModeFileNameProvider

```cangjie

    /**
    * 
    * MultiFileModeFileNameProvider 的有参构造
    *
    * 参数 phoneMetadataFileNameBase -  传入一个 HashMap 集合
    *
    */
    public init(phoneMetadataFileNameBase: HashMap<String, ArrayList<String>>)


    /**
    * 
    * 从 map 的 key 中获取值
    *
    * 参数 key - String 类型字符串
    * 如果传入的 key 为空，获取的 Option 为 None 时，抛出 IllegalArgumentException 异常
    * 
    * 返回值是 ArrayList 集合
    *
    */
    public func getFor(key: String): ArrayList<String>
```

class RegionMetadataSourceImpl

```cangjie

    /**
    * 
    * RegionMetadataSourceImpl 的有参构造
    *
    * 参数 phoneMetadataFileNameProvider -  PhoneMetadataFileNameProvider 类型
    * 参数 bootstrappingGuard - MetadataBootstrappingGuard 类型
    *
    */
    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, 
        bootstrappingGuard: MetadataBootstrappingGuard<MapBackedMetadataContainer<String>>)

    /**
    * 
    * RegionMetadataSourceImpl 的有参构造
    *
    * 参数 phoneMetadataFileNameProvider -  PhoneMetadataFileNameProvider 类型
    * 参数 metadataLoader - MetadataLoader 类型
    * 参数 metadataParser - MetadataParser 类型
    *
    */
    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, metadataLoader: MetadataLoader, 
        metadataParser: MetadataParser)

    /**
    * 
    * 从区域代码中获取元数据
    *
    * 参数 regionCode - String 类型字符串
    * 
    * 返回值是 PhonemetadataPhoneMetadata 类对象
    *
    */
    public func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata
```

class PhonemetadataNumberFormat

此类是电话号码元数据格式化信息装配类，它含有与格式化相关的一些信息

```cangjie
public open class PhonemetadataNumberFormat {

    /*
     * PhonemetadataNumberFormat 的无参构造器
     *
     */
    public init()

    /*
     * 创建一个 NumberFormatBuilder 类对象
     *
     */
    public static func newBuilder(): NumberFormatBuilder

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
     * 如果 value 为空，则抛出 IndexOutOfBoundsException 异常
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

class NumberFormatBuilder

此类是电话号码元数据信息装配类

```cangjie

    /*
     * NumberFormatBuilder 的无参构造器
     *
     */
    public init()

    /*
     * NumberFormatBuilder 的有参构造器
     *
     * 参数 out: PhonemetadataNumberFormat 类对象
     */
    public init(out: PhonemetadataNumberFormat)

    /*
     * 构建 PhonemetadataNumberFormat 类对象
     *
     */
    public func build(): PhonemetadataNumberFormat

    /*
     * 将另一个 PhonemetadataNumberFormat 类对象的属性合并
     *
     * 参数 other: PhonemetadataNumberFormat 类对象
     *
     * 返回 NumberFormatBuilder 类对象
     */
    public func mergeFrom(other: PhonemetadataNumberFormat): NumberFormatBuilder
```

class PhonemetadataPhoneNumberDesc

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
     * 获取长度
     *
     * 参数 index - Int32 类型的数据
     *
     * 返回 Int32 类型的数据
     */
    public func getPossibleLength(index: Int32): Option<Int32>

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

class PhoneNumberDescBuilder

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

class PhonemetadataPhoneMetadata

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
     * 设置 id
     *
     * 参数 value - String 类型字符串
     *
     * 返回值是 PhonemetadataPhoneMetadata 类对象
     */
    public func setId(value: String): PhonemetadataPhoneMetadata


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

    /*
     * 判断两个对象是否相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func ==(rhs: PhonemetadataPhoneMetadata): Bool

    /*
     * 判断两个对象是否不相等
     *
     * 参数 rhs - 传入的另一个对象
     *
     * 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func !=(rhs: PhonemetadataPhoneMetadata): Bool
```

class PhoneMetadataBuilder

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

class PhonemetadataPhoneMetadataCollection

```cangjie

    /*
     * 构造 PhoneMetadataBuilder 类对象
     *
     * 返回值是 PhoneMetadataBuilder 类型
     *
     */
    public static func newBuilder(): PhoneMetadataBuilder

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

class PhoneMetadataCollectionBuilder

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

class IllegalStateException

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

class MissingMetadataException

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

class NumberParseException

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

enum ErrorType

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

#### 1.2 电话号码解析
获取 phonenumberUtil 实例，调用parse解析电话号码

##### 1.2.1 主要接口

class PhoneNumberUtil

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

class PhoneNumber

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
     * 返回值是 Bool 类型
     *
     */
    public func getNationalNumbers(): Bool

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
     * hashcode 方法
     *
     * 返回值是 Int64 类型
     */
    public func hashCode(): Int64

    /*
     * equals 方法
     *
     * 参数 that - 传入一个 Object 类对象
     *
     * 返回值是 Bool 类型
     */
    public func equals(that: Object): Bool

    /*
     * 转成 String 字符串
     *
     * 返回值是 String 类型
     *
     */
    public func toString(): String
```

##### 1.2.1.1 示例

```cangjie
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

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

##### 1.2.2 内部接口

class PhoneNumber

```cangjie

    /*
     * 实现 Serializable 接口的序列化方法
     *
     * 返回值是一个 DataModel 对象
     *
     */
    public func serialize(): DataModel

    /*
     * 实现 Serializable 接口的反序列化方法
     *
     * 参数 dm - DataModel 类对象
     * 如果 dm 为空，则抛出 Exception 异常
     *
     * 返回值是一个 PhoneNumber 对象
     *
     */
    public static func deserialize(dm: DataModel): PhoneNumber
```

enum CountryCodeSource

```cangjie
    | FROM_NUMBER_WITH_PLUS_SIGN
    | FROM_NUMBER_WITH_IDD
    | FROM_NUMBER_WITHOUT_PLUS_SIGN
    | FROM_DEFAULT_COUNTRY
    | UNSPECIFIED

    /*
     * 判断两个枚举类型是否相等
     *
     * 参数 that - 传入的另一个错误信息枚举类型
     *
     * 返回两个枚举类型是否相等，若相等，返回 ture；否则，返回 false
     */
    public operator func == (that: CountryCodeSource): Bool

    /*
     * 判断两个枚举类型是否不相等
     *
     * 参数 that - 传入的另一个错误信息枚举类型
     *
     * 返回两个枚举类型是否不相等，若不相等，返回 ture；否则，返回 false
     */
    public operator func != (that: CountryCodeSource): Bool

    /*
     * 转成 String 字符串
     *
     * 返回值是 String 类型
     *
     */
    public func toString()
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
    * 如果传入的区域代码为空，抛出 IllegalArgumentException 异常
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
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("tel:253-0000;phone-context=127.0.0.1", "US")
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

class AsYouTypeFormatter

```cangjie
    /**
    * The Function is init constructor
    *
    * @param regionCode of String, 地区码, 支持CN,US
    */
    public init(regionCode: String)

    /**
    * 添加即时格式字符
    *
    * @param nextChar of Char, 即时格式化字符
    *
    * @return Type of String
    */
    public func inputDigit(nextChar: Char): String

    /**
    * 添加即时格式字符, 并记录位置
    *
    * @param nextChar of Char, 即时格式化字符
    *
    * @return Type of String
    */
    public func inputDigitAndRememberPosition(nextChar: Char): String

    /**
    * 获得记录字符从1开始的位置
    *
    * @return Type of Int32 若发生格式则为格式化后的位置, 调用是返回最近的inputDigitAndRememberPosition字符的位置.
    */
    public func getRememberedPosition(): Int32

    /**
    * 清除之前加入的即时格式化内容
    *
    * @return Type of Unit
    */
    public func clear (): Unit 
```

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


##### 2.2.1.1 示例

```cangjie
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.*

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
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import std.regex.*
import std.os.*

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

class PhonenumberUtil

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

enum PhoneNumberType

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

    /**
    * 转成字符串
    *
    * @return 返回 String 类型
    */
    public func toString(): String

    /**
    * hashcode 方法
    *
    * @return 返回 Int64 类型
    */
    public func hashCode(): Int64
```

##### 4.1.1.1 示例

```cangjie
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

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

##### 4.1.2 内部接口

class RegexBasedMatcher

```cangjie

    /**
    * 创建一个 MatcherApi 类对象
    *
    * 返回值是 MatcherApi 类型
    */
    public static func create(): MatcherApi

    /**
    * 匹配国家号码方法
    *
    * 参数 number - 传入的电话号码
    * 参数 numberDesc - PhonemetadataPhoneNumberDesc 类型
    * 参数 allowPrefixMatch - 是否允许前置匹配
    *
    * 返回值是 Bool 类型
    *
    */
    public func matchNationalNumber(number: String, numberDesc: PhonemetadataPhoneNumberDesc, allowPrefixMatch: Bool): Bool
```

class RegexCache

```cangjie

    /**
    * RegexCache 的无参构造
    *
    */
    public init()

    /**
    * getPatternForRegex 方法
    *
    * 参数 regex - 传入的正则表达式
    *
    * 返回值是一个正则类对象
    *
    */
    public open func getPatternForRegex(regex: String): Regex
```

class PhoneNumberUtil

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
    * normalizeDiallableCharsOnly 方法
    *
    * 参数 number - String 类型数据
    *
    * 返回值是 String 类型
    */
    public static func normalizeDiallableCharsOnly(number: String): String

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
    * 从区域中获取国家代码
    *
    * 参数 regionCode - String 类型数据
    *
    * 返回值是 Int32 类型
    */
    public func getCountryCodeForRegion(regionCode: String): Int32

    /**
    * 判断是否是 NANPA 国家
    *
    * 参数 regionCode - String 类型数据
    *
    * 返回值是 Bool 类型
    */
    public open func isNANPACountry(regionCode: String): Bool

    /**
    * buildNationalNumberForParsing 方法
    *
    * 参数 numberToParse - String 类型数据
    * 参数 nationalNumber - StringBuilder 类型数据
    *
    */
    public func buildNationalNumberForParsing(numberToParse: String, nationalNumber: StringBuilder): Unit

    /**
    * canBeInternationallyDialled 方法
    *
    * 参数 number - 传入一个 PhoneNumber 类对象
    * 
    * 返回值是 Bool 类型
    *
    */
    public open func canBeInternationallyDialled(number: PhoneNumber): Bool

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
    * 获取可签的电话号码
    *
    * @param number of PhoneNumber, 电话号类型，可以通过解析得到或构造获得
    *
    * @return Type of String
    */
    public open func getNationalSignificantNumber(number: PhoneNumber): String

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
    * 从电话号码中获取区域代码
    *
    * @param number of PhoneNumber, 传入的一个电话号码
    * 如果区域代码为空，则抛出 NoneValueException 异常
    * 
    * @return Type of String
    * 
    */
    public open func getRegionCodeForNumber(number: PhoneNumber): Option<String>

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
    * 当 RawInput 为 true 时，解析电话号码并返回
    *
    * @param numberToParse 传入将要被解析的电话号码
    * @param defaultRegion String 类型字符串
    * @param phoneNumber 传入一个 PhoneNumber 类对象
    *
    * @return 返回解析后的电话号码
    */
    public open func parseAndKeepRawInput(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit
```


enum PhoneNumberFormat

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

enum MatchType

```cangjie
    | NOT_A_NUMBER
    | NO_MATCH
    | SHORT_NSN_MATCH
    | NSN_MATCH
    | EXACT_MATCH

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

enum ValidationResult

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

    /*
     * 获取国家电话号码
     *
     * 返回值是 Int64 类型
     *
     */
    public func getNationalNumbers(): Int64
```

##### 4.2.1.1 示例

```cangjie
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.*

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
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

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

##### 4.3.2 内部接口

class PhoneNumberMatch

```cangjie

    /**
    * PhoneNumberMatch 的有参构造器
    *
    * 参数 start - Int64 类型数据
    * 参数 rawString - String 类型数据
    * 参数 number - PhoneNumber 类对象
    * 如果 start 小于 0，抛出 IllegalArgumentException 异常；若 rawString 值为空，抛出 Exception 异常
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
    * 判断两个对象是否相等
    *
    * 参数 obj - Object 类型对象
    *
    * 返回值是 Bool 类型
    */
    public func equals(obj: Object): Bool

    /**
    * 转成字符串
    *
    * 返回值是 String 类型
    */
    public func toString(): String
```

class PhoneNumberMatcher

```cangjie

    /**
    * 获取 PhoneNumberMatcher 迭代器
    *
    * 返回值是承载 PhoneNumberMatch 类型的迭代器
    */
    public func iterator(): Iterator<PhoneNumberMatch>

    /**
    * 寻找下一个元素
    *
    * 返回值是 PhoneNumberMatch 类型
    * 如果 PhoneNumberMatch 为空，则抛出 NoneValueException 异常
    */
    public func next(): Option<PhoneNumberMatch>

```

enum State

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

### 5 提供地理位置、时区、运营商相关信息查询功能

前置条件：需要提前将运营商、地理及时区元数据准备完毕 
场景：
1.提供电话号码的运营商信息查询功能
2.提供电话号码的地理信息和时区信息查询功能
约束：数据范围局限于生成的电话号码元数据内
依赖：NA
性能： NA
可靠性： NA

#### 5.1 提供电话号码的运营商信息查询功能
构造一个 PhoneNumber 类，设置国家代码及相应的电话号码信息，然后构造一个 PhoneNumberToCarrierMapper 类，根据传入的电话号码及语言等相关信息查询该电话号所属运营商

##### 5.1.1 主要接口

class PhoneNumberToCarrierMapper

```cangjie

    /**
    * 获取 PhoneNumberToCarrierMapper 实例的静态方法
    *
    *
    * @return 返回 Option 类型，若实例为空，则创建新实例；反之，返回已有实例
    */
    public static func getInstance(): Option<PhoneNumberToCarrierMapper>

    /**
    * 根据有效的电话号码信息，获取其运营商内容
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    *
    * @return 返回运营商信息
    */
    public func getNameForValidNumber(number: PhoneNumber, languageCode: Language): String

    /**
    * 根据传入的电话号码信息，获取其运营商内容
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    *
    * @return 返回运营商信息
    */
    public func getNameForNumber(number: PhoneNumber, languageCode: Language): String

    /**
    * 在“安全”的情况下获取传入的电话号码的运营商名称。如果号码有效，地区无效，则被认为是安全的
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    *
    * @return 返回运营商信息
    */
    public func getSafeDisplayName(number: PhoneNumber, languageCode: Language): String

```

##### 5.1.1.1 示例

```cangjie
import phonenumber4cj.carrier.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(1123456789)
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
""
""
```

##### 5.1.2 内部接口

class PhoneNumberUtil

```cangjie

    /*
     * 判断所提供的区域是否支持移动号码可携性
     *
     * @param 传入区域代码
     *
     * @return 若具有可携性，返回 true；反之，为 false
     */
    public func isMobileNumberPortableRegion(regionCode: String): Bool

```

class PrefixFileReader

```cangjie

    /*
     * PrefixFileReader 的有参构造器
     *
     * @param phonePrefixDataDirectory - 元数据所在目录路径
     *
     */
    public init(phonePrefixDataDirectory: String)

    /*
     * 根据电话号码获取运营商描述信息
     *
     * @param number 传入 PhoneNumber 对象
     * @param language 传入 语言内容
     * @param script 传入自定义信息
     * @param region 传入区域信息
     *
     * @return 返回运营商信息
     */
    public func getCarrierDescriptionForNumber(number: PhoneNumber, lan: Language, script: String, region: String): String

```

enum Language

```cangjie

public enum Language {

    English |
    Chinese |
    China |
    US

    /*
     * 获取国家信息
     *
     * @return 返回获取到的国家
     *
     */
    public func getCountry(): String

    /*
     * 获取与中国相关的描述
     *
     * @return 返回获取到的描述信息
     *
     */
    public func getDisplayCountryToCN(): String

    /*
     * 获取与美国相关的描述
     *
     * @return 返回获取到的描述信息
     *
     */
    public func getDisplayCountryToUS(): String


    /*
     * 获取语言信息
     *
     * @return 返回获取到的语言
     *
     */
    public func getLanguage(): String

    /*
     * 判断两个对象是否相等
     *
     * @param that - 传入的另一个对象
     *
     * @return 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func ==(that: Language): Bool

    /*
     * 判断两个对象是否不相等
     *
     * @param - 传入的另一个对象
     *
     * @return 返回两个对象是否相等，若相等，则为 true;反之，为 false
     */
    public operator func !=(that: Language): Bool

    /*
     * 转字符串方法
     *
     *
     * @return 返回字符串内容
     */
    public func toString(): String

}

```

#### 5.2 提供电话号码的地理位置信息查询功能
构造一个 PhoneNumber 类，设置国家代码及相应的电话号码信息，然后构造一个 PhoneNumberOfflineGeocoder 类，根据传入的电话号码及语言等相关信息查询该电话号所属地理位置

##### 5.2.1 主要接口

```cangjie

    /**
    * 获取 PhoneNumberOfflineGeocoder 实例的静态方法
    *
    *
    * @return 返回 Option 类型，若实例为空，则创建新实例；反之，返回已有实例
    */
    public static func getInstance(): Option<PhoneNumberOfflineGeocoder>

    /**
    * 根据有效的电话号码信息，获取其地理位置内容
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    *
    * @return 返回地理位置信息
    */
    public func getDescriptionForValidNumber(number: PhoneNumber, languageCode: Language): String

    /**
    * 根据有效的电话号码信息与输入的区域代码，获取其地理位置
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    * @param userRegion 传入 区域代码
    *
    * @return 返回地理位置信息
    */
    public func getDescriptionForValidNumber(number: PhoneNumber, languageCode: Language, userRegion: String): String

    /**
    * 根据传入的电话号码信息，获取其地理位置内容
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    *
    * @return 返回地理位置信息
    */
    public func getDescriptionForNumber(number: PhoneNumber, languageCode: Language): String

    /**
    * 根据传入的电话号码信息与输入的区域代码，获取其地理位置
    *
    * @param number 传入 PhoneNumber 对象
    * @param languageCode 传入 Language 对象
    * @param userRegion 传入 区域代码
    *
    * @return 返回地理位置信息
    */
    public func getDescriptionForNumber(number: PhoneNumber, languageCode: Language, userRegion: String): String

```

##### 5.2.1.1 示例

```cangjie
import phonenumber4cj.geocoder.geocoding.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(1123456789)
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
1
```

##### 5.2.2 内部接口

class PhoneNumberUtil

```cangjie

    /*
     * 返回提供的国家/地区呼叫代码的移动令牌，否则返回空字符串
     *
     * @param countryCallingCode 国家呼叫代码
     *
     * @return 给定国家/地区呼叫代码的移动令牌，作为字符串
     */
    public static func getCountryMobileToken(countryCallingCode: Int32): String

    /*
     * 测试电话号码是否具有地理关联
     *
     * @param phoneNumberType 电话号码类型
     * @param countryCallingCode 国家呼叫代码
     *
     * @return 返回 Bool 类型
     */
    public func isNumberGeographical(phoneNumberType: PhoneNumberType, countryCallingCode: Int32): Bool

    /*
     * 返回包含与特定国家/地区呼叫代码匹配的区域代码的列表
     *
     * @param countryCallingCode 国家呼叫代码
     *
     * @return 返回 ArrayList<String> 集合
     */
    public func getRegionCodesForCountryCode(countryCallingCode: Int32): ArrayList<String>

```

class PrefixFileReader

```cangjie

    /*
     * 根据电话号码获取地理位置信息
     *
     * @param number 传入 PhoneNumber 对象
     * @param language 传入 语言内容
     * @param script 传入自定义信息
     * @param region 传入区域信息
     *
     * @return 返回地理位置信息
     */
    public func getGeoDescriptionForNumber(number: PhoneNumber, lan: Language, script: String, region: String): String

```

#### 5.3 提供电话号码的时区信息查询功能
构造一个 PhoneNumber 类，设置国家代码及相应的电话号码信息，然后构造一个 PhoneNumberToTimeZonesMapper 类，根据传入的电话号码及语言等相关信息查询该电话号所属时区

##### 5.3.1 主要接口

```cangjie

    /**
    * 获取 PhoneNumberToTimeZonesMapper 实例的静态方法
    *
    *
    * @return 返回 Option 类型，若实例为空，则创建新实例；反之，返回已有实例
    */
    public static func getInstance(): Option<PhoneNumberToTimeZonesMapper>

    /**
    * 提供可地理定位的电话号码并且号码有效性已经检查，从而获取其时区信息
    *
    * @param number 传入 PhoneNumber 对象
    *
    * @return 返回时区信息
    */
    public func getTimeZonesForGeographicalNumber(number: PhoneNumber): ArrayList<String>

    /**
    * 根据电话号码信息，获取其时区信息
    *
    * @param number 传入 PhoneNumber 对象
    *
    * @return 返回时区信息
    */
    public func getTimeZonesForNumber(number: PhoneNumber): ArrayList<String>

    /**
    * 获取未知时区信息
    *
    *
    * @return 未知时区信息
    */
    public static func getUnknownTimeZone(): String

```

##### 5.3.1.1 示例

```cangjie
import phonenumber4cj.geocoder.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import std.collection.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(1123456789)
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

##### 5.3.2 内部接口

class PrefixFileReader

```cangjie

    /*
     * 根据电话号码获取时区信息
     *
     * @param number 传入 PhoneNumber 对象
     *
     * @return 返回时区信息列表
     */
    public func lookupTimeZonesForNumber(number: PhoneNumber): ArrayList<String>

```

