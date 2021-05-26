* Draft: 2021-05-26 (Wed)

# Imagemagick

Google search: ubuntu how to make a moving gif

* [How do I create an animated gif from still images (preferably with the command line)?](https://askubuntu.com/questions/648244/how-do-i-create-an-animated-gif-from-still-images-preferably-with-the-command-l)

> You can use [ImageMagick](http://www.imagemagick.org/script/index.php) package. Install it using the command:
>
> ```
> sudo apt-get install imagemagick
> ```
>
> Now you can create a `gif` from number of pictures(`jpg`) using:
>
> ```
> convert -delay 20 -loop 0 *.jpg myimage.gif
> ```

