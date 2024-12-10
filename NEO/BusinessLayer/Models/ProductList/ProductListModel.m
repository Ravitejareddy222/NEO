//
//  ProductListModel.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListModel.h"

@implementation ProductListResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    self = [super init];
    if (self) {
        // Parse basic fields
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
        
        // Parse 'data' as an array of products
        id dataObject = dictionary[@"data"];
        if ([dataObject isKindOfClass:[NSArray class]]) {
            NSMutableArray<ProductData *> *productList = [NSMutableArray array];
            for (NSDictionary *productDict in dataObject) {
                ProductData *product = [[ProductData alloc] initWithDictionary:productDict];
                [productList addObject:product];
            }
            _data = [productList copy];
        } else {
            if (error) {
                *error = [NSError errorWithDomain:@"com.myapp.error"
                                             code:1001
                                         userInfo:@{NSLocalizedDescriptionKey: @"'data' is missing or not an array"}];
            }
        }
    }
    return self;
}

@end

@implementation ProductData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _productId = dictionary[@"id"];
        _productCategoryId = dictionary[@"product_category_id"];
        _name = dictionary[@"name"];
        _producer = dictionary[@"producer"];
        _productDescription = dictionary[@"description"];
        _cost = dictionary[@"cost"];
        _rating = dictionary[@"rating"];
        _viewCount = dictionary[@"view_count"];
        _created = dictionary[@"created"];
        _modified = dictionary[@"modified"];
        _productImages = dictionary[@"product_images"];
    }
    return self;
}

@end
