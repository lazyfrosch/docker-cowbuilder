Cowbuilder in Docker
====================

The copy-on-write chroot build tool for Debian.

Also see my [lazyfrosch/mock container](https://hub.docker.com/r/lazyfrosch/mock/)

## Usage

Pull the image from Docker Hub

    docker pull lazyfrosch/cowbuilder

Have a look on the helper script `cowbuilder.example.sh` here and modify it to your needs.

    vim cowbuilder.example.sh
    cp cowbuilder.example.sh $HOME/bin/cowbuilder
    chmod +x $HOME/bin/cowbuilder

Then you can run cowbuilder like it would be installed locally.

In addition the cowbuilder script starts `cowbuilder-auto`, which will take care of creating
and updating the base chroots.

    cowbuilder login --distribution stretch
    # will create / update and give you a prompt inside

## Install helper scripts

    cp cowbuilder-helper.example.sh ~/bin/cowbuilder-helper
    edit ~/bin/cowbuilder-helper  # to your needs
    cd ~/bin/
    ln -svf cowbuilder-helper cowbuilder
    ln -svf cowbuilder-helper cowbuilder-auto
    ln -svf cowbuilder-helper uscan
    ln -svf cowbuilder-helper dpkg-source

## Important notes

About the helper script.

* For correct permissions to work the helper script uses your UID and GID to write files
* The helper script mounts your HOME directory to the container
* Put the cache volume to a persistent location on your host

## License

    Copyright 2017 Markus Frosch <markus@lazyfrosch.de>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
