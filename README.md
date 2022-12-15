© [NEO Inc](http://neo.bloxy.pro/) - 2022

# NEO-SmoothTween
This is a Tween module that will force server tweens into the client for MAXIMIUM SMOOTHNESS

## License and usage
This project is licensed under the [MIT license](LICENSE), you are allowed to copy, modify, merge, publish, distribute, sublicense and freely use this resource in your projects, **no credits are required**, but it would be nice to do so :)

# Features and stuff to do
 - [x] Supports all your ``TweenInfo.new()`` arguments, including but not limited to ``repeatCount``, ``reverse`` and ``delay``
 - [x] Play, Pausing, Stopping and Canceling tweens with 1 simple line of code
 - [x] 1 time use Tween() function for ease of scripting
 - [x] Garbage collection of SmoothTweens (finally prevent memory leaks on tweens)
 - [x] Tween override when a new tween with the same instance is declared
 - [x] Tweening models
 - [ ] Tweening models size
 - [ ] Tweening Color3Sequences and NumberSequences
 - [ ] Custom easing styles
 - [ ] All client tweens perfectly synched with server tweens
 - [ ] Debuging mode

# Instalation
### Adding to your Roblox Project
##### Adding through github files

##### Adding directly from the module asset

### Using the module without Project Installation
Just put `local ST = require(8403027349)` into any **SERVER** script and you're good to go! 
Don't worry about it overloading your game with tons of modules/instances, the script will detect if its already loaded, if not then it will load a new instance
