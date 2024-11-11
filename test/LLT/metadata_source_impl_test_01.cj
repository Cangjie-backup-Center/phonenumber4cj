// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.internal.*
import phonenumber4cj.libphonenumber.*

main() {
    var load = DefaultMetadataDependenciesProvider.getInstance().getMetadataLoader()
    var parse = DefaultMetadataDependenciesProvider.getInstance().getMetadataParser()
    var sourceImp: MetadataSourceImpl = MetadataSourceImpl(
    DefaultMetadataDependenciesProvider.getInstance().getPhoneNumberMetadataFileNameProvider(), load, parse
    )
    try {
        sourceImp.getMetadataForRegion("001")
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException: 001 region code is a non-geo entity") {
            return 1
        }
    }
    BlockingMetadataBootstrappingGuard<CompositeMetadataContainer>(load, parse, CompositeMetadataContainer())
    var block2 = BlockingMetadataBootstrappingGuard<CompositeMetadataContainer>(load, MetadataParser.newStrictParser(), CompositeMetadataContainer())
    try {
        block2.getOrBootstrap(ArrayList<String>())
    } catch (e: Exception) {
        if (e.toString() != "IllegalArgumentException: Failed to read file []") {
            return 1
        }
    }
    return 0
}
