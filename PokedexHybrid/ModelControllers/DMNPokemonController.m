//
//  DMNPokemonController.m
//  PokedexHybrid
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import "DMNPokemonController.h"
#import "DMNPokemon.h"

static NSString *const baseURLString = @"https://pokeapi.co/api/v2/pokemon";
static NSString *const basePosterURLString = @"https://image.tmdb.org";
static NSString *const tURLString = @"t";
static NSString *const pURLString = @"p";
static NSString *const sizeURLString = @"w200";

@implementation DMNPokemonController

+ (DMNPokemonController *)sharedInstance
{
    static DMNPokemonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DMNPokemonController new];
    });
    return sharedInstance;
}

- (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm
                        completion:(void (^)(DMNPokemon * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    NSLog(@"%@", searchURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL
                                 completionHandler:^(NSData * data,
                                                     NSURLResponse * response,
                                                     NSError * error)
    {
        if (error) {
            NSLog(@"Error fetching pokemon from server: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error fetching pokemon DATA using search term: %@", error);
            completion(nil);
            return;
            
        }
        
    ///this is techinically what the do {} catch {} block is doing in Swift
        /// THIS IS THE DO
        ///create a variable named `jsonDictionary` that is of type NSDictionary
        ///set its value equal to the result of deserializing the data returned using JSONSerialization
        NSDictionary *jsonDictionary = [NSJSONSerialization
                                        JSONObjectWithData:data
                                        options:NSJSONReadingAllowFragments
                                        error:&error];
    
        ///THIS IS THE CATCH
        ///if jsonDictionary does not exist or is not of class Dictionary log an error and escape with empty completion
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Error fetching pokemon DATA using search term: %@", error);
        completion(nil); return;
        }
    
        ///initialize a pokemon by passing in the jsonDictionary to the initWithDictionary function
        ///defined in `DMNPokemon.h` and implemented in `DMNPokemon.m`
        DMNPokemon *pokemon = [[DMNPokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
    
    }] resume];
}

@end
