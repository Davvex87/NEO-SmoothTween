###### © [NEO Inc](http://neo.bloxy.pro/) - 2022

###### This project is owned by the roblox company NEO Inc., all public assets are to be credited unless there's specification to do not so, otherwise your project may suffer credit or shutdown request.

# NEO-SmoothTween
This is a Tween module that will force server tweens into the client for
 > Smooth Tweens
 
 > Ease of coding
 
 > More Tweening possibilities
 
 > More Tweening features that roblox's TweenService doesn't have

## License and usage
This project is licensed under the [MIT license](LICENSE), you are allowed to copy, modify, merge, publish, distribute, sublicense and freely use this resource in your projects, **no credits are required**, but it would be nice to do so :)

# Features and stuff to do
 - [x] Supports all your ``TweenInfo.new()`` arguments, including but not limited to ``repeatCount``, ``reverse`` and ``delay``
 - [x] Play, Pausing, Stopping and Canceling tweens with 1 simple line of code
 - [x] 1 time use Tween() function for ease of scripting
 - [x] Garbage collection of SmoothTweens (finally prevent memory leaks on tweens)
 - [x] Tween override when a new tween with the same instance is declared
 - [x] Tweening models
 - [x] Tweening models size
 - [x] Tweening Color3Sequences and NumberSequences
 - [ ] Custom easing styles
 - [ ] All client tweens perfectly synched with server tweens
 - [ ] Debuging mode

# Instalation
### Adding to your Roblox Project
##### Adding through github files
Go [here](examples/SmoothTween.rbxm) and download the rbxm files, once downloaded import it to your roblox project via roblox studio, to import a file open your explorer and right click on ReplicatedStorage and select *Import from file*, **´** once imported rename the module to something like "*SmoothTween*", and because SmoothTween only runs on the server you may as well putit in ServerStorage, but thats up to you.

##### Adding directly from the module asset
Go [here](https://www.roblox.com/library/8403027349/Davvex87s-Tween-Module) and get the model, open your project on studio, open your toolbox, go to My Models and click on the SmoothTween model and folow the steps mensioned on the "Adding through github files" section after importing the model followed by the "**´**".

### Using the module without Project Installation
Just put `local ST = require(8403027349)` into any **SERVER** script and you're good to go! 
Don't worry about it overloading your game with tons of modules/instances, the script will detect if its already loaded, if not then it will load a new instance

# API

### Creating a new SmoothTween instance
*don't forget to reference SmoothTween in your script with a variable, ex: `local ST = require(8403027349)`)*

 #### GeneralTween.new(instance:Any, tweenInfo:TweenInfo, propertyTable:table):generalTween
   
   Creates a new generalTween instance, works just like TweenService:Create():tween
   
   - `instance` - Your object/instance that you want to tween
   - `tweenInfo` - Your TweenInfo, used by TweenService, see the original documentation [here](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo)
   - `propertyTable` - Your property [table](https://create.roblox.com/docs/scripting/luau/tables), used by TweenService (ex: {Position = Vector3.new(0,25,0)})
 
  
 #### ModelTween.new(instance:Model, tweenInfo:TweenInfo, cframe:cframe):modelTween
   
   Works just like GeneralTween.new():generalTween, but its used to tween a models CFrame as TweenService cannot tween models
   
   - `instance` - Your object/instance that you want to tween
   - `tweenInfo` - Your TweenInfo, used by TweenService, see the original documentation [here](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo)
   - `cframe` - Your new [CFrame](https://create.roblox.com/docs/scripting/luau/cframe)
 
  
 #### ModelSizeTween.new(instance:Model, tweenInfo:TweenInfo, size:vector3):modelSizeTween
   
   Works just like ModelTween.new():modelTween, but its used to tween a models size as TweenService cannot tween models
   
   - `instance` - Your object/instance that you want to tween
   - `tweenInfo` - Your TweenInfo, used by TweenService, see the original documentation [here](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo)
   - `size` - Your new [Vector3](https://create.roblox.com/docs/scripting/luau/vector3) size, **MODELS DOWN HAVE SIZE PROPERTIES, SO THE SIZE PROPERTY WILL BE USED AS A MULTIPLIER INSTEAD, NOT TO CHANGE THE MODELS EXACT SIZE!!**
 
  
 #### NumberSequenceTween.new(instance:numberSequence, tweenInfo:TweenInfo, numberSequence:numberSequence):numberSequenceTween
   
   Works just like GeneralTween.new():generalTween, but its used to tween number sequences as TweenService cannot tween sequences
   
   - `instance` - Your object/instance that you want to tween
   - `tweenInfo` - Your TweenInfo, used by TweenService, see the original documentation [here](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo)
   - `numberSequence` - Your new [number sequence](https://create.roblox.com/docs/reference/engine/datatypes/NumberSequence)
 
  
 #### ColorSequenceTween.new(instance:colorSequence, tweenInfo:TweenInfo, colorSequence:colorSequence):colorSequenceTween
   
   Works just like NumberSequenceTween.new():numberSequenceTween, but its used to tween color3 sequences as TweenService cannot sequences
   
   - `instance` - Your object/instance that you want to tween
   - `tweenInfo` - Your TweenInfo, used by TweenService, see the original documentation [here](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo)
   - `colorSequence` - Your new [colorSequence](https://create.roblox.com/docs/reference/engine/datatypes/ColorSequence)
 
  
 #### CustomTween.new(instance:Model, tweenInfo:TweenInfo, value:any):customTween
   
   Creates a new customTween instance, this is so you can create your own tween class 
   
   - `instance` - Your object/instance that you want to tween
   - `tweenInfo` - Your TweenInfo, used by TweenService, see the original documentation [here](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo)
   - `value` - Your custom value, you make your own logic with this!
 
  
