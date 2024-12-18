//
//  ResetPasswordModel.h
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResetPasswordResponse : NSObject
@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, assign) BOOL *data;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
