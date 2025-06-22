## Flutter Challenge

**Welcome to the CarOnSale Flutter Coding Challenge!**

We're excited to see your skills and knowledge about Flutter and Dart in
action. Your task is to build a simple application with the following features:

### Step 1: User Identification

Firstly, we need the user to enter their unique identification data. The
specifics of what and how are up to you.

> Bonus task: Save this data locally so that this step can be automatically
> skipped on subsequent app runs.

### Step 2: Error Handling

Next, the user should enter the VIN of an abstract vehicle (this will be used to
get auction data in later steps). Use this VIN within the provided `httpClient`
from the `CosChallenge` class to fetch fake data from the web, *(feel free to
check `main()` body in the code)*. Here's an example:

```dart
final response = await CosChallenge.httpClient.get(Uri.https('anyUrl'), headers: {CosChallenge.user: 'someUserId'});
```

The goal of this step is to display and handle potential errors (like
deserialization, network, or server issues) to the user.

> Bonus task: Show the user the specific error and how to resolve it on their
> side and/or validate the VIN input.

### Step 3 *(Optional)*: Intermediate State Processing

If you receive a status code 300 in the second step, show the user the options
for selecting the correct vehicle.  > Bonus task: Consider the "similarity"
parameter (ranging from 0 to 99) you received. The higher the value, the better
the match.

### Step 4: Data Caching

If you receive a success status code in the second step, save the data
persistently and locally, then navigate the user to step 5.

> Bonus task: If an error occurs during an additional request, allow the user to
> see the previously fetched data (if any) from the local cache.

### Step 5 *(Optional)*: Navigation and UX/UI

Display the auction data: price, model, and UUID.

> Bonus task: Consider the feedback received and whether it was positive or
> negative, and display this to the user as well.

---

## General Hints

We hope you enjoy this coding challenge. It shouldn't take more than a few hours
to complete, but feel free to spend as much time as you'd like. The code and
imports should not be modified, but any part of the code can be used outside of
this file (for example, for code generation or deserialization).

We value testable, maintainable, self-documented, and clean code. Feel free to
use as few or as many dependencies as you want (the only mandatory one is
[HTTP](https://pub.dev/packages/http) from Dart Team), any SDK version, any
UX/UI, any architecture, platform, etc. It's not about what tools or patterns
you use, but how and why you use them.

> [!TIP] Some tasks don't have universally correct or incorrect solutions. Their
> purpose is to understand your problem-solving approach.

If you have any questions, feel free to contact us at
<coding-challenge@caronsale.de>

## Steps to Submit the Challenge

0. Familiarize yourself with the code by playing around with it
   [here](https://dartpad.dev/?id=9081fdd1aed3bd8a051ef6de96bf54bf). Use the Run
   button to see different responses (*Optional*)
1. Copy the code from
   [DartPad](https://dartpad.dev/?id=9081fdd1aed3bd8a051ef6de96bf54bf),
   [Gist](https://gist.githubusercontent.com/akaTJ/9081fdd1aed3bd8a051ef6de96bf54bf),
   or the raw Dart
   [file](https://gist.githubusercontent.com/akaTJ/9081fdd1aed3bd8a051ef6de96bf54bf/raw/4639f37094a4434fc2fe6631f153d849ef7581f3/snippet.dart)
2. Create a new Flutter project
3. Complete the tasks mentioned above to solve the coding challenge
4. Commit and push all your changes to your repository
5. Notify us at <coding-challenge@caronsale.de> that you've completed the
challenge and provide a link to your project. We're excited to see your work!
Ausb
