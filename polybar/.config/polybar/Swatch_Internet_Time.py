#!/usr/bin/python
from __future__ import print_function
import argparse, os, signal, sys, time, math


parser = argparse.ArgumentParser(
        description='Give date and time as Swatch Internet Time.'
        )
parser.add_argument('-t', '--tail', 
        help='Tail output mode; default: false', 
        action='store_true')
parser.add_argument('--tformat',
        help='Select output format using strftime formatted string; default: Swatch time format (d19.7.18) (e.g. ISO-8601 would be %%Y-%%m-%%d)',
        type=str,
        default='d%d.%m.%y')
parser.add_argument('--alt_format',
        help='Format to switch to after receiving a USR1 signal. This assumes tail output is set; default is None.',
        type=str,
        default=None)
parser.add_argument('--alt_delay',
        help='Sets the delay time of the alternate mode; default is 1.0 seconds.',
        type=float,
        default=1.0
        )
parser.add_argument('-n', '--delay', 
        help='Set the delay between refreshes in tail mode. If tail is not, then setting this does not do anything; default: 21.6 seconds.',
        type=float,
        default=86.4/4
        )
parser.add_argument('-v', '--verbose',
        help='Shows the PID for a few seconds before starting.',
        action='store_true')
arg = parser.parse_args()


# used to hold the state of the interupt
is_alt = False


def toggle_handler(signum, frame):
    global is_alt
    if arg.alt_format is not None:
        is_alt = not is_alt
        if arg.verbose: 
            print('Log: is_alt = {0}'.format(is_alt))
            
        print_datetime()


def handler_pid(signum, frame):
    print('PID: {0}'.format(os.getpid()))
    sys.stdout.flush()
    time.sleep(4)
    print_datetime()


def beat_time(t):
    return math.floor(
            (t.tm_hour + 1) * 41.666 +
            (t.tm_min  + 1) * 0.6944 +
            (t.tm_sec  + 1) * 0.011574
            ) % 1000


def time_to_beat():
    """
    Returns time until the next beat. Used for purposes of efficiency and 
    """


def print_swatch(current):
    print(time.strftime(arg.tformat, current), end='@')
    print('{0:03d}'.format(beat_time(current)))
    sys.stdout.flush()


def print_alt(current):
    print(time.strftime(arg.alt_format, current))
    sys.stdout.flush()


def print_datetime():
    global is_alt
    current = time.gmtime()

    if is_alt:
        print_alt(time.localtime())
        time.sleep(arg.alt_delay)
    else:
        print_swatch(current)
        time.sleep(arg.delay)


def is_alt_toggle():
    is_alt = True
    while True:
        is_alt = not is_alt
        yield is_alt


def main():
    if arg.verbose:
        print('PID: {0}'.format(os.getpid()))
        time.sleep(5)
    
    while True:
        print_datetime()
        if not arg.tail:
            break

if __name__ == '__main__':
    # register our signal handlers
    signal.signal(signal.SIGUSR1, toggle_handler)
    signal.signal(signal.SIGUSR2, handler_pid)
    main()
