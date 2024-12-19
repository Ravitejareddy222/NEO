//
//  RatingsServices.m
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import "RatingsServices.h"
#import "RatingsAPIs.h"
#import "NetworkManager.h"

@implementation RatingsServices

- (void)saveRatings:(nonnull NSDictionary *)params completion:(nonnull void (^)(RatingsResponse * _Nullable, NSError * _Nullable))completion { 
    NSString *path = RatingsAPIs.getRatingsPath;
    NSString *method = RatingsAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError *_Nullable error){
        if(error){
            completion(nil, error);
        }else{
            RatingsResponse *ratingsResponse = [[RatingsResponse alloc] initWithDictionary: data];
            completion(ratingsResponse, nil);
        }
        
    }];
}

@end
