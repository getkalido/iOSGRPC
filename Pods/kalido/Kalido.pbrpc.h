#import "Kalido.pbobjc.h"

#import <ProtoRPC/ProtoService.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>



NS_ASSUME_NONNULL_BEGIN

@protocol KALKalidoService <NSObject>

#pragma mark getNearby(FetchOptions) returns (stream Nearby)

/**
 * Returns the users Nearby stream
 */
- (void)getNearbyWithRequest:(KALFetchOptions *)request eventHandler:(void(^)(BOOL done, KALNearby *_Nullable response, NSError *_Nullable error))eventHandler;

/**
 * Returns the users Nearby stream
 */
- (GRPCProtoCall *)RPCTogetNearbyWithRequest:(KALFetchOptions *)request eventHandler:(void(^)(BOOL done, KALNearby *_Nullable response, NSError *_Nullable error))eventHandler;


@end

/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface KALKalidoService : GRPCProtoService<KALKalidoService>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host;
@end

NS_ASSUME_NONNULL_END
