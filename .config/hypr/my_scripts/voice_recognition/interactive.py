#!/home/popich/.miniconda3/bin/python3
from pynput.keyboard import Controller, Key, Listener
import signal
import sys
import threading
import os
import sounddevice as sd
import soundfile as sf
import tempfile
import queue
import subprocess


# def on_f9_press(key):
#     if key == Key.f9:
#         stop_flag.set()
# listener = Listener(on_press=on_f9_press)
# listener.start()


def handle_signal(signum, frame):
    # This function is called when the signal is received
    print("Received stop signal. Shutting down gracefully...")
    stop_flag.set()


def notify(msg, submsg=None):
    subprocess.run(f"notify-send '{msg}' '{submsg}'", shell=True)


def callback(indata, frames_count, time_info, status):
    q.put(indata.copy())


def get_language():
    # TODO! make it work on hyprland
    # output = subprocess.check_output("setxkbmap -query", shell=True, text=True)
    # output = output.splitlines()
    #
    # language = "en"
    # for line in output:
    #     if "layout" in line:
    #         locales = line.split(":")[-1]
    #         language = locales.split(",")[0].strip()
    # language = "en" if language == "us" else language
    # return language
    return "en"


signal.signal(signal.SIGUSR1, handle_signal)
stop_flag = threading.Event()

with open("/tmp/voice_recorder.pid", "w") as f:
    f.write(str(os.getpid()))


q = queue.Queue()
frames = []
output_file_path = tempfile.mktemp(
    prefix="voice_recording_happyigrscript", suffix=".wav", dir="/tmp/"
)

language = get_language()
fq = 44100
channels = 1
dtype = "int16"


notify(f"Started recording in {language}", "F9 to stop")

print(output_file_path)
with sf.SoundFile(
    output_file_path,
    mode="w",
    samplerate=fq,
    channels=channels,
) as file:
    with sd.InputStream(samplerate=44100, channels=1, dtype=dtype, callback=callback):
        while True:
            # The thread running the on_f9_press function sets stop_flag
            if stop_flag.is_set():
                break
            # The main thread blocks here until an audio chunk is available
            file.write(q.get())

# # Voice Recording
# with sf.SoundFile(
#     output_file_path,
#     mode="w",
#     samplerate=fq,
#     channels=channels,
# ) as file:
#     with sd.InputStream(samplerate=44100, channels=1, dtype=dtype, callback=callback):
#         while True:
#             if stop_flag.is_set():
#                 break
#             file.write(q.get())

command = [
    "$HOME/Apps/whisper.cpp/build/bin/whisper-cli",
    output_file_path,
    "-m",
    "$HOME/Apps/whisper.cpp/models/ggml-medium-q5_0.bin",
    "-t",
    "10",
    "-l",
    language,
    "-np",
    "-nt",
]

command = " ".join(command)

output = subprocess.getoutput(command)[2:]
notify("Recognizing...", output)
Controller().type(output)
notify("Recognizing completed")

if os.path.exists("/tmp/voice_recorder.pid"):
    os.remove("/tmp/voice_recorder.pid")
