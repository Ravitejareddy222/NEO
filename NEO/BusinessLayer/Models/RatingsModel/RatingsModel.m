//
//  RatingsModel.m
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import "RatingsModel.h"

@implementation RatingsResponse
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
        
        NSDictionary *dataDict = dictionary[@"data"];
        if ([dataDict isKindOfClass:[NSDictionary class]]) {
            _data = [[Product alloc] initWithDictionary:dataDict];
        }
        
    }
    return self;
}

@end

@implementation Product
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        // Parse each product attribute
        _productID = dictionary[@"id"];
        _productCategoryID = dictionary[@"product_category_id"];
        _name = dictionary[@"name"];
        _producer = dictionary[@"producer"];
        _descriptionText = dictionary[@"description"];
        _cost = dictionary[@"cost"];
        _rating = dictionary[@"rating"];
        _viewCount = dictionary[@"view_count"];
        _created = dictionary[@"created"];
        _modified = dictionary[@"modified"];
        _productImageURL = dictionary[@"product_images"];
    }
    return self;
}

@end

