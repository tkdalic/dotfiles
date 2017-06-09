#!/Users/rikutakada/.pyenv/shims python
# -*- coding: utf-8 -*-
import os
import sys
from datetime import datetime

if __name__ == '__main__':
    if len(sys.argv) == 0:
        print('引数を指定してください')
    if sys.argv[1][-3:] != '.py':
        print('pythonファイルを指定してください')
    filepy = sys.argv[1]
    filetxt = sys.argv[1][:-2] + 'txt'
    os.system('python ' + filepy + '>>' + filetxt)
    os.system('mv ' + filetxt + ' $OUTPUT/')
    os.system('cd $OUTPUT && git add . && git commit -m "push time is' +
              datetime.now().strftime('%Y/%m/%d  %H:%M:%S') + '" && git push && cd $OLDPWD')
