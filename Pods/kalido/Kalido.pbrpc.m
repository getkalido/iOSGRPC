#import "Kalido.pbrpc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

@implementation KLDService

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:@"KalidoV1_0_0" serviceName:@"Service"]);
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}


#pragma mark auth(Auth) returns (Status)

- (void)authWithRequest:(KLDAuth *)request handler:(void(^)(KLDStatus *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToauthWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToauthWithRequest:(KLDAuth *)request handler:(void(^)(KLDStatus *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"auth"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[KLDStatus class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
#pragma mark streamNearby(Options) returns (stream Stream)

/**
 * Returns the users Nearby stream
 */
- (void)streamNearbyWithRequest:(KLDOptions *)request eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCTostreamNearbyWithRequest:request eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Returns the users Nearby stream
 */
- (GRPCProtoCall *)RPCTostreamNearbyWithRequest:(KLDOptions *)request eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"streamNearby"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[KLDStream class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
#pragma mark duplexStreamNearby(stream Options) returns (stream Stream)

- (void)duplexStreamNearbyWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCToduplexStreamNearbyWithRequestsWriter:requestWriter eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToduplexStreamNearbyWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"duplexStreamNearby"
            requestsWriter:requestWriter
             responseClass:[KLDStream class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
@end
