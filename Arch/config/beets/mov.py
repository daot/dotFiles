# This program will only work if your naming scheme has info in []
# The program checks for all text up until the [] to determine if the
# folders are a match. For example, if the file name is:
#       B4E (2017) [24-Bit FLAC]
# The program will determine matches with: B4E (2017)

import collections
import os
import re
import shutil
import sys

# https://thispointer.com/python-how-to-get-list-of-files-in-directory-and-sub-directories/
def getListOfFiles(dirName):
    # create a list of file and sub directories
    # names in the given directory
    listOfFile = os.listdir(dirName)
    allFiles = list()
    # Iterate over all the entries
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            if fullPath.lower().endswith(
                (
                    "mp3",
                    "aac",
                    "m4a",
                    "mp4",
                    "flac",
                    "ogg",
                    "opus",
                    "ape",
                    "wv",
                    "mpc",
                    "wma",
                    "aiff",
                )
            ):
                allFiles.append(fullPath)
    return allFiles


# raw_path = eval(sys.argv[1]).decode("utf-8")
raw_path = sys.argv[1]

path_no_type = re.search(r".*[\\\/](.*\(\d*\))", raw_path).group(1)
count = dict()

for multi_folder in next(os.walk(os.path.dirname(raw_path)))[1]:
    if re.search(r"{}.*".format(re.escape(path_no_type)), multi_folder):
        folder_path = os.path.join(os.path.dirname(raw_path), multi_folder)
        count[folder_path] = len(getListOfFiles(folder_path))

sorted_count = {k: v for k, v in sorted(count.items(), key=lambda item: item[1])}

for release_folder in list(sorted_count)[:-1]:
    for folder_file in getListOfFiles(release_folder):
        try:
            os.makedirs(
                os.path.join(
                    list(sorted_count)[-1],
                    re.search(
                        r"{}[\\\/](.*)[\\\/]".format(re.escape(release_folder)),
                        folder_file,
                    ).group(1)
                    if re.search(
                        r"{}[\\\/](.*)[\\\/]".format(re.escape(release_folder)),
                        folder_file,
                    )
                    else "",
                ),
                exist_ok=True,
            )
            shutil.move(
                folder_file,
                os.path.join(
                    list(sorted_count)[-1],
                    re.search(
                        r"{}[\\\/](.*)".format(re.escape(release_folder)), folder_file
                    ).group(1),
                ),
            )
        except shutil.Error:
            pass

for release_folder in list(sorted_count.keys())[:-1]:
    for dirpath, _, _ in os.walk(release_folder, topdown=False):
        try:
            os.rmdir(dirpath)
        except OSError:
            pass
