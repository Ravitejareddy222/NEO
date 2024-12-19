//
//  RatingsModel.h
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import <Foundation/Foundation.h>
@class Product;

NS_ASSUME_NONNULL_BEGIN

@interface RatingsResponse : NSObject
@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) Product *data;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

@interface Product : NSObject
@property (nonatomic, strong) NSNumber *productID;
@property (nonatomic, strong) NSNumber *productCategoryID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *producer;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSNumber *cost;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSNumber *viewCount;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSString *productImageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
