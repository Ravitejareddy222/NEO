//
//  RegisterViewModel.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <Foundation/Foundation.h>
#import "RegisterServices.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewModel : NSObject

@property (strong, nonatomic) NSMutableDictionary *params;

- (void) saveUser:(NSString *)firstname lastname: (NSString *)lastname email:(NSString *) email password: (NSString *)password confirmPassword: (NSString *)confirmPassword phoneNumber: (NSString *) phoneNumber gender: (NSString *)gender;

@property (nonatomic, strong) id<RegisterServicesProtocol> registerProtocol;

@end



NS_ASSUME_NONNULL_END
