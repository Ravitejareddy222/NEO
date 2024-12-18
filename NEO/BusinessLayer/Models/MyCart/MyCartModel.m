//
//  MyCartModel.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartModel.h"

@implementation MyCartResponse

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self) {
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
        
        id dataObject = dictionary[@"data"];
        if ([dataObject isKindOfClass:[NSArray class]]) {
            NSMutableArray<MyCartData *> *cartData = [NSMutableArray array];
            for (NSDictionary *cartDict in dataObject) {
                MyCartData *cart = [[MyCartData alloc] initWithDictionary: cartDict];
                [cartData addObject:cart];
            }
            _data = [cartData copy];
        }
    }
    return self;
}
@end

@implementation MyCartData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _itemId = dictionary[@"id"];
        _productId = dictionary[@"product_id"];
        _quantity = dictionary[@"quantity"];
        
        id productObject = dictionary[@"product"];
        if ([productObject isKindOfClass:[NSDictionary class]]) {
            _myCartItemData = [[MyCartItemDetails alloc] initWithDictionary:productObject];
        }
    }
    return self;
}

@end

@implementation MyCartItemDetails

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        _cartItemId = dictionary[@"id"];
        _name = dictionary[@"name"];
        _cost = dictionary[@"cost"];
        _productCategory = dictionary[@"product_category"];
        _productImage = dictionary[@"product_images"];
        _subTotal = dictionary[@"sub_total"];
    }
    return self;
}
 
@end
