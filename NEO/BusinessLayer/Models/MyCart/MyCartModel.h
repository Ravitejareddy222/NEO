//
//  MyCartModel.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <Foundation/Foundation.h>

@class MyCartData;
@class MyCartItemDetails;


NS_ASSUME_NONNULL_BEGIN

@interface MyCartResponse : NSObject

@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) NSArray<MyCartData *> *data;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

@interface MyCartData : NSObject
@property (nonatomic, nullable, strong) NSNumber *itemId;
@property (nonatomic, nullable, strong) NSNumber *productId;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, strong) MyCartItemDetails  *myCartItemData;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

@interface MyCartItemDetails : NSObject

@property (nonatomic, nullable, strong) NSNumber *cartItemId;
@property (nonatomic, nullable, strong) NSString *name;
@property (nonatomic, nullable, strong) NSNumber *cost;
@property (nonatomic, nullable, strong) NSString *productCategory;
@property (nonatomic, nullable, strong) NSString *productImage;
@property (nonatomic, nullable, strong) NSNumber *subTotal;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
