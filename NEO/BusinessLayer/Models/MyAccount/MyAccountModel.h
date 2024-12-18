//
//  MyAccountModel.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>

@class AccountData;

NS_ASSUME_NONNULL_BEGIN

@interface MyAccountDetailsFetchResponse : NSObject

@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) AccountData *data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *userMsg;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface AccountData : NSObject

@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, assign) NSInteger roleID;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *profilePic;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *phoneNo;
@property (nonatomic,nullable, copy) NSString *dob;
@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *modified;
@property (nonatomic, copy) NSString *accessToken;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end



NS_ASSUME_NONNULL_END
