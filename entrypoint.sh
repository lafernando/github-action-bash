#!/bin/sh -l

echo $* | base64 -d | bash

