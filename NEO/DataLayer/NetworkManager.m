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
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    if (parameters) {
        // Create a mutable string to store the body
        NSMutableString *bodyString = [NSMutableString string];
        
        // Iterate over the parameters and URL-encode them
        for (NSString *key in parameters.allKeys) {
            NSString *value = [NSString stringWithFormat:@"%@", parameters[key]];
            
            // URL encode both the key and value
            NSString *encodedKey = [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSString *encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            
            // Append the encoded key-value pair to the body string
            if (bodyString.length > 0) {
                [bodyString appendString:@"&"];
            }
            [bodyString appendFormat:@"%@=%@", encodedKey, encodedValue];
        }
        
        // Set the HTTPBody with the URL-encoded parameters
        request.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
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
