//
//  ProductListViewModel.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListViewModel.h"

@implementation ProductListViewModel

- (void)getProductList:(NSInteger)categoryType {
    _params = [NSMutableDictionary dictionary];
    [self.params setObject:[NSNumber numberWithInt: categoryType] forKey:@"product_category_id"];
    
    
}

@end
