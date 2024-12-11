//
//  AddToCartServices.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <Foundation/Foundation.h>
#import "AddToCartModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddToCartServicesProtocol <NSObject>

-(void) addToCartData: (NSDictionary *)params completion: (void (^)(AddToCartResponse * _Nullable response, NSError *_Nullable error))completion;
@end

@interface AddToCartServices : NSObject<AddToCartServicesProtocol>

@end

NS_ASSUME_NONNULL_END
