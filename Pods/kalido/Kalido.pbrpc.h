#import "Kalido.pbobjc.h"

#import <ProtoRPC/ProtoService.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/Any.pbobjc.h>
#else
  #import "google/protobuf/Any.pbobjc.h"
#endif


NS_ASSUME_NONNULL_BEGIN

@protocol KLDService <NSObject>

#pragma mark auth(Auth) returns (Status)

- (void)authWithRequest:(KLDAuth *)request handler:(void(^)(KLDStatus *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToauthWithRequest:(KLDAuth *)request handler:(void(^)(KLDStatus *_Nullable response, NSError *_Nullable error))handler;


#pragma mark streamNearby(Options) returns (stream Stream)

/**
 * Returns the users Nearby stream
 */
- (void)streamNearbyWithRequest:(KLDOptions *)request eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;

/**
 * Returns the users Nearby stream
 */
- (GRPCProtoCall *)RPCTostreamNearbyWithRequest:(KLDOptions *)request eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;


#pragma mark duplexStreamNearby(stream Options) returns (stream Stream)

- (void)duplexStreamNearbyWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;

- (GRPCProtoCall *)RPCToduplexStreamNearbyWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;


@end

/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface KLDService : GRPCProtoService<KLDService>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host;
@end

NS_ASSUME_NONNULL_END
