# README

Follow instructions here
https://kylebaldw.in/posts/2019/running-lilypond-on-catalina/

Run lilypond using the docker command each time (can make an alias)

```
docker run --rm -v $(pwd):/app -w /app bartev/lilypond lilypond FILE
```


To build and push to dockerhub.

```
docker build -t bartev/lilypond .
docker push bartev/lilypond
```

To use with Frescobaldi

* Create a shell script to run lilypond


```

    # Set variable for edited args
    NEWARGS=()
    
    # This removes /private from the temp folder directory
    # This will make sure that it will match the tmp file
    # if it starts with /var or /private
    NEWDIR=${PWD/\/private/}
    
    for ARG in $@
    do
        # If the temp folder location is in the arg, remove it.
        # We need to do this as docker expects a relative path inside the
        # container and not the absolute outside the container
        if [[ $ARG =~ $NEWDIR ]]
        then
                NEWARGS+=("${ARG/$NEWDIR/.}")
        else
                NEWARGS+=("$ARG")
        fi
    done
    
    # Run Lilypond in the container with the new options.
    /usr/local/bin/docker run --rm -v $PWD:/app -w /app gpit2286/lilypond lilypond "${NEWARGS[@]}"
```

* make the script executable
* create a link to it in `/usr/local/bin` (optional?)
* in Frescobaldi, `main > Preferences > Lilypond Preferences`, 
click `Add+` and for the `lilypond command`, enter 
`/usr/local/bin/<lilypond-link>` where `<lilypond-link>` is 
what you called your script.

