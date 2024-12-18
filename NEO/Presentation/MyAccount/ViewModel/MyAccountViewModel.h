//
//  MyAccountViewModel.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>
#import "MyAccountServices.h"

@class MyAccountDetailsResponseHandler;

typedef void(^MyAccountFetchSuccessBlock)(void);
typedef void(^MyAccountFetchFailureBlock)(NSString * _Nullable error);

typedef void(^MyAccountSaveSuccessBlock)(void);
typedef void(^MyAccountSaveFailureBlock)(NSString * _Nullable error);

typedef void(^StartLoadingBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface MyAccountViewModel : NSObject

@property (nonatomic, strong) MyAccountFetchSuccessBlock myAccountDetailsFetchSuccessful;
@property (nonatomic, strong) MyAccountFetchFailureBlock myAccountDetailsFetchFailure;

@property (nonatomic, strong) MyAccountSaveSuccessBlock myAccountDetailsSaveSuccessful;
@property (nonatomic, strong) MyAccountSaveFailureBlock myAccountDetailsSaveFailure;

@property (nonatomic, strong) StartLoadingBlock onStartLoading;


@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, strong) id<MyAccountServicesProtocol> myAccountProtocol;



-(void) saveAccountData:(NSString *)firstName lastName: (NSString *)lastName email: (NSString *)email dob:(NSString *)dob phoneNumber: (NSString *)phoneNumber personImage: (NSString *)personImage;

-(void) getAccountDetails;

@property (nonatomic, strong) AccountData *accountData;



@end

NS_ASSUME_NONNULL_END
