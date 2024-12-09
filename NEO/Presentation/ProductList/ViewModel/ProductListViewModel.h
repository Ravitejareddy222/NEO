//
//  ProductListViewModel.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <Foundation/Foundation.h>
@class ProductListResponsehandler;
typedef void (^GetProductListSuccessBlock)(void);
typedef void (^GetProductListFailureBlock)(NSString * _Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface ProductListViewModel : NSObject

@property (nonatomic, copy) GetProductListSuccessBlock productListFetchSuccessfull;
@property (nonatomic, copy) GetProductListFailureBlock productListFetchFailure;

@property (nonatomic, strong) NSMutableDictionary *params;

-(void) getProductList: (NSInteger)categoryType;
@end

NS_ASSUME_NONNULL_END
