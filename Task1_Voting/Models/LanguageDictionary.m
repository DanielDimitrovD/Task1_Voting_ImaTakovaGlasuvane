//
//  LanguageDictionary.m
//  Task1_Voting
//
//  Created by A-Team Intern on 20.04.21.
//

#import "LanguageDictionary.h"

@implementation LanguageDictionary

@synthesize sharedInstance;
@synthesize sharedLanguageSettings;

+ (id)sharedLanguageDictionary {
    static LanguageDictionary *sharedLanguageDictionary = nil;
    
    @synchronized (self) {
        if (sharedLanguageDictionary == nil) {
            sharedLanguageDictionary = [[LanguageDictionary alloc] init];
        }
    }
    
    return sharedLanguageDictionary;
}

- (id)init {
    if (self = [super init]) {
         sharedInstance = @{
            @"Bulgarian" : @{
                    @"Bulgarian National Movement" : @"ВМРО",
                    @"We, the citizens" : @"Ние, гражданите",
                    @"Bulgarian National Union" : @"Български национален съюз - БНД" ,
                    @"Bulgarian Socialist Party" : @"БСП за България" ,
                    @"Revival" : @"Възраждане" ,
                    @"Alternative for Bulgarian Revival" : @"АБВ" ,
                    @"Attack" : @"Атака",
                    @"Conservative Union of The Far Right" : @"Консервативно обединение на десницата",
                    @"Movement for Rights and Freedoms" : @"ДПС",
                    @"Bulgarian Progressive Line" : @"Българска прогресивна линия",
                    @"Democratic Bulgaria" : @"Демократична България",
                    @"Revival of the Homeland" : @"Възраждане на Отечеството",
                    @"Movement \"Together for change\"" : @"Движение \"Заедно за промяната\"",
                    @"Bulgarian National Union" : @"Българско национално обединение - БНО",
                    @"Nation" : @"Партия \"Нация\"",
                    @"Moral, Initiative, Patriotism" : @"МИР",
                    @"Citizens from the Protest" : @"Граждани от Протеста",
                    @"Stand up! Get out!" : @"Изправи се! Мутри вън!",
                    @"People's Voice" : @"Глас Народен",
                    @"Movement of the non-party candidates" : @"Движение на непартийните кандидати",
                    @"Republicans for Bulgaria" : @"Републиканци за България",
                    @"The Right" : @"Партия \"Правото\"",
                    @"Prosperity-Unification-Building" : @"Благоденствие-Обединение-Градивност",
                    @"Patriotic Coalition - WILL and NFSB" : @"Патриотична коалиция - ВОЛЯ и НФСБ",
                    @"Green Party of Bulgaria" : @"Партия на Зелените",
                    @"Society for New Bulgaria" : @"Общество за Нова България",
                    @"Bulgarian Union for Direct Democracy" : @"Български съюз за директна демокрация",
                    @"GERB-SDS" : @"ГЕРБ-СДС",
                    @"There are such people" : @"Има такъв народ",
                    @"Direct Democracy" : @"Пряка демокрация",
                    @"Accept" : @"Потвърди",
                    @"Decline" : @"Отказ",
                    @"Vote" : @"Гласуване",
                    @"Back" : @"Назад",
                    @"Language" : @"Език"
            } ,
            @"Turkish" : @{
                    @"Bulgarian National Movement" : @"Bulgar ulusal hareketi",
                    @"We, the citizens" : @"Biz vatandaşlar",
                    @"Bulgarian National Union" : @"Bulgar Ulusal Birliği" ,
                    @"Bulgarian Socialist Party" : @"Bulgar Sosyalist Partisi" ,
                    @"Revival" : @"Canlanma" ,
                    @"Alternative for Bulgarian Revival" : @"Bulgar Uyanışı için bir alternatif" ,
                    @"Attack" : @"Saldırı",
                    @"Conservative Union of The Far Right" : @"Hakkın muhafazakar birleşmesiД",
                    @"Movement for Rights and Freedoms" : @"Haklar ve Özgürlükler Hareketi",
                    @"Bulgarian Progressive Line" : @"Bulgar ilerici çizgisi",
                    @"Democratic Bulgaria" : @"Demokratik Bulgaristan",
                    @"Revival of the Homeland" : @"Anavatanın canlanması",
                    @"Movement \"Together for change\"" : @"Değişim için Birlikte Hareketi",
                    @"Bulgarian National Union" : @"Bulgar Ulusal Birleşmesi",
                    @"Nation" : @"Ulus",
                    @"Moral, Initiative, Patriotism" : @"Ahlak Girişimi Yurtseverlik",
                    @"Citizens from the Protest" : @"Protesto Vatandaşları",
                    @"Stand up! Get out!" : @"Ayağa kalk! Defol!",
                    @"People's Voice" : @"Vox Populi",
                    @"Movement of the non-party candidates" : @"Parti dışı adayların hareketi",
                    @"Republicans for Bulgaria" : @"Bulgaristan için Cumhuriyetçiler",
                    @"The Right" : @"Doğru Parti",
                    @"Prosperity-Unification-Building" : @"Refah-Birlik-İnşa Etme",
                    @"Patriotic Coalition - WILL and NFSB" : @"Vatanseverlik Koalisyonu - WILL ve NFSB",
                    @"Green Party of Bulgaria" : @"Yeşil Parti",
                    @"Society for New Bulgaria" : @"Yeni Bulgaristan Topluluğu",
                    @"Bulgarian Union for Direct Democracy" : @"Bulgar Doğrudan Demokrasi Birliği",
                    @"GERB-SDS" : @"ГЕРБ-СДС",
                    @"There are such people" : @"Böyle insanlar var",
                    @"Direct Democracy" : @"Doğrudan demokrasi",
                    @"Accept" : @"Кabullenmek",
                    @"Decline" : @"Azalma",
                    @"Vote" : @"Oy",
                    @"Back" : @"Geri",
                    @"Language" : @"Dil"
            },
        };
    }
    
    self.sharedLanguageSettings = @"English";
    
    return self;
}

@end
