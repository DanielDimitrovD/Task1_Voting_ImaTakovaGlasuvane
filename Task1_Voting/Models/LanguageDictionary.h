//
//  LanguageDictionary.h
//  Task1_Voting
//
//  Created by A-Team Intern on 20.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSInteger {
    EnumLanguageBulgarian,
    EnumLanguageEnglish,
    EnumLanguageTurkish
} EnumLanguage;

@interface LanguageDictionary : NSObject
+ (instancetype)sharedLanguageDictionary;
- (NSString *)stringForKey:(NSString *)englishWord;
- (void)setLanguage:(EnumLanguage)language;
@end

NS_ASSUME_NONNULL_END
