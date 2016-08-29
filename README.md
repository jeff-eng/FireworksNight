# FireworksNight
Repo following Project 20: Fireworks Night with NSTimer and color blending.

## Concepts learned/practiced
* Using GameplayKit's random number generator to randomly select case within a switch statement
  * Example:

    ```Swift
      switch GKRandomSource.sharedRandom().nextIntWithUpperBound(3) {
        case 0:
            firework.color = UIColor.cyanColor()
            firework.colorBlendFactor = 1

        case 1:
            firework.color = UIColor.redColor()
            firework.colorBlendFactor = 1

        case 2:
            firework.color = UIColor.greenColor()
            firework.colorBlendFactor = 1

        default:
            break
      }

    ```

* NSTimer
  * Example

    ```Swift

    gameTimer = NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)

    ```
* followPath()
  * Example:

    ```Swift

      let move = SKAction.followPath(path.CGPath, asOffset: true, orientToPath: true, speed: 200)

    ```
* Color blending using colorBlendFactor property - able to recolor sprites dynamically without losing app performance.
* Responding to shake gesture - shaking detonates the fireworks that were touched

## Attributions
[Project 20L Fireworks Night with NSTimer and color blending](https://www.hackingwithswift.com/read/20/overview)
