#!/usr/bin/python
# @ Date    : 09.07.2020
# @ Time    : 09:38
# @ Author  : Jielei
import argparse


class C(object):

    def __init__(self):
        self.path = ""
        self.unix_path = ""

    @staticmethod
    def first_word(a_list):
        for i in a_list:
            if i != "":
                return i

    def convert_1(self):
        words = self.unix_path.split('/')
        if len(words) != 0:
            path = "C:\\cygwin64"
            for word in words:
                if word != "":
                    path += "\\"
                    path += word
            self.path = path

    def convert_2(self):
        words = self.unix_path.lstrip('/cygdrive/c').split('/')
        if len(words) != 0:
            path = "C:"
            for word in words:
                if word != "":
                    path += "\\"
                    path += word
            self.path = path

    def convert_1c(self):
        words = self.container_path.split('/')
        if len(words) != 0:
            path = "C:\\\\cygwin64"
            for word in words:
                if word != "":
                    path += "\\\\"
                    path += word
            self.path = path

    def convert_2c(self):
        words = self.container_path.lstrip('/cygdrive/c').split('/')
        if len(words) != 0:
            path = "C:"
            for word in words:
                if word != "":
                    path += "\\\\"
                    path += word
            self.path = path

c = C()

parser = argparse.ArgumentParser(description='convert unix path to windows path')
# add arguments
parser.add_argument('-p', dest='unix_path', help='convert path style from unix to windows')
parser.add_argument('-c', dest='container_path', help='convert path style from unix to windows container')
args = parser.parse_args(namespace=c)


if c.unix_path != "":
    if c.unix_path.startswith("/cygdrive/c"):
        c.convert_2()
    else:
        c.convert_1()

if c.container_path != "":
    if c.unix_path.startswith("/cygdrive/c"):
        c.convert_2c()
    else:
        c.convert_1c()

print(c.path)
