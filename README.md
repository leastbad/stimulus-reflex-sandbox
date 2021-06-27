![Logo](/srs.svg)

    
# StimulusReflex Sandbox

StimulusReflex allows Rails developers to build reactive UIs without the need for SPAs like React. However, the server-side nature of Rails and SR has meant that - *until now* - it's been difficult to easily provide interactive examples that you can embed in a blog.

Enter... the StimulusReflex Sandbox.

Sandbox apps are based on [sr mini](https://github.com/hopsoft/sr_mini), the single-file StimulusReflex-powered Rails app template. We gently oil and massage the sr_mini until it runs happily inside of a [Glitch](https://glitch.com) container. Glitch is similar to Codepen (or one of the many competitors) except that it also allows you to run a server-side VM, without any of the standard security concerns.

People are free to try the demo, inspect the code behind it and "remix" their own projects based on it.

You can see some great examples of SR Sandbox apps on the [StimulusReflex Patterns](https://www.stimulusreflexpatterns.com/patterns/) site. 

## Demo

👉 The main sandbox site is [here](https://stimulus-reflex-sandbox.glitch.me/), which you can 
[![Remix on Glitch](https://cdn.gomix.com/f3620a78-0ad3-4f81-a271-c8a4faa20f86%2Fremix-button.svg)](https://glitch.com/edit/#!/remix/stimulus-reflex-sandbox)

## Tech Stack

- Ruby 3.0.1
- Rails 6.1.3.2
- *StimulusReflex* 3.5.0.pre0
- *CableReady* 5.0.0.pre0
- Redis 6.2.2
- **NO** database

#### Further Details
- [Tab isolation mode](https://docs.stimulusreflex.com/hello-world/setup#tab-isolation) is **on**
  
## Usage

You can embed a StimulusReflex Sandbox app into a post on [dev.to](https://dev.to/) with a simple short-code:

`{% glitch stimulus-reflex-sandbox app %}`

## FAQ/Gotchas

#### Help! My app is stuck in an install loop

Occasionally, building the assets via snowpack will fail, so you'll have to open the Glitch terminal (bottom left under *Tools*):

![Toolbar Screenshot](https://cdn.glitch.com/5d1b65f4-c468-4b36-bfe5-74a6315b9984%2FCleanShot%202021-05-09%20at%2014.11.00%402x.png?v=1620562298119)

and run

```bash
$ rm -rf node_modules
```

Your container will restart, installing fresh node modules, and the app should start correctly.

#### DB/Peristence/ActiveRecord

**There is no database**, due to the minimal and ephemeral nature of Glitch apps. However, [nulldb](https://github.com/nulldb/nulldb) is included so any persistence calls to ActiveRecord won't blow up the demo.

Feel free to emulate persistence using the `session` or Redis. If you feel adventurous, you can connect your sandbox to any external managed DB, though.

  
## Authors

- [@julianrubisch](https://www.github.com/julianrubisch)
- [@hopsoft](https://www.github.com/hopsoft)
- [@leastbad](https://www.github.com/leastbad)

  
## License

[MIT](https://choosealicense.com/licenses/mit/)

  
