//
//  ProductDetailsModel.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <Foundation/Foundation.h>

@class ProductDetails;
@class ProductImagesArray;

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsResponse : NSObject

@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) ProductDetails *data;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary error: (NSError **)error;

@end

@interface ProductDetails: NSObject

@property (nonatomic, nullable, strong) NSNumber *productId;
@property (nonatomic, nullable, strong) NSNumber *productCategoryId;
@property (nonatomic, nullable, strong) NSString *productName;
@property (nonatomic, nullable, strong) NSString *productproducer;
@property (nonatomic, nullable, strong) NSString *productDescription;
@property (nonatomic, nullable, strong) NSNumber *productCost;
@property (nonatomic, nullable, strong) NSNumber *productViewCount;
@property (nonatomic, nullable, strong) NSNumber *rating;
@property (nonatomic, nullable, strong) NSString *created;
@property (nonatomic, nullable, strong) NSString *modified;
@property (nonatomic, nullable, strong) NSArray<ProductImagesArray *> *productImages;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

@interface ProductImagesArray : NSObject

@property (nonatomic, nullable, strong) NSString *productImage;

-(instancetype) initWithDictionaryForImages: (NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END
