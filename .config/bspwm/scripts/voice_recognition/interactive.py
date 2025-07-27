#!/home/popich/miniconda3/bin/python3
from pynput.keyboard import Controller, Key, Listener
import sounddevice as sd
import soundfile as sf
import tempfile
import queue
import subprocess
import threading


def on_f9_press(key):
    if key == Key.f9:
        stop_flag.set()


def notify(msg, submsg=None):
    subprocess.run(f"dunstify '{msg}' '{submsg}'", shell=True)


def callback(indata, frames_count, time_info, status):
    q.put(indata.copy())


def get_language():
    output = subprocess.check_output("setxkbmap -query", shell=True, text=True)
    output = output.splitlines()

    language = "en"
    for line in output:
        if "layout" in line:
            locales = line.split(":")[-1]
            language = locales.split(",")[0].strip()
    language = "en" if language == "us" else language
    return language


stop_flag = threading.Event()
q = queue.Queue()
frames = []
output_file_path = tempfile.mktemp(
    prefix="voice_recording_happyigrscript", suffix=".wav", dir="/tmp/"
)

language = get_language()
fq = 44100
channels = 1
dtype = "int16"

Listener(on_press=on_f9_press).start()

notify(f"Started recording in {language}", "F9 to stop")

print(output_file_path)
# Voice Recording
with sf.SoundFile(
    output_file_path,
    mode="w",
    samplerate=fq,
    channels=channels,
) as file:
    with sd.InputStream(samplerate=44100, channels=1, dtype=dtype, callback=callback):
        while True:
            if stop_flag.is_set():
                break
            file.write(q.get())

command = [
    "/home/popich/.config/bspwm/scripts/voice_recognition/whisper-cli",
    output_file_path,
    "-m",
    "/home/popich/Apps/whisper.cpp/models/ggml-medium-q5_0.bin",
    "-t",
    "10",
    "-l",
    language,
    "-np",
    "-nt",
]

command = " ".join(command)

notify("Recognizing...")
Controller().type(subprocess.getoutput(command))
notify("Recognizing completed")
