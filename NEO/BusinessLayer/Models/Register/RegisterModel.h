//
//  RegisterModels.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <Foundation/Foundation.h>

@class UserData;

NS_ASSUME_NONNULL_BEGIN

@interface UserResponse : NSObject

@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) UserData *data;
@property (nonatomic, nullable, copy) NSString *message;
@property (nonatomic, nullable, copy) NSString *userMsg;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error;

@end

@interface UserData : NSObject

@property (nonatomic, nullable, strong) NSNumber *userId;
@property (nonatomic, nullable, strong) NSNumber *roleId;
@property (nonatomic, nullable, copy) NSString *firstName;
@property (nonatomic, nullable, copy) NSString *lastName;
@property (nonatomic, nullable, copy) NSString *email;
@property (nonatomic, nullable, copy) NSString *username;
@property (nonatomic, nullable, copy) NSString *profilePic;
@property (nonatomic, nullable, strong) NSNumber *countryId;
@property (nonatomic, nullable, copy) NSString *gender;
@property (nonatomic, nullable, copy) NSString *phoneNo;
@property (nonatomic, nullable, copy) NSString *dob;
@property (nonatomic, nullable, strong) NSNumber *isActive;
@property (nonatomic, nullable, copy) NSString *created;
@property (nonatomic, nullable, copy) NSString *modified;
@property (nonatomic, nullable, copy) NSString *accessToken;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
