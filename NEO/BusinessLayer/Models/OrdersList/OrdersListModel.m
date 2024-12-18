//
//  OrdersListModel.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrdersListModel.h"

@implementation OrdersListResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
        
        id dataObject = dictionary[@"data"];
        if ([dataObject isKindOfClass:[NSArray class]]) {
            NSMutableArray<OrdersListData *> *ordersListData = [NSMutableArray array];
            for (NSDictionary *ordersListDict in dataObject) {
                OrdersListData *ordersList = [[OrdersListData alloc] initWithDictionary:ordersListDict];
                [ordersListData addObject:ordersList];
            }
            _data = [ordersListData copy];
        }
    }
    return self;
}

@end

@implementation OrdersListData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _productId = dictionary[@"id"];  
        _cost = dictionary[@"cost"];
        _created = dictionary[@"created"];
    }
    return self;
}
@end
