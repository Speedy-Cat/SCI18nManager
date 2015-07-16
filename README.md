# SCI18nManager #


Easy way to i18n UI elements (UILabels, UITextFiels, UITextViews, UIButtons, UISegmentControl)

```
NSArray *i18nSegmentTitles = @[@"yellow",@"red",@"blue",@"pink"];

//labels
NSArray *elements = @[
        [[SCI18nModel alloc] initWithLabel:self.helloLabel andText:@"hello"],
        [[SCI18nModel alloc] initWithLabel:self.questionLabel andText:@"how are you?"],
        [[SCI18nModel alloc] initWithTextField:self.longTextField text:nil andPlaceholder:@"write your name here"],
        [[SCI18nModel alloc] initWithSegmentControl:self.longSegmentControl andTitles:i18nSegmentTitles],
        [[SCI18nModel alloc] initWithButton:self.saveButton andText:@"save"]
];
[[SCI18Manager sharedInstance] translateI18nModels:elements forLanguage:language];
```

Please read the documentation in 'SCI18nManager.h' https://github.com/adrianortuzar/I18/blob/master/SCI18nManager/SCI18nManager.h
