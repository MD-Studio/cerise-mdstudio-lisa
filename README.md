# Cerise specialisation for MDStudio and LISA (SURFSARA)

This repository contains a Cerise specialisation for MDStudio and Lisa(Surfsara).
It's work in progress.

For more information about Lisa see the [surfsara page](https://userinfo.surfsara.nl/systems/lisa).

## Running

### Install the service via Docker

Get the specialised service from Docker:

```bash
docker pull mdstudio/cerise-mdstudio-lisa:develop
```

### Start it

```bash
docker run --name=cerise-mdstudio-lisa -p 29593-29594:29593-29594 --env CERISE_USERNAME=<username> --env CERISE_PASSWORD=<password> mdstudio/cerise-mdstudio-lisa:develop
```
This will give a warning about the Slurm version not being supported, which
you can safely ignore.

If this is the first time you run this Cerise specialisation, it will stage a
bunch of files to a directory named `.cerise` in your home directory on LISA.
This may take a bit of time, so it may take a moment for the service to start
processing jobs. You can submit them right away though.

Note that inserting the user name and password via an environment variable is
not ideal, amongst others it leaves a copy of them in your `~/.bash_history`
(from where you may want to delete it now, although it should be only readable
to you yourself). Overlay-mounting a file would be another option, but that
means that the username and password are stored on disk. If we start the service
from Python using docker-py, then the environment variables would probably be
the better option.

## Legal Notes

This repository is covered by the following license grant:

   Copyright 2018 Netherlands eScience Center and VU University Amsterdam

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
