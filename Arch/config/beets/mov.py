# This program will only work if your naming scheme has quality in []
# The program checks for all text up until the [] to determine if the
# folders are a match. For example, if the file name is:
#       B4E (2017) [24-Bit FLAC]
# The program will determine matches with: B4E (2017)
# Any text after the [] will not be used to determine matches.

import collections
import os
import re
import shutil
import sys

raw_path = eval(sys.argv[1]).decode('utf-8')

path_no_type = re.search(r".*[\\\/](.*)\[", raw_path).group(1)
count = dict()

for multi_folder in next(os.walk(os.path.dirname(raw_path)))[1]:
    if re.search(r'{}\[.*\]'.format(re.escape(path_no_type)), multi_folder):
        for single_folder, _, file_names in os.walk(os.path.join(os.path.dirname(raw_path), multi_folder)):
            for f in file_names:
                if multi_folder in count:
                    count[os.path.join(os.path.dirname(raw_path), multi_folder)] += 1
                else:
                    count[os.path.join(os.path.dirname(raw_path), multi_folder)] = 1

sorted_count = collections.OrderedDict(sorted(count.items()))

for multi_folder in next(os.walk(os.path.dirname(raw_path)))[1]:
    if re.search(r'{}\[.*\]'.format(re.escape(path_no_type)), multi_folder):
        for single_folder, _, file_names in os.walk(os.path.join(os.path.dirname(raw_path), multi_folder)):
            for f in file_names:
                try:
                    shutil.move(os.path.abspath(os.path.join(single_folder, f)), os.path.abspath(list(sorted_count.keys())[-1]))
                except shutil.Error:
                    pass

for path in list(sorted_count.keys())[:-1]:
    for _, folders, _ in os.walk(os.path.join(os.path.dirname(raw_path), path), topdown=False):
        os.rmdir(os.path.join(os.path.dirname(raw_path), path, *folders))
