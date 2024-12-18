//
//  MyAccountServices.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountServices.h"
#import "MyAccountAPIs.h"

@implementation MyAccountServices


-(void) getAccountData: params completion: (void (^)(MyAccountDetailsFetchResponse *_Nullable response, NSError *_Nullable error))completion{
    NSString *path = MyAccountAPIs.getfetchDetailsPath;
    NSString *method = MyAccountAPIs.getfetchDetailsMethod;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError *_Nullable error){
        if(error){
            completion(nil, error);
        }else{
            MyAccountDetailsFetchResponse *myAccountDetailsFetchResponse = [[MyAccountDetailsFetchResponse alloc] initWithDictionary: data];
            completion(myAccountDetailsFetchResponse, nil);
        }
        
    }];
}

-(void) saveAccountData: params completion: (void (^)(MyAccountDetailsSaveResponse *_Nullable response, NSError *_Nullable error))completion{
    NSString *path = MyAccountAPIs.saveAccountDetailsPath;
    NSString *method = MyAccountAPIs.saveAccountDetailsMethod;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError *_Nullable error){
        if(error){
            completion(nil, error);
        }else{
            MyAccountDetailsSaveResponse *myAccountDetailsSaveResponse = [[MyAccountDetailsSaveResponse alloc] initWithDictionary: data];
            completion(myAccountDetailsSaveResponse, nil);
        }
    }];
}
@end
