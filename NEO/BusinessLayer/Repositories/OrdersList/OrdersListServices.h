//
//  OrdersListServices.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>
#import "OrdersListModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OrdersListServicesProtocol <NSObject>

-(void) getOrdersList: params completion: (void (^)(OrdersListResponse *_Nullable response, NSError *_Nullable error))completion;

@end

@interface OrdersListServices : NSObject<OrdersListServicesProtocol>

@end

NS_ASSUME_NONNULL_END
