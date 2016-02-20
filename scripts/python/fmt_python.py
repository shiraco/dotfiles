#!/usr/bin/env python
# -*- coding: utf-8 -*-

import commands
import os


def ls():
    return commands.getoutput('find $PWD/* -type f -print | grep py').split('\n')


def get_python_files():
    return [path for path in ls() if os.path.splitext(path)[-1] == '.py']


def main():
    for path in get_python_files():
        commands.getoutput('pyformat -i %s' % path)
        commands.getoutput('isort %s' % path)
        print(path)


if __name__ == '__main__':
    main()
