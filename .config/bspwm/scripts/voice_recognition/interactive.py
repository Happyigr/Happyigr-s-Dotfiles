#!/home/popich/miniconda3/bin/python3
import subprocess
import threading
from subprocess import PIPE, Popen

from pynput.keyboard import Controller, Key, Listener

output = subprocess.check_output("setxkbmap -query", shell=True, text=True)
output = output.splitlines()

language = ""
for line in output:
    if "layout" in line:
        locales = line.split(":")[-1]
        language = locales.split(",")[0].strip()
language = "en" if language == "us" or language == "" else language

stop_flag = threading.Event()


def on_f9_press(key):
    if key == Key.f9:
        stop_flag.set()


Listener(on_press=on_f9_press).start()

command = [
    "/home/popich/.config/bspwm/scripts/voice_recognition/whisper-stream",
    "-m",
    "/home/popich/Apps/whisper.cpp/models/ggml-medium-q5_0.bin",
    "-t",
    "10",
    "--step",
    "400",
    "--length",
    "2000",
    "-l",
    language,
    "-vth",
    "1",
]

controller = Controller()

with Popen(command, stdout=PIPE, stderr=PIPE, universal_newlines=True) as p:
    for raw_line in p.stdout:
        line = raw_line.strip()
        if line == "[Start speaking]":
            subprocess.run(
                f'dunstify "Started Recognition in {language}" "F9 to stop"', shell=True
            )
        elif stop_flag.is_set():
            subprocess.run('dunstify "Ended Recognition"', shell=True)
            break
        elif "\x1b[2K" not in line:
            controller.type(line + " ")
