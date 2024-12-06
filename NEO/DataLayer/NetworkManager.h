//
//  NetworkManager.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <Foundation/Foundation.h>

typedef void (^APICompletionHandler)(id _Nullable data, NSError * _Nullable error);

@interface NetworkManager : NSObject

+ (instancetype _Nullable )sharedInstance;

- (void)performDataRequestWithPath:(NSString *_Nullable)path
                            method:(NSString *_Nullable)method
                        parameters:(NSDictionary * _Nullable)parameters
                        completion:(APICompletionHandler _Nullable )completionHandler;

@end

