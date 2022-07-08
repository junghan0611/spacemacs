#!/bin/bash

fd -e org -x pandoc -t org {} -t markdown -o {.}.md
