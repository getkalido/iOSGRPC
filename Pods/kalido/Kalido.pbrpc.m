#import "Kalido.pbrpc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

@implementation KALKalidoService

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:@"Kalido" serviceName:@"KalidoService"]);
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


#pragma mark getNearby(FetchOptions) returns (stream Nearby)

/**
 * Returns the users Nearby stream
 */
- (void)getNearbyWithRequest:(KALFetchOptions *)request eventHandler:(void(^)(BOOL done, KALNearby *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCTogetNearbyWithRequest:request eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Returns the users Nearby stream
 */
- (GRPCProtoCall *)RPCTogetNearbyWithRequest:(KALFetchOptions *)request eventHandler:(void(^)(BOOL done, KALNearby *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"getNearby"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[KALNearby class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
@end
