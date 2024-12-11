//
//  ProductDetailsModel.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "ProductDetailsModel.h"

@implementation ProductDetailsResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    self = [super init];
    if (self){
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
        
        
        id dataObject = dictionary[@"data"];
        if ([dataObject isKindOfClass:[NSDictionary class]]) {
            _data = [[ProductDetails alloc] initWithDictionary:dataObject];
        }
    }
    return self;
}

@end

@implementation ProductDetails

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        _productId = dictionary[@"id"];
        _productCategoryId = dictionary[@"product_category_id"];
        _productName = dictionary[@"name"];
        _productproducer = dictionary[@"producer"];
        _productDescription = dictionary[@"description"];
        _productCost = dictionary[@"cost"];
        _rating = dictionary[@"rating"];
        _productViewCount = dictionary[@"view_count"];
        _created = dictionary[@"created"];
        _modified = dictionary[@"modified"];
        
        id imageObject = dictionary[@"product_images"];
        if ([imageObject isKindOfClass:[NSArray class]]) {
            NSMutableArray<ProductImagesArray *> *productImg = [NSMutableArray array];
            for (NSDictionary *productDict in imageObject) {
                ProductImagesArray *product = [[ProductImagesArray alloc] initWithDictionaryForImages:productDict];
                [productImg addObject:product];
            }
            _productImages = [productImg copy];
        }
    }
    return self;
}
@end

@implementation ProductImagesArray


- (instancetype)initWithDictionaryForImages:(NSDictionary *)dictionary {
    self = [super init];
    if (self){
        _productImage = dictionary[@"image"];
    }
    return self;
}

@end
