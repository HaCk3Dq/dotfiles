# mute spotify ads
#

try:
    from spotify_status import song, artist
except:
    pass

from tempfile import gettempdir
from os import system, path, remove
from subprocess import run, PIPE
from re import search

cache_file = f'{gettempdir()}/spotify_status'
adIsPlaying = song in ['Advertisement', '', 'Spotify'] and artist == ''


def muteSink(sinkIndex, toggle):
    system(f'pactl set-sink-input-mute {sinkIndex} {toggle}')


def filterSinksByName(sinks, name):
    return filter(lambda sink: f'media.name = "{name}"' in sink, sinks)


def getIndexFromSink(sink):
    return int(search('Sink Input #(\\d+)', sink).group(1))


def findSpotifyIndices(sinks):
    return list(map(getIndexFromSink, filterSinksByName(sinks, 'Spotify')))


def getSinks():
    return run(['pactl', 'list', 'sink-inputs'], stdout=PIPE).stdout.decode().split('\n\n')


if path.exists(cache_file):
    if not adIsPlaying:
        for spotifySinkIndex in findSpotifyIndices(getSinks()):
            muteSink(spotifySinkIndex, 0)
        remove(cache_file)

elif adIsPlaying:
    sinks = getSinks()

    # if Spotify is focused, chromium based playback sink is created
    chromiumSink = list(filterSinksByName(sinks, 'Playback'))
    if len(chromiumSink):
        muteSink(getIndexFromSink(chromiumSink[0]), 1)

    for spotifySinkIndex in findSpotifyIndices(sinks):
        muteSink(spotifySinkIndex, 1)

    with open(cache_file, 'w') as _:
        pass
