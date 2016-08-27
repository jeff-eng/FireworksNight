# FireworksNight
Repo following Project 20: Fireworks Night with NSTimer and color blending

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
