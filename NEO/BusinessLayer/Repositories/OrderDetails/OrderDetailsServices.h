//
//  OrderDetailsServices.h
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import <Foundation/Foundation.h>
#import "OrderDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OrderDetailsServicesProtocol <NSObject>

-(void) getOrderDetails: params completion: (void (^)(OrderDetailsResponse *_Nullable response, NSError *_Nullable error))completion;

@end

@interface OrderDetailsServices : NSObject<OrderDetailsServicesProtocol>

@end

NS_ASSUME_NONNULL_END
