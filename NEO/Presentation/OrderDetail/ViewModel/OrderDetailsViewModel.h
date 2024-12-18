//
//  OrderDetailsViewModell.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>
#import "OrderDetailsServices.h"
#import "OrderDetailsModel.h"

@class OrdersDetailsResponseHandler;

typedef void (^OrderDetailsSuccessBlock)(void);
typedef void (^OrderDetailsFailureBlock)(NSString *_Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailsViewModel : NSObject

@property (nonatomic, strong) OrderDetailsSuccessBlock orderDetailsFetchSuccessful;
@property (nonatomic, strong) OrderDetailsFailureBlock orderDetailsFetchFailure;

@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) OrderDetails *order;
@property (nonatomic, strong) NSArray<ItemDetails *> * itemDetails;

-(void) orderDetails: (NSNumber *)orderId;

@property (nonatomic, strong) id<OrderDetailsServicesProtocol> orderDetailsProtocol;

@end

NS_ASSUME_NONNULL_END
