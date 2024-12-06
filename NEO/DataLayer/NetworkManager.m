//
//  NetworkManager.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "NetworkManager.h"

@interface NetworkManager ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation NetworkManager

+ (instancetype)sharedInstance {
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _session = [NSURLSession sharedSession];
    }
    return self;
}

- (void)performDataRequestWithPath:(NSString *)path
                            method:(NSString *)method
                        parameters:(NSDictionary *)parameters
                           headers:(NSDictionary<NSString *, NSString *> *)headers
                        completion:(void (^)(id _Nullable, NSError * _Nullable))completion {
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = method;
    [request setAllHTTPHeaderFields:headers];

    if (parameters) {
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    }

    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }

        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(json, nil);
    }];
    [task resume];
}

@end

