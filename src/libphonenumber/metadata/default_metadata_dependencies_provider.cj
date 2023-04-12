package libphonenumber.metadata

from std import fs.*
from std import os.*
from std import os.posix.*
import libphonenumber.data.*

public class DefaultMetadataDependenciesProvider {
    private static let INSTANCE: DefaultMetadataDependenciesProvider = DefaultMetadataDependenciesProvider()

    public static func getInstance(): DefaultMetadataDependenciesProvider {
        return INSTANCE
    }

    private init() {}

    private let metadataParser: MetadataParser = MetadataParser.newLenientParser()
    private let metadataLoader: MetadataLoader = ClassPathResourceMetadataLoader()

    private let phoneNumberMetadataFileNameProvider: PhoneMetadataFileNameProvider = MultiFileModeFileNameProvider(
        PHONE_NUMBER_METADATA_MAP)
    private let phoneNumberMetadataSource: MetadataSource = MetadataSourceImpl(phoneNumberMetadataFileNameProvider,
        metadataLoader, metadataParser)

    private let shortNumberMetadataFileNameProvider: PhoneMetadataFileNameProvider = MultiFileModeFileNameProvider(
        SHORT_NUMBER_METADATA_MAP)
    private let shortNumberMetadataSource: RegionMetadataSource = RegionMetadataSourceImpl(
        shortNumberMetadataFileNameProvider, metadataLoader, metadataParser)

    private let alternateFormatsMetadataFileNameProvider: PhoneMetadataFileNameProvider = 
        MultiFileModeFileNameProvider(PHONE_NUMBER_ALTERNATE_FORMATS_MAP)
    private let alternateFormatsMetadataSource: FormattingMetadataSource = FormattingMetadataSourceImpl(
        alternateFormatsMetadataFileNameProvider, metadataLoader, metadataParser)

    public func getMetadataParser(): MetadataParser {
        return metadataParser
    }

    public func getMetadataLoader(): MetadataLoader {
        return metadataLoader
    }

    public func getPhoneNumberMetadataFileNameProvider(): PhoneMetadataFileNameProvider {
        return phoneNumberMetadataFileNameProvider
    }

    public func getPhoneNumberMetadataSource(): MetadataSource {
        return phoneNumberMetadataSource
    }

    public func getShortNumberMetadataFileNameProvider(): PhoneMetadataFileNameProvider {
        return shortNumberMetadataFileNameProvider
    }

    public func getShortNumberMetadataSource(): RegionMetadataSource {
        return shortNumberMetadataSource
    }

    public func getAlternateFormatsMetadataFileNameProvider(): PhoneMetadataFileNameProvider {
        return alternateFormatsMetadataFileNameProvider
    }

    public func getAlternateFormatsMetadataSource(): FormattingMetadataSource {
        return alternateFormatsMetadataSource
    }

    public func getCarrierDataDirectory(): String {
        match(getEnv("LD_LIBRARY_PATH")) {
            case Some(str) =>
                if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                    return ""
                }
                let paths: Array<String> = str.split(":")
                for (path in paths where path.contains("build")) {
                    return "${path}"
                }
                return ""
            case None => return ""
        }
    }

    public func getGeocodingDataDirectory(): String {
        match(getEnv("LD_LIBRARY_PATH")) {
            case Some(str) =>
                if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                    return ""
                }
                let paths: Array<String> = str.split(":")
                for (path in paths where path.contains("build")) {
                    return "${path}"
                }
                return ""
            case None => return ""
        }
    }
}
