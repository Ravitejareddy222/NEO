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
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) ProductData *data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *userMsg;

@end

@interface ProductData : NSObject

@end

NS_ASSUME_NONNULL_END
