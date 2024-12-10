//
//  ProductListModel.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <Foundation/Foundation.h>
@class ProductData;

NS_ASSUME_NONNULL_BEGIN

@interface ProductListResponse : NSObject
@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) NSArray<ProductData *> *data;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary error: (NSError **)error;

@end

@interface ProductData : NSObject
@property (nonatomic, nullable, strong) NSNumber *productId;
@property (nonatomic, nullable, strong) NSNumber *productCategoryId;
@property (nonatomic, nullable, strong) NSString *name;
@property (nonatomic, nullable, strong) NSString *producer;
@property (nonatomic, nullable, strong) NSString *productDescription;
@property (nonatomic, nullable, strong) NSNumber *cost;
@property (nonatomic, nullable, strong) NSNumber *rating;
@property (nonatomic, nullable, strong) NSNumber *viewCount;
@property (nonatomic, nullable, strong) NSString *created;
@property (nonatomic, nullable, strong) NSString *modified;
@property (nonatomic, nullable, strong) NSString *productImages;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
