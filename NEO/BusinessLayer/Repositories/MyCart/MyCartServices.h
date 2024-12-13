//
//  MyCartServices.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <Foundation/Foundation.h>
#import "MyCartModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MyCartServicesProtocol <NSObject>

-(void) getMyCartData: params completion: (void (^)(MyCartResponse *_Nullable response, NSError *_Nullable error))completion;

@end

@interface MyCartServices : NSObject<MyCartServicesProtocol>

@end

NS_ASSUME_NONNULL_END
