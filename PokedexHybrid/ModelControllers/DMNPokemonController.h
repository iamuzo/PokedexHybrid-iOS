//
//  DMNPokemonController.h
//  PokedexHybrid
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///@class DMNPokemon essentially lets this header class aware of the fact that such an object exists. Basically instead of importing the entire DMNPokemon.h file, we only draw in a part of it
@class DMNPokemon;
@interface DMNPokemonController : NSObject

//the upcarrot ^ in the closure is the same as @escaping in Swift
- (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^) (DMNPokemon * _Nullable))completion;

+ (DMNPokemonController *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
