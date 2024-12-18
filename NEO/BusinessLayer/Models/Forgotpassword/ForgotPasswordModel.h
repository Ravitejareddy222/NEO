//
//  ForgotPasswordModel.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForgotPasswordResponse : NSObject

@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
