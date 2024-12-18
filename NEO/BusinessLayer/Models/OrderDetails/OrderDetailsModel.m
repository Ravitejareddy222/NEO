//
//  OrderDetails.m
//  NEO
//
//  Created by Neo on 16/12/24.
//


#import "OrderDetailsModel.h"

@implementation OrderDetailsResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        
        id dataObject = dictionary[@"data"];
        if ([dataObject isKindOfClass:[NSDictionary class]]) {
            _data = [[OrderDetails alloc] initWithDictionary:dataObject];
        }
    }
    return self;
}

@end

@implementation OrderDetails

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        // Order Details from JSON response
        _orderId = dictionary[@"id"];
        _cost = dictionary[@"cost"];
        _address = dictionary[@"address"];
        
        id orderDetailsObject = dictionary[@"order_details"];
        if ([orderDetailsObject isKindOfClass:[NSArray class]]) {
            NSMutableArray<ItemDetails *> *itemDetails = [NSMutableArray array];
            for (NSDictionary *itemDetailDict in orderDetailsObject) {
                ItemDetails *itemDetail = [[ItemDetails alloc] initWithDictionary:itemDetailDict];
                [itemDetails addObject:itemDetail];
            }
            _orderDetails = [itemDetails copy];
        }
    }
    return self;
}

@end

@implementation ItemDetails

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _productId = dictionary[@"product_id"];
        _quantity = dictionary[@"quantity"];
        _total = dictionary[@"total"];
        _productName = dictionary[@"prod_name"];
        _productCategory = dictionary[@"prod_cat_name"];
        _productImage = dictionary[@"prod_image"];
    }
    return self;
}

@end
