#!/usr/bin/python
# call python with the flag -u or set the environment variable PYTHONUNBUFFERED=1
import argparse
import datetime
import math
import os
import signal
import time


class SwatchTime:

    @staticmethod
    def get_beat(now: datetime.datetime = datetime.datetime.now() + datetime.timedelta(hours = 1)):
        """
        Returns the current time as an integer representing the numbers of .beats into the day.
        :param now: A datetime object of some time.
        :return: int the number of beats in now's day
        """
        return math.floor(
            now.hour * 41.666 +
            now.minute * 0.6944 +
            now.second * 0.011574
        ) % 1000

    @staticmethod
    def print_swatch(now: datetime.datetime, time_format: str):
        # the 1 hour adjustment forward is so that the date that the beat occurs on is consistent
        now += datetime.timedelta(hours=1)
        beat = SwatchTime.get_beat(now)
        time_format = time_format.replace('{Beat}', '{0:03d}'.format(beat))
        time_format = time_format.replace('{beat}', str(beat))
        print(now.strftime(time_format))


class PrintCycle:

    def __init__(self, argv: argparse.Namespace):
        self.use_swatch = True
        self.args = argv

    def loop(self):
        while True:
            PrintCycle.print_datetime(self)
            time.sleep(self.args.delay)

    def print_datetime(self):
        if self.use_swatch:
            SwatchTime.print_swatch(datetime.datetime.utcnow(), self.args.format)
        else:
            PrintCycle.print_alt_format(self)

    def print_alt_format(self):
        # TODO move to using datetime module in-place of `time`
        if self.args.utc:
            now = time.gmtime()
        else:
            now = time.localtime()

        print(time.strftime(self.args.alt_format, now))

    def handler_toggle_format(self, signum, frame):
        """
        Only toggle if alt_format is set
        """
        if self.args.alt_format is not None:
            self.use_swatch = not self.use_swatch
            self.print_datetime()


def handler_print_pid(signum, frame):
    print('PID: {0}'.format(os.getpid()))
    time.sleep(4)


def alt_toggle(do_toggle=False):
    """
    Yields the current toggle state. The state is switched to its alternate stage (e.g. from True to False) if
    do_toggle is set to True. In this case the state is inverted and then yielded
    warning:
    This is currently the equivalent of a C function with a static variable inside. This has race-conditions, and
    doesn't support multiple threads calling it; the GIL should protect from this.
    I will probably make it a class that can be instantiated..
    :param do_toggle: Controls if the internal state will be changed.
    :return: The state of an internal variable named `is_alt`.

    """
    is_alt = True
    while True:
        if do_toggle:
            is_alt = not is_alt
        yield is_alt


def get_args(argv=None):
    # ArgumentDefaultsHelpFormatter can show the defaults for us
    parser = argparse.ArgumentParser(
        description='Give date and time as Swatch Internet Time.',
    )
    parser.add_argument('-t', '--tail',
                        help='Tail output mode. Default: False',
                        action='store_true')
    parser.add_argument('-v', '--verbose',
                        help='Shows the PID for a few seconds before starting. Default: False',
                        action='store_true')
    # TODO fix line wrapping in format
    parser.add_argument('-f', '--format',
                        help='A strftime compliant string to format the date portion of the Swatch time. '
                             'Default: Swatch time format (d19.7.18@000). '
                             '{Beat} displays the number of beats with left-padding zeros. '
                             '{beat} displays the number of beats without padding zeros. '
                             'Suggested alternative: ISO-8601 would be %%Y-%%m-%%d',
                        default='d%d.%m.%y@{Beat}')
    parser.add_argument('-d', '--delay',
                        help='Set the delay between refreshes in tail mode. If tail is not set, then this setting is '
                             'ignored. Default: 1 second.',
                        type=float,
                        default=1.0)
    parser.add_argument('--alt-format',
                        help='Format to switch to after receiving a USR1 signal. This assumes tail output is set. '
                             'Default: None',
                        type=str)

    group_tz = parser.add_mutually_exclusive_group()
    group_tz.add_argument('--utc',
                          help='Set the time zone to UTC (Coordinated Universal Time). Default: False.',
                          action='store_true')
    group_tz.add_argument('--local-time',
                          help='Set displayed to the local time zone. Default: True.',
                          action='store_false')
    return parser.parse_args(argv)


def main():
    arg = get_args()

    time_cycle = PrintCycle(arg)

    # do not set the signal handlers if we are on Windows
    if os.name != 'nt':
        signal.signal(signal.SIGUSR1, time_cycle.handler_toggle_format)
        signal.signal(signal.SIGUSR2, handler_print_pid)

    if arg.verbose:
        print('PID: {0}'.format(os.getpid()))

    time_cycle.loop()


if __name__ == '__main__':
    main()
