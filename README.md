# lilypond-docker - Bartev's git repo

lilypond docker image


* Add lilyjazz [https://github.com/OpenLilyPondFonts/lilyjazz](https://github.com/OpenLilyPondFonts/lilyjazz)
* copying heavily from [https://github.com/asbjoree/docker-lilypond](https://github.com/asbjoree/docker-lilypond)
* also copying from here [https://towardsdatascience.com/learn-enough-docker-to-be-useful-b0b44222eef5](https://towardsdatascience.com/learn-enough-docker-to-be-useful-b0b44222eef5)


# Setup docker repo

1. create repo (here, I called it `lilypond-docker`)
2. add submodules

    1. `lilyjazz`

           ```
           git submodule add https://github.com/OpenLilyPondFonts/lilyjazz.git
           ```
    2. `roman numerals`
    
    ```
    git submodule add https://github.com/davidnalesnik/lilypond-roman-numeral-tool.git
    ```
    
3. add `Dockerfile`
4. build docker image

    ```
    docker build -t lilydock .
    ```
    
    ```
    docker build -t lilydock:latest -t lilydock:v1.0 .
    ```    

5. start a container

    ```
    docker run -it -v ~/dev/github-bv/lily-jazz/:/home lilydock
    ```

    * This command runs docker in `interactive` mode.
    * mounts the directory `~/dev/github-bv/lily-jazz/` into `/home` in the container
      [mount directory](https://stackoverflow.com/questions/23439126/how-to-mount-a-host-directory-in-a-docker-container)
      * changes in host directory (on mac) will be available in container)
    * and other stuff

6. clean up when done

    ```
    docker ps -a  # get list of processes
    docker rm -f <processes name>
    ```
    
7. remove the image completely

    ```
    docker rmi lilydock
    ```
    

# build a file

1. start docker (see above)
2. build the file

```
lilypond /home/<filename>
```

# run lilypond

1. change to the `/home/linux-scores` directory
2. run `lilypond <filename>`

# run lilypond on all `*.ly` files

```
ls *.ly | xargs lilypond
```

or

```
find -name "*.ly" | xargs lilypond
```
