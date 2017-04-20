#!/bin/bash
 
test -e /usr/bin/python || (apt-get -y update && apt-get install -y python-minimal)
