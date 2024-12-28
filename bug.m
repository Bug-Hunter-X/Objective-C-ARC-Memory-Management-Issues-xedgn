In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
    // ... some code ...
}
@end
```

If `someMethod` is called multiple times, each call creates a new `NSString`.  However, if there's no explicit release or setting `myString` to `nil` before subsequent calls, the previous `NSString` object is leaked, leading to memory growth and eventually to crashes.

Another subtle issue:  If you have a class that uses a block that retains `self`, but that block is retained elsewhere and lives longer than the object itself, it can result in a retain cycle, even if ARC is enabled. This is less obvious and easily missed, and is particularly common in networking or callback scenarios.