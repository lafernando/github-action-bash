#!/bin/sh -l

echo $* | base64 -d | sh

