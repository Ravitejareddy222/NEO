//
//  OrdersListModel.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>
@class OrdersListData;

NS_ASSUME_NONNULL_BEGIN

@interface OrdersListResponse : NSObject

@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) NSArray<OrdersListData *> *data;  
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface OrdersListData : NSObject

@property (nonatomic, nullable, strong) NSNumber *productId;
@property (nonatomic, nullable, strong) NSString *cost;
@property (nonatomic, nullable, strong) NSString *created;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
