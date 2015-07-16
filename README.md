# SCI18nManager #

In case that you dont want to build and distribute an app each time that you want to change something in the i18n (key, value), we recomend to create a json file for each language and save them in your server. Then you can donwload them and keep it offline. Finally you use this library to set up the i18n of each element of the UI. 

### Simple i18n ###

```
NSString *value = [[SCI18nElement alloc] getI18nForKey:@"Hello" andLanguage:@"Spanish"];
```


### Easy way to i18n multiples UI elements (UILabels, UITextFiels, UITextViews, UIButtons, UISegmentControl) ###

```
NSArray *i18nSegmentKeyTitles = @[@"yellow",@"red",@"blue",@"pink"];

NSArray *elements = @[
    [[SCI18nElement alloc] initWithLabel:self.helloLabel andKeyText:@"hello"],
    [[SCI18nElement alloc] initWithTextField:self.longTextField keyText:nil andKeyPlaceholder:@"write your name here"],
    [[SCI18nElement alloc] initWithSegmentControl:self.longSegmentControl andKeyTitles:i18nSegmentKeyTitles],
    [[SCI18nElement alloc] initWithButton:self.saveButton andKeyText:@"save"]
];
[[SCI18nManager sharedInstance] translateI18nElements:elements forLanguage:language];
```

For more information read the documentation here 'SCI18nManager.h' https://github.com/adrianortuzar/I18/blob/master/SCI18nManager/SCI18nManager.h
