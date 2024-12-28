# Objective-C ARC Memory Management Issues

This repository demonstrates two common, yet often subtle, memory management problems that can occur in Objective-C applications even when using Automatic Reference Counting (ARC).

**Problem 1:  Memory Leaks due to Repeated String Allocation**
The `bug.m` file shows a simple example where a string is repeatedly allocated without releasing the previous instance, leading to memory leaks.

**Problem 2: Retain Cycles with Blocks**
The `bug.m` file also illustrates how retain cycles can easily occur when blocks capture `self` and outlive the object itself.

**Solutions**
The `bugSolution.m` file provides solutions for both problems, demonstrating proper memory management techniques.

**How to Run**
1. Clone this repository.
2. Open the project in Xcode.
3. Run the application and observe the behavior (potential memory growth or crashes).
4. Then run the `bugSolution` and see the improved results.