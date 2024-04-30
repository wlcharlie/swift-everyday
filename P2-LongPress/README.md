# P2 LongPress

## What I learned

### Code

- Using struct value in `@State` won't update the view since it is a `value` type. Use class instead.
- Instead of `@State`, use `@ObservedObject` to observe the changes of the class.
- `timer`: create a time using `Timer.scheduleTimer` and will return the instance of the timer.
  - `invalidate()`: stop the timer.
- `LongPressGesture`
  - `minimumDuration`: the minimum duration the user must press before the gesture succeeds.
  - `updating()`: called when the gesture's value is changing
  - `.onEnded`: called when the gesture ends(when the minimumDuration is reached), not user lifts the finger.
- `onLongPressGesture`: more easier way to use long press gesture.
- To achieve to detect the user is still pressing, set the `minimumDuration` to a very large number or even `.infinity` and use the `onChanging` to detect the user pressing state.

### UI

- `Spacer`: just spacing :)
