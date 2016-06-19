#!/usr/bin/python
import json
import os
import re
import shutil
import sys
import time

__author__ = 'Sebastien LANGOUREAUX'

GOCD_PATH = '/var/lib/go-server'

class ServiceRun():

  def init_data_folder(self):
      global GOCD_PATH

      if os.path.isdir(GOCD_PATH + '/workdir/plugins/external') is False:
          os.system('mkdir -p ' + GOCD_PATH + '/workdir/plugins/external')

      if len(os.listdir(GOCD_PATH + '/workdir')) < 3:
          os.system('mv /app/plugins/* ' + GOCD_PATH + '/workdir/plugins/external/')
          os.system('chown -R go:go ' + GOCD_PATH)


if __name__ == '__main__':

    serviceRun = ServiceRun()
    serviceRun.init_data_folder()
