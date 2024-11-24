import sys
import signal
import time

def setupSignalHandlers():

    print('Registering SIGINT and SIGTERM signal handlers.')
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)


def signal_handler(sig, frame) -> sys.NoReturn:
    
    print('Signal handled: instructing application to stop.')
    sys.exit(0)
    


if __name__ == '__main__':
    setupSignalHandlers()
    while True:
        print('.', sep=' ', end='', flush=True)
        time.sleep(1)