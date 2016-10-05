# run-debug-php-file
Lets load a `PHP` or `HTML` file on default web browser. Simply load file or debugging with `Xdebug` and your favorite web browser

## Requirements

* `PHP` must be installed on your `PC` or `laptop`. `No needed specific version`
* `Xdebug` must be installed on `PHP extension folder`. https://xdebug.org/
* `php-debug` package `could be` installed on your atom editor.https://atom.io/packages/php-debug

## Parameters

* `Document Root Path`: The directory set as Root Server Directory to publish web projects (htdocs, WWW, etc.). By example: C:\xampp\htdocs
* `Default Xdebug Query String`: Default `Xdebug` query string configuration used for debug a `PHP` file on web browser. Default value is ?XDEBUG_SESSION_START=xdebug

## Commands

* `run-debug-php-file:run` - Load a `PHP` or `HTML` file on default web browser
* `run-debug-php-file:debug` - Load on `Xdebug` mode to `PHP` or `HTML` file using a default query string `?XDEBUG_SESSION_START=xdebug`
