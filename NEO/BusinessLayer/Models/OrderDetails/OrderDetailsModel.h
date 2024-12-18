//
//  OrderDetails.h
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import <Foundation/Foundation.h>

@class OrderDetails;
@class ItemDetails;

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailsResponse : NSObject

@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) OrderDetails *data;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface OrderDetails : NSObject

@property (nonatomic, nullable, strong) NSNumber *orderId;
@property (nonatomic, nullable, strong) NSNumber *cost;
@property (nonatomic, nullable, strong) NSString *address; 
@property (nonatomic, nullable, strong) NSArray<ItemDetails *> *orderDetails;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface ItemDetails : NSObject

@property (nonatomic, nullable, strong) NSNumber *productId;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, strong) NSNumber *total;
@property (nonatomic, nullable, strong) NSString *productName;
@property (nonatomic, nullable, strong) NSString *productCategory;
@property (nonatomic, nullable, strong) NSString *productImage;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
