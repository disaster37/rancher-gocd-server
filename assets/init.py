#!/usr/bin/python
import json
import os
import re
import shutil
import sys
import time

__author__ = 'Sebastien LANGOUREAUX'

GOCD_PATH = '/opt/alfresco'

class ServiceRun():

  def init_data_folder(self):
      global GOCD_PATH

      if len(os.listdir(GOCD_PATH + '/wordir')) < 3:
          os.system('chown -R go:go ' + GOCD_PATH)
          os.system('/app/install-plugin.sh')








if __name__ == '__main__':

    serviceRun = ServiceRun()
    serviceRun.init_data_folder()
