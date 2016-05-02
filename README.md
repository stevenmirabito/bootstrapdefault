CSH theme for Piwigo
====================

A modern and responsive theme for [Piwigo](http://piwigo.org/) built with standard [Bootstrap](http://getbootstrap.com/) components and the [CSH theme](https://github.com/ComputerScienceHouse/bootstrap-csh).

## Features

* Fully responsive and fully featured theme based on Bootstrap's default theme
* Browse albums as a grid or list with selectable thumbnail sizes
* Image size selection enabled for better viewing of images and slide show on higher resolution monitors, with
  responsive scaling of over sized images
* Slide in side bar with image information
* Share buttons for Twitter, Facebook and Google+
* Gravatar support for comment avatars
* Masonry style tag view
* Configuration page in admin to customise features such as Bootstrap theme, social integration and comments
* Works with all supported languages (admin page is currently English only)

## Installing

In your Piwigo install directory:

```
git clone https://github.com/stevenmirabito/csh-piwigo.git csh
cd csh
git submodule init
git submodule update
```

## Get the source

Clone this [Github repository](https://github.com/stevenmirabito/csh-piwigo.git):

    git clone https://github.com/stevenmirabito/csh-piwigo.git
    
*Add the `--recursive` option to include the submodules or run `git submodule update --init` after cloning.*

## Bundled libraries

* [Bootstrap](http://getbootstrap.com/) - Included as a submodule
* [Selectize.js](http://brianreavis.github.io/selectize.js/) - Included as a submodule (the bundled version
with Piwigo 2.7.x is ignored in favour of the latest build with Bootstrap styling)
* [CSH Bootstrap Theme](https://github.com/ComputerScienceHouse/bootstrap-csh/) - Included as a submodule