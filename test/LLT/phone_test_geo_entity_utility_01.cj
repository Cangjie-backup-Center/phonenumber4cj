// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.internal.*
from phonenumber import libphonenumber.metadata.*
from phonenumber import libphonenumber.inter.*

main() {
    var b: Bool = GeoEntityUtility.isGeoEntity(27)
    var dmd: DefaultMetadataDependenciesProvider = DefaultMetadataDependenciesProvider.getInstance()
    dmd.getAlternateFormatsMetadataFileNameProvider()
    dmd.getPhoneNumberMetadataSource()
    dmd.getShortNumberMetadataFileNameProvider()
    dmd.getAlternateFormatsMetadataSource()
    dmd.getShortNumberMetadataSource()
    if (b) {
        return 0
    }
    return 1
}
