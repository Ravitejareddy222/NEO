//
//  MyAccountServices.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>
#import "MyAccountModel.h"
#import "NetworkManager.h"
#import "MyAccountSaveModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MyAccountServicesProtocol <NSObject>

-(void) getAccountData: params completion: (void (^)(MyAccountDetailsFetchResponse *_Nullable response, NSError *_Nullable error))completion;

-(void) saveAccountData: params completion: (void (^)(MyAccountDetailsSaveResponse *_Nullable response, NSError *_Nullable error))completion;

@end

@interface MyAccountServices : NSObject<MyAccountServicesProtocol>

@end

NS_ASSUME_NONNULL_END
