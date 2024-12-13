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
                        completion:(void (^)(id _Nullable, NSError * _Nullable))completion {
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = method;
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"accessToken"];
    [request setValue: accessToken forHTTPHeaderField:@"access_token"];
   
    if ([method isEqualToString:@"GET"] && parameters) {
        NSMutableArray *queryItems = [NSMutableArray array];
        
        
        for (NSString *key in parameters) {
            NSString *value = [NSString stringWithFormat:@"%@", parameters[key]];
           
            NSString *encodedKey = [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
           
            NSString *encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            
            [queryItems addObject:[NSString stringWithFormat:@"%@=%@", encodedKey, encodedValue]];
        }
        
        NSString *queryString = [queryItems componentsJoinedByString:@"&"];
        NSString *fullURLString = [NSString stringWithFormat:@"%@?%@", path, queryString];
        request.URL = [NSURL URLWithString:fullURLString];
    }
    
    // Handle POST method: set content type and encode parameters in HTTPBody
    if ([method isEqualToString:@"POST"]) {
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        NSString *accessToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"accessToken"];
        [request setValue: accessToken forHTTPHeaderField:@"access_token"];
        
        if (parameters) {
            NSMutableString *bodyString = [NSMutableString string];
            
            for (NSString *key in parameters) {
                NSString *value = [NSString stringWithFormat:@"%@", parameters[key]];
                
                NSString *encodedKey =
                 [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
               
                NSString *encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                
                if (bodyString.length > 0) {
                    [bodyString appendString:@"&"];
                }
                [bodyString appendFormat:@"%@=%@", encodedKey, encodedValue];
            }
            
            request.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
        }
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
