//
//  OrdersListViewModel.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>
#import "OrdersListServices.h"
#import "OrdersListModel.h"

@class OrdersListResponseHandler;

typedef void (^OrdersListSuccessBlock)(void);
typedef void (^OrdersListFailureBlock)(NSString *_Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface OrdersListViewModel : NSObject

@property (nonatomic, strong) OrdersListSuccessBlock ordersListDetailsFetchSuccessful;
@property (nonatomic, strong) OrdersListFailureBlock ordersListDetailsFetchFailure;

@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) NSArray<OrdersListData*> *ordersListData;

-(void) ordersList;

@property (nonatomic, strong) id<OrdersListServicesProtocol> ordersListProtocol;

@end

NS_ASSUME_NONNULL_END
