import os
import re
import shutil
import sys
from pathlib import Path
from soundfile import SoundFile

raw_path = eval(sys.argv[1]).decode('utf-8')
if re.search("\[\d\d-Bit\sFLAC\]", raw_path) is not None:
    path_16 = re.search(r"(.+)\[\d\d-Bit\sFLAC\]", raw_path).group(1) + "[16-Bit FLAC]"
    path_24 = re.search(r"(.+)\[\d\d-Bit\sFLAC\]", raw_path).group(1) + "[24-Bit FLAC]"
    bit_16 = []
    bit_24 = []

    for filename in Path(path_16).rglob('*.[fF][lL][aA][cC]'):
        with SoundFile(filename) as f:
            if f.subtype == "PCM_16":
                bit_16.append(filename)
            if f.subtype == "PCM_24":
                bit_24.append(filename)

    for filename in Path(path_24).rglob('*.[fF][lL][aA][cC]'):
        with SoundFile(filename) as f:
            if f.subtype == "PCM_16":
                bit_16.append(filename)
            if f.subtype == "PCM_24":
                bit_24.append(filename)

    if len(bit_16) > 0 and len(bit_24) > 0:
        if len(bit_16) > len(bit_24):
            for f in os.listdir(path_24):
                shutil.move(os.path.join(path_24, f), path_16)
            os.rmdir(path_24)
        else:
            for f in os.listdir(path_16):
                shutil.move(os.path.join(path_16, f), path_24)
            os.rmdir(path_16)
