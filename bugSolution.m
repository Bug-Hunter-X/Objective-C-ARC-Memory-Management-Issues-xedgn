The solution addresses both issues:

For the memory leaks:

```objectivec
@implementation MyClass
- (void)someMethod {
    self.myString = nil; // Release the previous string
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
    // ... some code ...
}
@end
```

This explicitly releases the previous string before allocating a new one, preventing memory growth.  Alternatively, you can manage the string lifecycle differently, for example using `__weak` or `__strong` properties depending on your needs.

For retain cycles, the solution depends heavily on the context but often requires breaking the cycle by using `__weak` references where appropriate inside of the block:

```objectivec
__weak typeof(self) weakSelf = self;
[self someOperationWithBlock:^void(id result) {
    typeof(weakSelf) strongSelf = weakSelf;  // Recover a strong reference as needed, checking for nil first
    if (strongSelf) {
    [strongSelf handleResult:result];
    }
}];
```
This ensures that the block doesn't retain `self` indefinitely.  Always carefully consider the lifecycle of blocks that capture `self`.